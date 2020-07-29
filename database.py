import MySQLdb 
 
def db_insert(plate,im_path):
    #print(im_path)
    try: 
        #print("Connecting to database using MySQLdb") 
        db_connection = MySQLdb.connect(host='localhost', db='openanpr', user='root', passwd= '') 
        #print("Succesfully Connected to database using MySQLdb!") 
        
        cur = db_connection.cursor()
        
        sql = "INSERT INTO cardata (`plate`, `path`) VALUES ('%s', '%s')" %(plate,im_path)
        print(sql)
        
        cur.execute(sql)
        db_connection.commit()
        
        cur.close()
        
        db_connection.close()
        print("Data Inserted into Database\n")           
    except:
        print("Error: Database Connection Failed")
    