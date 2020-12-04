use Mercadito

Select * from Abono
Select * from Categoria
Select * from Cliente
Select * from Credito
Select * from Inventario
Select * from OrdenProductos
Select * from OrdenProveedores
Select * from Producto
Select * from Proveedor
Select * from Venta
Select * from VentaDetalle
--VISTAS--
CREATE VIEW vwTransaccionesDiaras
AS
SELECT v.id as "Id Venta",cli.nombre as "Nombre de Cliente",p.nombre as "Nombre de Producto Vendido",ca.nombre as "Categoria del Producto"
,vd.cantidad as "Cantidad de Producto Vendido", inve.precio as "Precio de Venta",v.fecha as "Fecha de Venta", op.id as "Orden de Compra", p.nombre as "Producto Comprado",
op.cantidad as "Cantidad de Producto Comprado", op.costo "Costo del Producto", pro.nombre as "Nombre del Proveedor", opr.fechaOrden as "Fecha de Orden"
, opr.fechaEntrega as "Fecha de Entrega", inve.cantidad as "Cantidad en Inventario"
FROM Producto p
INNER JOIN OrdenProductos op 
ON p.id = op.productoId
INNER JOIN Categoria ca
ON ca.id=p.categoriaId
INNER JOIN OrdenProveedores opr 
ON op.ordenId = opr.id
INNER JOIN Proveedor pro
ON opr.proveedorId = pro.id
INNER JOIN VentaDetalle vd
ON p.id = vd.productoId
INNER JOIN Venta v
ON v.id= vd.ventaId
INNER JOIN Credito cre
ON cre.ventaId = v.id
INNER JOIN Cliente cli
ON cli.id = cre.clienteId
INNER JOIN Inventario inve
ON inve.productoId = p.id
INNER JOIN Abono abo
ON abo.creditoId= cre.id

SELECT * FROM vwTransaccionesDiaras
-------------------------------------------------------------------
Select * from Categoria c
INNER JOIN Producto p
ON c.id = p.categoriaId
INNER JOIN VentaDetalle vd
ON p.id = vd.productoId

CREATE VIEW vwVentasDeProductosPorCategorias
AS
Select c.nombre as "Categoria de Productos", Sum (vd.cantidad) as "Cantidad Vendida por Categoria", "Observacion en Ventas" =
CASE
WHEN Sum (vd.cantidad) >= 10  then 'Comprar nuevo producto'
WHEN Sum (vd.cantidad) < 10  then 'No comprar nuevo producto'
END
FROM Categoria c
INNER JOIN Producto p
ON c.id = p.categoriaId
INNER JOIN VentaDetalle vd
ON p.id = vd.productoId
group by c.nombre

SELECT * FROM vwVentasDeProductosPorCategorias
---------------------------------------------------------------
Select * from Cliente cli
INNER JOIN Credito cre
ON cli.id = cre.clienteId
INNER JOIN Abono ab
ON cre.id = ab.creditoId

CREATE VIEW vwClientesDeudores
AS
Select CLI.nombre AS "Nombre de Cliente", cli.limiteCredito as "Limite de Credito", ab.monto as "Monto Abonado", ab.fecha as "Fecha Abonada",
"Alerta"=
CASE
WHEN ab.monto = 0  then 'Cliente no ha abonado su deuda'
WHEN ab.monto >= 1  then 'Cliente paga con frecuencia su saldo'
END
FROM Cliente cli
INNER JOIN Credito cre
ON cli.id = cre.clienteId
INNER JOIN Abono ab
ON cre.id = ab.creditoId

SELECT * FROM vwClientesDeudores
------------------------------------------------------------

Select * from Producto p
INNER JOIN OrdenProductos op
ON p.id = op.productoId
INNER JOIN OrdenProveedores opro
ON op.ordenId= opro.id
INNER JOIN Proveedor pro
ON opro.proveedorId=pro.id
INNER JOIN Inventario inv
ON p.id= inv.productoId

CREATE VIEW vwProdcutosPrecioProveedor
AS
Select p.nombre as "Nombre del Producto", op.costo as "Costo del Producto del Proveedor", op.precioSugerido "Precio Sugerido por Proveedor",
inv.precio as "Precio Mio con el 30% del costo"
from Producto p
INNER JOIN OrdenProductos op
ON p.id = op.productoId
INNER JOIN OrdenProveedores opro
ON op.ordenId= opro.id
INNER JOIN Proveedor pro
ON opro.proveedorId=pro.id
INNER JOIN Inventario inv
ON p.id= inv.productoId

SELECT * FROM vwProdcutosPrecioProveedor
-------------------------------------------------------------


Select * from Producto p
INNER JOIN OrdenProductos op
ON p.id = op.productoId
INNER JOIN OrdenProveedores opro
ON op.ordenId= opro.id

CREATE VIEW vwCuentaPersonal
AS
Select P.nombre AS "Nombre del Producto", op.costo as "Costo del Producto", "Cuenta Personal Costo de Comida de Casa" = op.costo*0.30,
opro.fechaEntrega as "Fecha Del Gasto"
from Producto p
INNER JOIN OrdenProductos op
ON p.id = op.productoId
INNER JOIN OrdenProveedores opro
ON op.ordenId= opro.id

SELECT * FROM vwCuentaPersonal

--PROCEDIMIENTOS ALMACENADOS--
CREATE PROCEDURE ClasificarProveedores
AS  
BEGIN  
   SELECT v.id as "Id Venta",cli.nombre as "Nombre de Cliente",p.nombre as "Nombre de Producto Vendido",ca.nombre as "Categoria del Producto"
,vd.cantidad as "Cantidad de Producto Vendido", inve.precio as "Precio de Venta",v.fecha as "Fecha de Venta", op.id as "Orden de Compra", p.nombre as "Producto Comprado",
op.cantidad as "Cantidad de Producto Comprado", op.costo "Costo del Producto", pro.nombre as "Nombre del Proveedor", opr.fechaOrden as "Fecha de Orden"
, opr.fechaEntrega as "Fecha de Entrega", inve.cantidad as "Cantidad en Inventario", "Tipo de Proveedor" =
CASE
WHEN op.cantidad >= 300 AND vd.cantidad>=5 then 'Proveedor Alto'
WHEN op.cantidad < 300 AND vd.cantidad<5 then 'Proveedor Bajo'
ELSE 'Proveedor Bajo'
END
FROM Producto p
INNER JOIN OrdenProductos op 
ON p.id = op.productoId
INNER JOIN Categoria ca
ON ca.id=p.categoriaId
INNER JOIN OrdenProveedores opr 
ON op.ordenId = opr.id
INNER JOIN Proveedor pro
ON opr.proveedorId = pro.id
INNER JOIN VentaDetalle vd
ON p.id = vd.productoId
INNER JOIN Venta v
ON v.id= vd.ventaId
INNER JOIN Credito cre
ON cre.ventaId = v.id
INNER JOIN Cliente cli
ON cli.id = cre.clienteId
INNER JOIN Inventario inve
ON inve.productoId = p.id
INNER JOIN Abono abo
ON abo.creditoId= cre.id
END  

exec ClasificarProveedores



--TRIGGRES--


