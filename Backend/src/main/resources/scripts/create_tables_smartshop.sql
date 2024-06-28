drop database if exists dbsmartshop;
create database dbsmartshop;
use dbsmartshop;

create table bloco (
	id int primary key auto_increment not null,
    bloco varchar(30) not null
);

create table apartamento (
	id int primary key auto_increment not null,
    apartamento int not null
);

create table usuario (
	id int primary key auto_increment not null,
    id_bloco int,
    id_apartamento int,
    nome varchar(255) not null,
    telefone varchar(255) not null,
    email varchar(200) not null,
    cpf char(11) not null,
    tipo varchar(30) default 'cliente',
    senha varchar(8),
    foreign key (id_bloco) references bloco (id),
    foreign key (id_apartamento) references apartamento (id)
);

create table categoria (
	id int primary key auto_increment not null,
    nome varchar(100) not null
);

create table marca (
	id int primary key auto_increment not null,
    nome varchar(100) not null
);

create table produto (
	id int primary key auto_increment not null,
    id_categoria int,
    id_marca int,
    nome varchar(255) not null,
    codigo_de_barras varchar(13) not null,
    preco decimal(4,2) not null,
    estoque int not null,
    foreign key (id_categoria) references categoria (id),
    foreign key (id_marca) references marca (id)
);

create table forma_pagamento (
	id int primary key auto_increment not null,
    tipo varchar(255) not null
);

create table carrinho (
	id int primary key auto_increment not null,
    id_forma_pagamento int,
    id_cliente int,
    data_compra date not null,
    total decimal(7,2) not null,
    foreign key (id_forma_pagamento) references forma_pagamento (id)
);

create table item (
	id int primary key auto_increment not null,
    id_carrinho int,
    id_produto int,
    preco decimal(6,2) not null,
    quantidade int not null,
    foreign key (id_carrinho) references carrinho (id),
    foreign key (id_produto) references produto (id)
);
