rootPassword = input("Enter mysql root password: ") #prompt user to give mysql password

# Program to show various ways to read and 
# write data in a file. 
file1 = open("mysqlPassword.txt","w")
  
# \n is placed to indicate EOL (End of Line) 
file1.write(rootPassword) #save the password in .txt file so can be used in other file
file1.close() #to change file access modes 