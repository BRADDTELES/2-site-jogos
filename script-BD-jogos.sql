create database bd_games default character set utf8 collate utf8_general_ci;
use bd_games;
create table usuarios (
usuario varchar(10) not null,
nome varchar(30) not null,
senha varchar(60) not null,
tipo varchar(10) not null default 'editor',
primary key(usuario)
) engine=InnoDB default charset=utf8;

create table generos (
cod int(11) not null,
genero varchar(20) not null,
primary key(cod)
) engine=InnoDB default charset=utf8;

create table produtoras (
cod int(11) not null,
produtora varchar(20) not null,
pais varchar(15) not null,
primary key(cod)
) engine=InnoDB default charset=utf8;

create table jogos (
cod int(11) not null,
nome varchar(40) not null,
genero int(11) not null,
produtora int(11) not null,
descricao text not null,
nota decimal(4,2) not null,
capa varchar(40) default null,
primary key(cod),
foreign key(genero) references generos(cod),
foreign key(produtora) references produtoras(cod)
) engine=InnoDB default charset=utf8;
describe generos;
insert into generos values(1, 'Ação'),(2,'Aventura'),(3,'Terror'),(4,'Plataforma'),(5,'Estratégia'),(6,'RPG'),(7,'Essporte'),(8,'Corrida'),(9,'Tabbuleiro'),(10,'Puzzle'),(11,'Luta'),(12,'Musical');
select * from generos;