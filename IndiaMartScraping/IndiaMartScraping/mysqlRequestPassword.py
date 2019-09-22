import dataset # Lib for db operations

rootPassword = input("Enter mysql root password: ") #prompt user to give mysql password

# Program to show various ways to read and 
# write data in a file. 
file1 = open("mysqlPassword.txt","w")
  
# \n is placed to indicate EOL (End of Line) 
file1.write(rootPassword) #save the password in .txt file so can be used in other file
file1.close() #to change file access modes

dbConnectionString = dataset.connect('mysql+pymysql://root:{}@127.0.0.1:3306'.format(rootPassword)) # establish a db connection string
createDataBase = 'CREATE DATABASE indiamart;'
dbConnectionString.query(createDataBase) # make a databse since it won't be present the first time