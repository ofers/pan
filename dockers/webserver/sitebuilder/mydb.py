import mysql.connector

config = {
    'user': 'root',
    'password': '1q2w3e',
    'host': '192.168.181.139',
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
    query = (
        "SELECT As_company.Name, As_account.Name, As_account.Company_id, As_project.* FROM  As_company, As_account,"
        " As_project WHERE As_company.id = As_account.Company_id AND As_account.id = As_project.Account_id")

    cursor.execute(query)
    mydata =  cursor.fetchall()
    for dic in mydata:
        for key, value in dic.items():
            if key == "Status":
                newvalue = status_switcher(value)
                d1 = {"Status": newvalue}
                dic.update(d1)
        print(dic)

    return "."
    cursor.close()
    cnx.close()




def status_switcher(argument):
    switcher = {
        0: "Inactive",
        1: "Active",
        2: "Frozen",
    }
    return switcher.get(argument, "nothing")
