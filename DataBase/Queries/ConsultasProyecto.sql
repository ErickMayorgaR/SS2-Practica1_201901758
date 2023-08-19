CREATE PROCEDURE RealizarConsultas
AS
BEGIN

	--Consulta 1

	SELECT 'Cliente' AS Tabla, COUNT(*) AS TotalRegistros FROM Cliente
	UNION
	SELECT 'Empleado' AS Tabla, COUNT(*) AS TotalRegistros FROM Empleado
	UNION
	SELECT 'Entrega' AS Tabla, COUNT(*) AS TotalRegistros FROM Entrega
	UNION
	SELECT 'EstadoEntrega' AS Tabla, COUNT(*) AS TotalRegistros FROM EstadoEntrega
	UNION
	SELECT 'DescProducto' AS Tabla, COUNT(*) AS TotalRegistros FROM DescProducto
	UNION
	SELECT 'InfoProducto' AS Tabla, COUNT(*) AS TotalRegistros FROM InfoProducto
	UNION
	SELECT 'Tiempo' AS Tabla, COUNT(*) AS TotalRegistros FROM Tiempo;

	--Consulta 2
	SELECT TOP 5 c.nombre AS Cliente, COUNT(e.idEntrega) AS TotalEntregas
	FROM Cliente c
	JOIN Entrega e ON c.idCliente = e.idCliente
	GROUP BY c.nombre
	ORDER BY TotalEntregas DESC;

	--Consulta 3

	SELECT TOP 5 descp.nombre AS Producto, e.costoEnvio
	FROM Entrega e
	JOIN InfoProducto infp ON e.idInfoProducto = infp.idInfoProducto
	JOIN DescProducto descp ON descp.idDescProducto = e.idDescProducto
	ORDER BY e.costoEnvio DESC;

	--Consulta 4

	SELECT TOP 5 ciudadEntrega AS Ciudad, COUNT(*) AS TotalEntregas
	FROM Entrega
	GROUP BY ciudadEntrega
	ORDER BY TotalEntregas DESC;

	--Consulta 5

	SELECT TOP 5 descp.nombre AS Producto, COUNT(*) AS Cantidad
	FROM Entrega e
	JOIN DescProducto descp ON descp.idDescProducto = e.idDescProducto
	JOIN EstadoEntrega ee ON e.idEstadoEntrega = ee.idEstadoEntrega
	WHERE ee.nombre = 'Pendiente'
	GROUP BY descp.nombre
	ORDER BY Cantidad DESC;

	--Consulta 6

	SELECT TOP 5 descp.nombre AS Producto, COUNT(*) AS Cantidad
	FROM Entrega e
	JOIN DescProducto descp ON descp.idDescProducto = e.idDescProducto
	JOIN EstadoEntrega ee ON e.idEstadoEntrega = ee.idEstadoEntrega
	WHERE ee.nombre = 'Entregado'
	GROUP BY descp.nombre
	ORDER BY Cantidad DESC;

	--Consulta 7
	SELECT ciudadEntrega AS Ciudad, COUNT(*) AS TotalEntregas
	FROM Entrega
	GROUP BY ciudadEntrega;

	--Consulta 8

	SELECT t.dia AS Dia, COUNT(*) AS TotalEntregas
	FROM Entrega e
	JOIN Tiempo t ON e.idTiempo = t.idTiempo
	GROUP BY t.dia
	ORDER BY t.dia;

	--Consulta 9

	SELECT t.mes AS Mes, COUNT(*) AS TotalEntregas
	FROM Entrega e
	JOIN Tiempo t ON e.idTiempo = t.idTiempo
	GROUP BY t.mes
	ORDER BY t.mes;

	--Consulta 10

	SELECT t.anio AS Anio, COUNT(*) AS TotalEntregas
	FROM Entrega e
	JOIN Tiempo t ON e.idTiempo = t.idTiempo
	GROUP BY t.anio
	ORDER BY t.anio;

END;

