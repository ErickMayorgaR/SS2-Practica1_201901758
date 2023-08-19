--EXEC CrearTablaTemporal

DELETE TablaTemporal


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

SELECT * FROM TablaTemporal;
