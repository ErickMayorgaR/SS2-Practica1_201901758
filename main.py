from DataBase.connection import Connection



def main():
    conn = Connection();
    while True:
        print("\n---- Menú Principal ----")
        print("1. Borrar Modelo")
        print("2. Crear Modelo")
        print("3. Extraer Informacion")
        print("4. Cargar Informacion")
        print("5. Realizar Consultas")
        print("6. Salir")

        option = input()

        optionsMap = {
                    "1": conn.borrarModelo,
                    "2": conn.crearModelo,
                    "3": conn.extraerInformacion,
                    "4": conn.cargarInformacion,
                    "5": conn.realizarConsultas,                    
                }

        selectedOption = optionsMap.get(option)
        if selectedOption:
            selectedOption()
        else:
            print("Opción no válida. Por favor, elige una opción válida.")

        if option == "6":
            break


if __name__ == "__main__":
    main()