 CREATE VIEW Production.vCostoProductoSimple AS 

 SELECT ProductID, Name AS NombreProducto, ListPrice AS PrecioLista 

 FROM Production.Product;

alter view Production.vCostoProductoSimple as
select *

from Production.vCostoProductoSimple
--ejersicio 2

CREATE PROCEDURE dbo.uspObtenerProductosCostosos 

  @PrecioMin DECIMAL(10,2) 

 AS 

 BEGIN 

  SELECT ProductID, Name AS NombreProducto, ListPrice AS PrecioLista 

  FROM Production.Product 

  WHERE ListPrice > @PrecioMin; 

 END;


EXEC dbo.uspObtenerProductosCostosos @PrecioMin = 1000;

-- ejersicio 3 
CREATE FUNCTION dbo.fnCalcularDescuento (@Precio DECIMAL(10,2), @Descuento DECIMAL(5,2))  

RETURNS DECIMAL(10,2)  

AS  

BEGIN  

  DECLARE @PrecioFinal DECIMAL(10,2);  

  SET @PrecioFinal = @Precio - (@Precio * @Descuento / 100);  

  RETURN @PrecioFinal;  

END;
-- EJERSICIO 4

CREATE FUNCTION dbo.fnLimpiarTexto (@Texto NVARCHAR(255))  

RETURNS NVARCHAR(255)  

AS  

BEGIN  

  DECLARE @TextoLimpio NVARCHAR(255);  

  SET @TextoLimpio = UPPER(LTRIM(RTRIM(@Texto)));  

  SET @TextoLimpio = REPLACE(@TextoLimpio, 'Á', 'A');  

  SET @TextoLimpio = REPLACE(@TextoLimpio, 'É', 'E');  

  SET @TextoLimpio = REPLACE(@TextoLimpio, 'Í', 'I');  

  SET @TextoLimpio = REPLACE(@TextoLimpio, 'Ó', 'O');  

  SET @TextoLimpio = REPLACE(@TextoLimpio, 'Ú', 'U');  

  RETURN @TextoLimpio;  

END;