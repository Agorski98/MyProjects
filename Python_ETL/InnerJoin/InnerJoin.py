

###################################################### inner join

import pandas as pd
from sqlalchemy import create_engine, Table, Column, Integer, String, MetaData, literal
from sqlalchemy.orm import query, sessionmaker
from sqlalchemy.util.typing import Literal


def configurationScript():
    engine = create_engine("mssql+pyodbc://:AG\Asus:@AG\AG_DWH/Sample?driver=ODBC+Driver+17+for+SQL+Server") #create_engine
    query_configuration = "SELECT file_path,query,destination_table_name,table_schema FROM hol.configuration WHERE task_number=1"
    
    configuration_table = pd.read_sql(query_configuration,engine)

    return configuration_table['file_path'][0],configuration_table['query'][0],configuration_table['destination_table_name'][0],configuration_table['table_schema'][0],engine

def csv_source(flat_filePath):
    return pd.read_csv(flat_filePath,names=['Title' ,'Description', 'CategoryID','Level','Status','PublishedDate'],skiprows=[0])

def table_source(engine,query):
    return pd.read_sql(query,engine)

def inner_join(destination_db_data,source_file_data):
    return  pd.merge(destination_db_data,source_file_data,on='Title',how='inner',indicator=True)

def update_common_data(engine,match_data,table_schema,destination_table_name):
    metadata = MetaData()
    metadata.reflect(bind=engine,schema=table_schema, only=[destination_table_name])
    table_name_and_schema = table_schema + '.'+ destination_table_name
   # print(metadata.tables.keys())  #<-show avaible tables
    my_tab = metadata.tables[table_name_and_schema]
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

        print("Update incorect")
    finally:
        session.close()
    print("Update is finish")

def main():
    
    flat_filePath, query,destination_table_name,table_schema,engine = configurationScript() #configuration
    source_file_data = csv_source(flat_filePath)  #data from file
    destination_db_data = table_source(engine,query) #data from database
    match_data = inner_join(destination_db_data,source_file_data) #inner join
    #print(match_data['PublishedDate'])
    update_common_data(engine,match_data,table_schema,destination_table_name) #update
    

main()










