import mysql.connector
db=mysql.connector.connect(
    host="localhost",
    user="root",
    password="#Sasi@2003",
    database="practice"
)
cursor=db.cursor()
cursor.execute("Create table emp(empno int auto_increment \
               primary key, ename varchar(50) \
               not null, salary int not null)")
cursor.execute("show tables")
for x in cursor:
    print(x)
