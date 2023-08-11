import mysql.connector
db=mysql.connector.connect(
    host="localhost",
    user="root",
    password="#Sasi@2003",
    database="practice"
)
cursor=db.cursor()
cursor.execute("delete from emp")
cursor.execute("insert into emp(ename,salary) values(\"Akash\",1000), \
(\"Dinesh\",2000),(\"Ashwin\",3000)")
db.commit()
cursor.execute("select * from emp")
for i in cursor:
    print(i)
