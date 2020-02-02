import mysql.connector

config = {
    'user': 'root',
    'password': '1q2w3e',
    'host': 'db',
    'raise_on_warnings': True,
    # 'OPTIONS': {
    #     'charset': 'utf8mb4',
    # }
}

DB_NAME = 'panaya'


def initdb():
    cnx = mysql.connector.connect(**config)
    cursor = cnx.cursor()
    cursor.close()
    cnx.close()


def get():
    cnx = mysql.connector.connect(**config, database=DB_NAME)
    cursor = cnx.cursor(dictionary=True)
    query = ("SELECT As_company.Company_Name, As_account.Account_Name, As_account.Company_ID, As_project.* FROM "
             "As_company, As_account, As_project WHERE As_company.Company_ID = As_account.Company_ID "
             "AND As_account.Account_ID = As_project.Account_ID")

    cursor.execute(query)
    return data_rearranger(cursor.fetchall())
    cursor.close()
    cnx.close()


def status_switcher(arg):
    switcher = {
        0: "Inactive",
        1: "Active",
        2: "Frozen",
    }
    return switcher.get(arg)


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
