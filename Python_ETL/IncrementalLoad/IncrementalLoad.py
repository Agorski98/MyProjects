

###################################################### incremental insert data
from heapq import merge
from sqlite3 import connect
from tokenize import String
from turtle import title
import pandas as pd
from sqlalchemy import create_engine, Table, Column, Integer, String, MetaData
from sqlalchemy.orm import sessionmaker


def configurationScript():
    flat_filePath="B:/1_Praca/Git/MyProjects/python_ETL/IncrementalLoad/LabData.csv"
    connection_string = "mssql+pyodbc://:AG\Asus:@AG\AG_DWH/Sample?driver=ODBC+Driver+17+for+SQL+Server"
    select_data = "SELECT Title FROM [hol].[Lab]"
    return flat_filePath, connection_string,select_data

def flat_file_source(location):
    return pd.read_csv(location,names=['Title' ,'Description', 'CategoryID','Level','Status','PublishedDate'],skiprows=[0])
    
def select_query(query,engine):
    return pd.read_sql(query,engine)

def lookup_function(source_file_data,destination_db_data):
    marge_data = pd.merge(destination_db_data,source_file_data,on='Title',how='right',indicator=True)
    match_data = marge_data[marge_data['_merge']=='both']
    no_match_data = marge_data[marge_data['_merge']=='right_only']
    return match_data, no_match_data

def destination_source(engine,type_off_query,data):
    metadata = MetaData()
    metadata.reflect(bind=engine,schema='hol',only=['Lab'])
   
    #  print(metadata.tables.keys())  #<-show avaible tables
    my_tab = metadata.tables['hol.Lab']
    type_off_query(engine,data,my_tab)

def insert_row(engine,no_match_data,my_tab):   
    Session = sessionmaker(bind=engine)
    session = Session()
    try:
        for row in no_match_data.values:
            insert_data = my_tab.insert().values(
                Title=row[0],
                Description=row[1],
                CategoryID=row[2],
                Level=row[3],
                Status=row[4],
                PublishedDate=row[5])
        session.execute(insert_data)
        session.commit()
    except :
        print("Insert niepoprawny")
    finally:
        session.close()
    

   
def update_row(engine,match_data,my_tab):
    Session = sessionmaker(bind=engine)
    session = Session()
    try:
        for row in match_data.values:
            update = my_tab.update().where(my_tab.c.Title==row[0]).values(
                Title=row[0],
                Description=row[1],
                CategoryID=row[2],
                Level=row[3],
                Status=row[4],
                PublishedDate=row[5])
        session.execute(update)
        session.commit()
    except:
        print("Update niepoprawny")
    finally:
        session.close()
   

def main():
   flat_filePath, connection_string,select_data = configurationScript() #configuration 

   csv_data = flat_file_source(flat_filePath) #import csv data
   
   engine = create_engine(connection_string) #create_engine
   
   database_data = select_query(select_data,engine) #import database data
   
   match_data, no_match_data = lookup_function(csv_data,database_data) #lookup function to return two dataFrame with match and no match data
   
   destination_source(engine,insert_row,match_data) #insert new data
   
   destination_source(engine,update_row,match_data) #update old data

main()

