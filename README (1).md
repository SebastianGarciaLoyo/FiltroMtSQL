# FiltroMySQL

|Sebastian Garcia Loyo 

|Base de Datos: Gourmet Delight (se puso de nombre a la base de datos restaurante)



## Consultas



#1 Obtener la lista de todos los menús con sus precios

Rta:

~~~mysql
select nombre, descripcion, precio
from menu;
~~~



Resultado

<pre>+-----------------+--------------------------------------------------------+--------+
| nombre          | descripcion                                            | precio |
+-----------------+--------------------------------------------------------+--------+
| Ensalada Cèsar  | Ensalada con lechuga romana, crutones y aderezo Cèsar  |  12.50 |
| Sopa de Tomate  | Sopa cremosa de tomate con albahaca                    |   8.75 |
| Filete de Res   | Filete de res a la parrilla con papas y vegetales      |  25.00 |
| Pasta Alfredo   | Pasta con salsa Alfredo y pollo                        |  15.00 |
| Tarta de Queso  | Tarta de queso con salsa de frambuesa                  |   7.50 |
| Cafe Americano  | Cafe americano recien preparado                        |   3.00 |
+-----------------+--------------------------------------------------------+--------+
</pre>



#2 Encontrar todos los pedidos realizados por el cliente 'Juan Perez'

Rta:

~~~mysql
select id_pedido, fecha, total
from pedido
where id_cliente = 1;
~~~



Resultado

<pre>+-----------+------------+-------+
| id_pedido | fecha      | total |
+-----------+------------+-------+
|         1 | 2024-05-15 | 40.00 |
|         2 | 2024-06-01 | 25.50 |
+-----------+------------+-------+
</pre>





#3 Listar los detalles de todos los pedidos, incluyendo el nombre del menú, cantidad y precio unitario

Rta:

~~~mysql
select dp.id_pedido, m.nombre, dp.cantidad, dp.precio_unitario
from detallespedido as dp
inner join menu as m on dp.id_menu = m.id_menu;
~~~



Resultado

<pre>+-----------+-----------------+----------+-----------------+
| id_pedido | nombre          | cantidad | precio_unitario |
+-----------+-----------------+----------+-----------------+
|         1 | Ensalada Cèsar  |        1 |           12.50 |
|         3 | Ensalada Cèsar  |        1 |           12.50 |
|         5 | Ensalada Cèsar  |        2 |           12.50 |
|         7 | Ensalada Cèsar  |        2 |           12.50 |
|        10 | Ensalada Cèsar  |        1 |           12.50 |
|        13 | Ensalada Cèsar  |        2 |           12.50 |
|        16 | Ensalada Cèsar  |        1 |           12.50 |
|         2 | Sopa de Tomate  |        1 |            8.75 |
|         6 | Sopa de Tomate  |        1 |            8.75 |
|         8 | Sopa de Tomate  |        1 |            8.75 |
|        12 | Sopa de Tomate  |        1 |            8.75 |
|        14 | Sopa de Tomate  |        1 |            8.75 |
|        18 | Sopa de Tomate  |        1 |            8.75 |
|         1 | Filete de Res   |        1 |           25.00 |
|         4 | Filete de Res   |        1 |           25.00 |
|         9 | Filete de Res   |        1 |           25.00 |
|        10 | Filete de Res   |        1 |           25.00 |
|        15 | Filete de Res   |        1 |           25.00 |
|        16 | Filete de Res   |        1 |           25.00 |
|         2 | Pasta Alfredo   |        1 |           15.00 |
|         3 | Pasta Alfredo   |        1 |           15.00 |
|         7 | Pasta Alfredo   |        1 |           15.00 |
|        11 | Pasta Alfredo   |        1 |           15.00 |
|        12 | Pasta Alfredo   |        1 |           15.00 |
|        13 | Pasta Alfredo   |        1 |           15.00 |
|        17 | Pasta Alfredo   |        1 |           15.00 |
|        18 | Pasta Alfredo   |        1 |           15.00 |
|         2 | Tarta de Queso  |        1 |            7.50 |
|         5 | Tarta de Queso  |        2 |            7.50 |
|         8 | Tarta de Queso  |        2 |            7.50 |
|        11 | Tarta de Queso  |        1 |            7.50 |
|        12 | Tarta de Queso  |        1 |            7.50 |
|        14 | Tarta de Queso  |        2 |            7.50 |
|        17 | Tarta de Queso  |        1 |            7.50 |
|        18 | Tarta de Queso  |        1 |            7.50 |
|         1 | Cafe Americano  |        3 |            3.00 |
|         3 | Cafe Americano  |        2 |            3.00 |
|         4 | Cafe Americano  |        1 |            3.00 |
|         6 | Cafe Americano  |        3 |            3.00 |
|         9 | Cafe Americano  |        3 |            3.00 |
|        11 | Cafe Americano  |        2 |            3.00 |
|        15 | Cafe Americano  |        3 |            3.00 |
|        17 | Cafe Americano  |        2 |            3.00 |
+-----------+-----------------+----------+-----------------+
</pre>



