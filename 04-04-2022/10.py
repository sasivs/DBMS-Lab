import mysql.connector
db=mysql.connector.connect(
    host="localhost",
    user="root",
    password="#Sasi@2003",
    database="practice"
)
cursor=db.cursor()
cursor.execute("select * from emp")
print(cursor.fetchall())

