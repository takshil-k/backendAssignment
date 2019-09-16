import dataset
rootPassword = input("Enter mysql root password: ")
db = dataset.connect('mysql+pymysql://root:{}@127.0.0.1:3306/id9787903_atlantis'.format(rootPassword))
print(db)
print(db.tables)