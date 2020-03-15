create database sefazbd;
use sefazbd;

create table usuario 
(
cpf VARCHAR(11) unique primary key,
nome varchar(40),
cargo varchar(30),
orgao varchar(20)
);

create table sistema
(
id int auto_increment primary key,
nome_sistema varchar(30)
);

create table quadro_usuarios
(
id int auto_increment primary key,
cpf_usuario varchar(11),
id_sistema int,
constraint fk_usuario foreign key (cpf_usuario) 
references usuario(cpf),
constraint fk_sistema foreign key (id_sistema) 
references sistema(id)
);

select * from usuario;
select * from sistema;
select * from quadro_usuarios;

insert into usuario(cpf,nome,cargo,orgao) values 
("02055687455","Cristiano Ramos","Analista Senior","Sefaz"),
("56231148520","Alexandre Mendonça","Diretor Técnico","Pitang"),
("32158477855","Roberto Borges","Diretor Geral","Pitang"),
("12135602198","Joelson Rodrigues","Secretário Executivo","SDSCJ");

insert into sistema(nome_sistema) values
("13 Bolsa Família"),
("Nota Fiscal Solidária"),
("Administrativo"),
("Financeiro"),
("Relatórios"),
("Vendas");

insert into quadro_usuarios(cpf_usuario,id_sistema) values
("02055687455",1),
("02055687455",2),
("56231148520",1),
("56231148520",2),
("56231148520",3),
("56231148520",5),
("32158477855",1),
("32158477855",2),
("32158477855",3),
("32158477855",4),
("32158477855",5),
("12135602198",1),
("12135602198",2),
("12135602198",5);

/*Listando usuarios agrupados por CPF*/
select usu.cpf as CPF,usu.nome as NOME,usu.cargo as CARGO,usu.orgao as ÓRGÃO, sis.nome_sistema as SISTEMA
from usuario as usu
inner join quadro_usuarios as qu on usu.cpf=qu.cpf_usuario
inner join sistema as sis on sis.id=qu.id_sistema order by usu.cpf;

/*Listando usuário e respectivos sistemas, o CPF com máscara e nomes em caixa alta*/
select INSERT( INSERT( INSERT( usu.cpf, 10, 0, '-' ), 7, 0, '.' ), 4, 0, '.' ) AS CPF,UPPER(usu.nome) AS NOME,usu.cargo AS CARGO,usu.orgao as ÓRGÃO, sis.nome_sistema as SISTEMA
from usuario as usu
inner join quadro_usuarios as qu on usu.cpf=qu.cpf_usuario
inner join sistema as sis on sis.id=qu.id_sistema order by usu.cpf;