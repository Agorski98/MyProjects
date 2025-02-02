
import pandas as pd
from sqlalchemy import create_engine

def configurationScript():
    flat_filePath="B:/1_Praca/Git/MyProjects/python_ETL/IncrementalLoad/LabData.csv"
    connection_string = "mssql+pyodbc://:AG\Asus:@AG\AG_DWH/Sample?driver=ODBC+Driver+17+for+SQL+Server"
    select_data = "SELECT TITLE FROM [hol].[Lab]"
    return flat_filePath, connection_string,select_data

def flat_file_source(location):
    return pd.read_csv(location)
    
def select_query(query,connection_string):
    engine = create_engine(connection_string)
    return pd.read_sql(query,engine)

#def lookup_function(source_file_data,destination_db_data):
#    return match_data, no_match_data

def main():
   flat_filePath, connection_string,select_data = configurationScript()
   csv_data = flat_file_source(flat_filePath)
   destination_db_data = select_query(select_data,connection_string)
   print(csv_data)
   print(destination_db_data)
    

main()

