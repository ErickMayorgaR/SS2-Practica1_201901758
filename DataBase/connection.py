import pyodbc


server = '(local)'
database = 'Practica1-Semi2'
trusted_connection = 'yes'  # Para utenticación de Windows

# Cadena de conexión
connStr = (
    f"DRIVER={{SQL Server}};"
    f"SERVER={server};"
    f"DATABASE={database};"
    f"Trusted_Connection={trusted_connection};"
)

class Connection: 

    def borrarModelo(self):
        try:
            # Establecer la conexión
            connection = pyodbc.connect(connStr)

            # Crear un cursor
            cursor = connection.cursor()

            # Consulta SQL
            query = "EXEC EliminarTablas;"

            # Ejecutar la consulta
            cursor.execute(query)

            # Aceptar los cambios
            connection.commit()
            print("Modelo Creado correctamente")

            
        except pyodbc.Error as e:
            print("Error en la conexión o consulta:", e)

        finally:
            # Cerrar el cursor y la conexión al finalizar
            if cursor:
                cursor.close()
            if connection:
                connection.close()
        pass
    
    def crearModelo(self):
        try:
            # Establecer la conexión
            connection = pyodbc.connect(connStr)

            # Crear un cursor
            cursor = connection.cursor()

            # Consulta SQL
            query = "EXEC CrearTablasModelo;"

            # Ejecutar la consulta
            cursor.execute(query)

            # Aceptar los cambios
            connection.commit()
            print("Modelo Creado correctamente")

            
        except pyodbc.Error as e:
            print("Error en la conexión o consulta:", e)

        finally:
            # Cerrar el cursor y la conexión al finalizar
            if cursor:
                cursor.close()
            if connection:
                connection.close()
        


    def extraerInformacion(self):
        try:
            # Establecer la conexión
            connection = pyodbc.connect(connStr)

            # Crear un cursor
            cursor = connection.cursor()

            # Consulta SQL
            query = "EXEC CrearTablaTemporal;"

            # Ejecutar la consulta
            cursor.execute(query)

            bulkInsertQuery = """ 
            BULK INSERT TablaTemporal
                FROM 'C:\\Users\\Erick\\Desktop\\Segundo Semestre 2023\\Semi2\\Laboratorio\\Practica\\SS2-Practica1_201901758\\DataBase\\EntregasUSAC-Delivery.csv'
                WITH (
                    FIRSTROW = 2,  
                    FIELDTERMINATOR = ';', 
                    ROWTERMINATOR = '\n',                   
                    CODEPAGE = 'ACP',
                    DATAFILETYPE = 'Char',
                    TABLOCK
                ); 
                """
            cursor.execute(bulkInsertQuery)
            # Aceptar los cambios
            connection.commit()
            print("Datos extraidos correctamente")


        except pyodbc.Error as e:
            print("Error en la conexión o consulta:", e)

        finally:
            # Cerrar el cursor y la conexión al finalizar
            if cursor:
                cursor.close()
            if connection:
                connection.close()


    def cargarInformacion(self):
        try:
            # Establecer la conexión
            connection = pyodbc.connect(connStr)

            # Crear un cursor
            cursor = connection.cursor()

            # Consulta SQL
            query = "EXEC FillDataBase;"

            # Ejecutar la consulta
            cursor.execute(query)

            # Aceptar los cambios
            connection.commit()
            print("Informacion Cargada Exitosamente")

            
        except pyodbc.Error as e:
            print("Error en la conexión o consulta:", e)

        finally:
            # Cerrar el cursor y la conexión al finalizar
            if cursor:
                cursor.close()
            if connection:
                connection.close()
        pass


    def realizarConsultas(self):
        try:
            # Establecer la conexión
            connection = pyodbc.connect(connStr)

            # Crear un cursor
            cursor = connection.cursor()

            # Consulta SQL
            query = "EXEC RealizarConsultas;"

            # Ejecutar la consulta
            cursor.execute(query)

           

            print("Modelo Creado correctamente")

             # Nombre del archivo de texto
            txt_filename = "resultados_consulta.txt"

            # Guardar los resultados en un archivo de texto
            with open(txt_filename, 'w') as txt_file:
                 while True:
                    results = cursor.fetchall()

                    if not results:
                        break

                    
                    column_names = [column[0] for column in cursor.description]

                    txt_file.write(','.join(column_names) + '\n')

                    for row in results:
                        txt_file.write(str(row) + '\n')
                    
                    txt_file.write('\n\n')

                    if not cursor.nextset():
                        break

            print("Resultados guardados en", txt_filename)

            
        except pyodbc.Error as e:
            print("Error en la conexión o consulta:", e)

        finally:
            # Cerrar el cursor y la conexión al finalizar
            if cursor:
                cursor.close()
            if connection:
                connection.close()
        pass


