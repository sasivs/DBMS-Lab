import mysql.connector
db=mysql.connector.connect(
    host="localhost",
    user="root",
    password="#Sasi@2003",
    database="practice"
)
cursor=db.cursor()
eno=int(input("Enter eno: "))
cursor.execute("select * from emp where empno="+str(eno))
for i in cursor:
    print(i)
