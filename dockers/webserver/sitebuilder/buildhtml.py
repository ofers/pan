from dockers.webserver.sitebuilder.mydb import get
import pandas


def index():
    tbdata = get()
    df = pandas.DataFrame.from_dict(tbdata, orient='columns')
    df = df.reindex(columns=['Company_ID', 'Company_Name', 'Account_ID', 'Account_Name', 'Project_ID', 'Project_Name',
                             'Project_Status'])
    html = df.to_html(classes='Attendance', index=False, header=True, justify='center').replace('<tr>',
                                                                                                '<tr style="text-align: '
                                                                                                'center;">')
    index_file = open("index.html", "w")
    index_file.write(html)
    index_file.close()


if __name__ == '__main__':
    index()
