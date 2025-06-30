-- Verificar conteo de registros
SELECT 
    (SELECT COUNT(*) FROM Departamentos) AS Total_Departamentos,
    (SELECT COUNT(*) FROM Empleados) AS Total_Empleados,
    (SELECT COUNT(*) FROM Clientes) AS Total_Clientes,
    (SELECT COUNT(*) FROM Productos) AS Total_Productos,
    (SELECT COUNT(*) FROM Ordenes) AS Total_Ordenes;

-- Verificar relaciones clave foránea
SELECT TOP 5 o.id, c.nombre AS Cliente, e.nombre AS Empleado, o.total
FROM Ordenes o
JOIN Clientes c ON o.id_cliente = c.id
JOIN Empleados e ON o.id_empleado = e.id;

-- Verificar rangos de valores
SELECT 
    MIN(salario) AS Min_Salario, 
    MAX(salario) AS Max_Salario,
    AVG(salario) AS Promedio_Salario
FROM Empleados;

SELECT categoria, COUNT(*) AS Total_Productos
FROM Productos
GROUP BY categoria; 
