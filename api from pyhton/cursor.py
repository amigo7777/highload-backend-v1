import psycopg2

class Database:
    def __init__(self):
        try:
            self.connection = psycopg2.connect(
                dbname="laba",
                user="postgres",
                password="12345qwe",
                host="localhost",
                # port=self.port
            )
            self.cursor = self.connection.cursor()
            print("Соединение установлено")
        except:
            print("Не удалось установить соединение с базой данных")
#    def connect(self):


    def execute_query(self, query):
        self.cursor.execute(query)
        result = self.cursor.fetchall()
        # for row in rows:
        #     print(row)
        return result

    def disconnect(self):
        self.connection.close()

    def test(self):
        for row in self.execute_query("select * from cart where id=1"): print(row)
        print("OK")



# cur = Database()
# cur.test()
# cur.disconnect()
