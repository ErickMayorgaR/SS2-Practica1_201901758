import pandas as pd


def borrarModelo():
    print("Borrando modelo")
    
def crearModelo():
    print("Creando modelo")

def extraerInformacion():
    print("Extrayendo informacion")

    archivoEntrada = "EntregasUSAC-Delivery.csv"
    #archivoEntrada = input("Por favor, Ingrese el nombre del archivo ")

    print("Ruta ingresada:", archivoEntrada)
    # Especifica el nombre del archivo de entrada y salida
    archivo_salida = "Clean" + archivoEntrada

    # Leer el archivo CSV
    data = pd.read_csv(archivoEntrada)

    # Eliminar filas duplicadas
    data = data.drop_duplicates()
    # Lidiar con valores faltantes (NaN)
    data = data.dropna(how='all')

    # Guardar el resultado en un nuevo archivo CSV
    data.to_csv(archivo_salida, index=False)



def cargarInformacion():
    print("Cargando informacion")

def realizarConsultas():
    print("Realizando consultas")





def main():
    while True:
        print("\n---- Menú Principal ----")
        print("1. Borrar Modelo")
        print("2. Crear Modelo")
        print("3. Extraer Informacion")
        print("4. Cargar Informacion")
        print("5. Realizar Consultas")


if __name__ == "__main__":
    main()