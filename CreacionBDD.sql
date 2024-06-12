drop database if exists restaurante;

create database restaurante;
use restaurante;


create table cliente(
	id_cliente int primary key auto_increment not null,
    nombre varchar(100) not null,
    correo_electronico varchar(100) not null,
    telefono varchar(15) not null,
    fecha_registro date
);

create table pedido(
	id_pedido int primary key auto_increment not null,
    id_cliente int not null,
    fecha date not null,
    total decimal(10,2) not null,
    foreign key(id_cliente) references cliente(id_cliente)
);

create table menu(
	id_menu int primary key auto_increment not null,
    nombre varchar(100) not null,
    descripcion text not null,
    precio decimal(10,2)
);

create table detallespedido(
	id_pedido int not null,
    id_menu int not null,
    cantidad int not null,
    precio_unitario decimal(10,2),
    foreign key(id_pedido) references pedido(id_pedido),
    foreign key(id_menu) references menu(id_menu)
);
