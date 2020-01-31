from dockers.webserver.sitebuilder.mydb import get
from tabulate import tabulate



def index():
    return get()



if __name__ == '__main__':
    print(index())