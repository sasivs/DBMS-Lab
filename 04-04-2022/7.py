import mysql.connector
db=mysql.connector.connect(
    host="localhost",
    user="root",
    password="#Sasi@2003",
    database="sakila"
)
cursor=db.cursor()
cursor.execute("create table employee(empno int not null)")
cursor.execute("drop table employee")
cursor.execute("show tables")
for i in cursor:
    print(i)