#4 Calcular el total gastado por cada cliente en todos sus pedidos

Rta:

~~~mysql
select c.nombre, sum(p.total) as TotalGastado
from pedido as p
inner join cliente as c on p.id_cliente = c.id_cliente
group by c.nombre;
~~~



Resultado

<pre>+-------------------+--------------+
| nombre            | TotalGastado |
+-------------------+--------------+
| Juan Perez        |        65.50 |
| Mariza Lopez      |        83.75 |
| Carlos Mendoza    |        55.00 |
| Ana Gonzàlez      |        61.00 |
| Luis Torres       |        45.00 |
| Laura Rivera      |        56.25 |
| Fernando Garcìa   |        97.50 |
| Isabel Fernàndez  |        84.25 |
| Ricardo Morales   |        41.00 |
| Lucìa Martìnez    |        55.75 |
| Santiago Jimènez  |        52.00 |
| Patricia Romero   |        46.25 |
+-------------------+--------------+
</pre>



#5 Encontrar los menús con un precio mayor a $10

Rta:

~~~mysql
select nombre, precio
from menu 
where precio > 10.00;
~~~



Resultado

<pre>+-----------------+--------+
| nombre          | precio |
+-----------------+--------+
| Ensalada Cèsar  |  12.50 |
| Filete de Res   |  25.00 |
| Pasta Alfredo   |  15.00 |
+-----------------+--------+
</pre>



#6 Obtener el menú más caro pedido al menos una vez

Rta:

~~~mysql
select m.nombre, m.precio
from menu as m
inner join detallespedido as dp on dp.id_menu = m.id_menu
where m.id_menu = 3
limit 1;
~~~



Resultado

<pre>+---------------+--------+
| nombre        | precio |
+---------------+--------+
| Filete de Res |  25.00 |
+---------------+--------+
</pre>



#7 Listar los clientes que han realizado más de un pedido

Rta:

~~~mysql

~~~



Resultado



#8 Mostrar el pedido más reciente de cada cliente

Rta:



~~~mysql
select c.nombre, p.fecha, p.total
from cliente as c
inner join pedido as p on c.id_cliente = p.id_cliente
where month(p.fecha) = '06';
~~~



Resultado

<pre>+-------------------+------------+-------+
| nombre            | fecha      | total |
+-------------------+------------+-------+
| Juan Perez        | 2024-06-01 | 25.50 |
| Mariza Lopez      | 2024-06-05 | 48.00 |
| Carlos Mendoza    | 2024-06-10 | 55.00 |
| Ana Gonzàlez      | 2024-06-15 | 28.25 |
| Luis Torres       | 2024-06-20 | 45.00 |
| Laura Rivera      | 2024-06-10 | 33.75 |
| Fernando Garcìa   | 2024-06-25 | 47.00 |
| Isabel Fernàndez  | 2024-06-30 | 39.50 |
| Lucìa Martìnez    | 2024-06-04 | 55.75 |
| Santiago Jimènez  | 2024-06-09 | 52.00 |
| Patricia Romero   | 2024-06-15 | 46.25 |
+-------------------+------------+-------+
</pre>

