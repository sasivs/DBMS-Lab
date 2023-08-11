import mysql.connector
db=mysql.connector.connect(
    host="localhost",
    user="root",
    password="#Sasi@2003",
    database="practice"
)
cursor=db.cursor()
cursor.execute("delete from emp where empno=8 and ename=\"Dinesh\"")
db.commit()
cursor.execute("select * from emp")
for i in cursor:
    print(i)
