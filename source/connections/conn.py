from CONNECTION_STRING import SQL_DB,SQL_DRIVER,SQL_SERVER,SQL_USER,SQL_PASS,SQL_DRIVER_2
import pyodbc

baseConnString = "Driver={{{Driver}}};Server={Server};Database={Database};Trusted_Connection=yes"
connString = baseConnString.format(Driver = SQL_DRIVER, Server = SQL_SERVER, Database = SQL_DB)
print(connString)
def conn(connString):
    conn = pyodbc.connect(connstring=connString)
    return {
            'cursor': conn.cursor(),
            'conn': conn
            }

conn = conn(connString)