#9 Obtener el detalle de pedidos (menús y cantidades) para el cliente 'Juan Perez'.

Rta:

~~~mysql
select dp.id_pedido, m.nombre, dp.cantidad, dp.precio_unitario
from detallespedido as dp
inner join menu as m on dp.id_menu = m.id_menu
inner join pedido as p on dp.id_pedido = p.id_pedido
inner join cliente as c on p.id_cliente = c.id_cliente
where c.id_cliente = 1 and c.nombre = 'Juan Perez';
~~~



Resultado

<pre>+-----------+-----------------+----------+-----------------+
| id_pedido | nombre          | cantidad | precio_unitario |
+-----------+-----------------+----------+-----------------+
|         1 | Ensalada Cèsar  |        1 |           12.50 |
|         1 | Filete de Res   |        1 |           25.00 |
|         1 | Cafe Americano  |        3 |            3.00 |
|         2 | Sopa de Tomate  |        1 |            8.75 |
|         2 | Pasta Alfredo   |        1 |           15.00 |
|         2 | Tarta de Queso  |        1 |            7.50 |
+-----------+-----------------+----------+-----------------+
</pre>



## Procedimientos Almacenados



#1 Crear un procedimiento almacenado para agregar un nuevo cliente

Rta:

~~~mysql
delimiter $$

create procedure agregar_cliente(in nombre varchar(100), correo_electronico varchar(100), telefono varchar(15), fecha_registro date)
begin
	insert into cliente(nombre,correo_electronico, telefono, fecha_registro) values
    (nombre, correo_electronico, telefono, fecha_registro);
end $$
delimiter ;

call agregar_cliente('Sebastian Loyo', 'sebastian.loyo@example.com', '123-456-7902', '2024-07-07');
~~~





#2 Crear un procedimiento almacenado para obtener los detalles de un pedido

Rta:

~~~mysql
delimiter $$

create procedure ObtenerDetallesPedido(in id_pedido int)
begin
select p.id_pedido, m.nombre, dp.cantidad, dp.precio_unitario
from detallespedido as dp
inner join menu as m on dp.id_menu = m.id_menu
inner join pedido as p on dp.id_pedido = p.id_pedido
where p.id_pedido = id_pedido;
end $$
delimiter ; 

call ObtenerDetallesPedido(1);
~~~



#3 Crear un procedimiento almacenado para actualizar el precio de un menú

Rta:

~~~mysql
delimiter $$

create procedure ActualizarPrecioMenu(in id_menu int, precio decimal(10,2))
begin
update menu set precio = precio
where id_menu = id_menu;
end $$
delimiter ;

drop procedure ActualizarPrecioMenu;
call ActualizarPrecioMenu(1,10);
~~~



#4 Crear un procedimiento almacenado para eliminar un cliente y sus pedidos

Rta:

~~~mysql
delimiter $$

create procedure EliminarCliente(in id_cliente int)
begin
 delete from pedido
 where id_cliente = id_cliente;
 delete from cliente
 where id_pedido = id_cliente;
end $$
delimiter;

call EliminarCliente(1);
~~~



#5 Crear un procedimiento almacenado para obtener el total
gastado por un cliente

Rta:

~~~mysql
delimiter $$

create procedure TotalGastadoPorCliente(in id_cliente int)
begin
select c.nombre, sum(p.total) as TotalGastado
from pedido as p
inner join cliente as c on p.id_cliente = c.id_cliente
where c.id_cliente = id_cliente
group by c.nombre;
end $$
delimiter ;

call TotalGastadoPorCliente(1);
~~~



