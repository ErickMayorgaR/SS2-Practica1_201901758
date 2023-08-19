CREATE PROCEDURE FillDataBase
AS
BEGIN
	INSERT INTO Tiempo(dia,mes,anio)
	SELECT DISTINCT
	tt.Dia, 
	tt.Mes, 
	tt.Anio 
	FROM TablaTemporal tt
	WHERE tt.Dia IS NOT NULL AND tt.Mes IS NOT NULL and tt.Anio IS NOT NULL;


	INSERT INTO Cliente(nombre, direccion)
	SELECT DISTINCT
	NombreCliente,
	Direccion
	FROM TablaTemporal 
	WHERE NombreCliente IS NOT NULL AND Direccion IS NOT NULL;


	INSERT INTO Empleado(nombre, puesto)
	SELECT DISTINCT 
	NombreEmpleadoEntrega,
	PuestoEmpleadoEntrega
	FROM TablaTemporal
	WHERE NombreEmpleadoEntrega IS NOT NULL
	AND PuestoEmpleadoEntrega IS NOT NULL;


	INSERT INTO DescProducto(nombre, descripcion)
	SELECT DISTINCT 
	NombreProducto,
	Descripcion
	FROM TablaTemporal
	WHERE NombreProducto IS NOT NULL 
	AND Descripcion IS NOT NULL


	INSERT INTO InfoProducto(precio, peso)
	SELECT DISTINCT 
	PrecioProducto,
	peso
	FROM TablaTemporal
	WHERE PrecioProducto IS NOT NULL
	AND peso IS NOT NULL

	INSERT INTO EstadoEntrega
	SELECT DISTINCT
	EstadoEntrega 
	FROM TablaTemporal 
	WHERE EstadoEntrega IS NOT NULL

	INSERT INTO Entrega
	SELECT DISTINCT
	c.idCliente,
	e.idEmpleado,
	ee.idEstadoEntrega,
	infp.idInfoProducto,
	descp.idDescProducto,
	t.idTiempo,
	tt.CiudadEntrega,
	tt.CostoEnvio,
	tt.TiempoEntrega
	FROM TablaTemporal tt
	INNER JOIN Cliente c ON c.nombre = tt.NombreCliente AND c.direccion = tt.direccion
	INNER JOIN Empleado e ON e.Nombre = tt.NombreEmpleadoEntrega 
	INNER JOIN EstadoEntrega ee ON ee.nombre = tt.EstadoEntrega
	INNER JOIN InfoProducto infp ON infp.precio = tt.PrecioProducto AND infp.peso = tt.Peso
	INNER JOIN DescProducto descp ON descp.nombre = tt.NombreProducto
	INNER JOIN Tiempo t ON t.dia = tt.Dia AND t.mes = tt.Mes AND t.anio = tt.Anio
	WHERE tt.CiudadEntrega IS NOT NULL
	AND tt.CostoEnvio IS NOT NULL
	AND tt.TiempoEntrega IS NOT NULL

END;
