import mysql.connector as sql
from random import randint

database="aeropuerto"
nombre_tabla="compra"
lista_dnis=[]
aux=""
aux2=""
try:
    con=sql.connect(user="alumno", password="abc123", host="localhost", database=database)
    if con.is_connected():
        print("Conexion establecida.")
        cursor=con.cursor()
        contador=f'SELECT count(dni_cliente) FROM {nombre_tabla};'
        while (len(lista_dnis)-1)==contador:
            select=f'SELECT dni_cliente FROM {nombre_tabla} ORDER BY {randint(1,contador)} LIMIT 1;'
            cursor.execute(select)
            result=cursor.fetchall()
            aux2=randint(1,15)
            aux=result[randint(1, contador)]
            if not aux in lista_dnis:
                lista_dnis.append(aux)
                insert=f'INSERT INTO {nombre_tabla}(dni_cliente, id_billete) VALUES(%s, %i);'
                val=(aux, aux2)
                cursor.execute(insert,val)
                con.commit()
except Exception as e:
    print("Algo ha fallado")