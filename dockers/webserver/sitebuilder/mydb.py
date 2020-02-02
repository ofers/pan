import mysql.connector

config = {
    'user': 'root',
    'password': '1q2w3e',
    'host': '192.168.181.140',  # Host ip - need to find a better way
    'raise_on_warnings': True,
    # 'OPTIONS': {
    #     'charset': 'utf8mb4',
    # }
}

DB_NAME = 'panaya'


# Historical - used for testing
def initdb():
    cnx = mysql.connector.connect(**config)
    cursor = cnx.cursor()
    cursor.close()
    cnx.close()


# Getting data from DB for HTML table
def get():
    cnx = mysql.connector.connect(**config, database=DB_NAME)
    cursor = cnx.cursor(dictionary=True)
    query = ("SELECT As_company.Company_Name, As_account.Account_Name, As_account.Company_ID, As_project.* FROM "
             "As_company, As_account, As_project WHERE As_company.Company_ID = As_account.Company_ID "
             "AND As_account.Account_ID = As_project.Account_ID")
    cursor.execute(query)
    # Rearrange data from DB to match HTML table needs
    return data_rearranger(cursor.fetchall())
    cursor.close()
    cnx.close()


# numbers to words switcher
def status_switcher(arg):
    switcher = {
        0: "Inactive",
        1: "Active",
        2: "Frozen",
    }
    return switcher.get(arg)


# Update Project_Status values in data
def data_rearranger(mydata):
    newlist = []
    for dic in mydata:
        for key, value in dic.items():
            if key == "Project_Status":
                newvalue = status_switcher(value)
                d1 = {"Project_Status": newvalue}
                dic.update(d1)
        newlist.append(dic)
    return newlist
