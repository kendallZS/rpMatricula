
create database Matricula

use Matricula

Create table Usuarios(
identificacion int primary key,
nombre varchar(20),
apellidos varchar(40),
id_rol int --* listo
)

Create table Rol(
id_rol int primary key,
rol varchar(20)
)

Create table Notas(
id_nota int primary key identity(1,1),
nota_1 decimal(18,2),
nota_2 decimal(18,2),
nota_3 decimal(18,2),
identificacion int, --* listo
promedio decimal(18,2) null,
id_matricula int --* listo
)

--drop table Notas

select * from Notas
--Create table PromedioEstudiante(
--id_promedio int identity(1,1) primary key,
--id_nota int, --* listo
--promedio decimal(18,2),
--id_matricula int --* listo
--)
--delete Notas
--drop table PromedioEstudiante

Create table Matricula(
id_matricula int primary key identity(1,1),
fecha datetime
)
--drop table Matricula
select Notas.identificacion, Notas.nota_1,Notas.nota_2,Notas.nota_3, Notas.promedio,
Matricula.fecha
from Notas
inner join Matricula on Notas.id_nota=Matricula.id_matricula
where Notas.identificacion=365987542

select * from Notas
select * from Matricula

--FORÁNEAS
ALTER TABLE Usuarios
ADD FOREIGN KEY (id_rol) REFERENCES Rol(id_rol); --ejecutado

ALTER TABLE Notas
ADD FOREIGN KEY (identificacion) REFERENCES Usuarios(identificacion); --ejecutado

Alter table Notas
Add id_matricula int --ejecutado

ALTER TABLE Notas
ADD FOREIGN KEY (id_matricula) REFERENCES Matricula(id_matricula); --ejecutado

--ALTER TABLE PromedioEstudiante
--ADD FOREIGN KEY (identificacion) REFERENCES Usuarios(identificacion); --NO




--Volcado de datos para la tabla Usuarios
 insert into Usuarios values (364829575,'Kendall','Robles Martines',1)
 insert into Usuarios values (315243695,'Raul','Vazquez Arrieta',1)
 insert into Usuarios values (365987542,'Marta','Aguilar Brenes',1)
 insert into Usuarios values (325698654,'Jeovanny','Coto Perez',1)
 insert into Usuarios values (315247585,'Maria','Figueroa Mata',1)
 insert into Usuarios values (369852147,'Rafael','Jimenez Azofeifa',2)
 insert into Usuarios values (364829517,'Yorleny','Fuentes Zuñiga',2)
 insert into Usuarios values (325687595,'Roberto','Ulloa Obando',2)
 insert into Usuarios values (325486179,'Kimberly','Hernandez Hernandez',2)
 insert into Usuarios values (365987452,'Andres','Vega Valladares',2)


 --Volcado de datos para la tabla Rol
 insert into Rol values (1,'Docente')
 insert into Rol values (2,'Estudiante')

 --Volcado de datos para la tabla Notas
 insert into Notas values (70,85,60,364829575,0,1)
 insert into Notas values (55,44,33,315243695,0,2)
 insert into Notas values (77,49,90,365987542,0,3)
 insert into Notas values (94,98,97,325698654,0,4)
 insert into Notas values (51,88,86, 315247585,0,5)
 insert into Notas values (74,71,95,369852147,0,6)
 insert into Notas values (88,87,89,364829517,0,7)
 insert into Notas values (64,93,91,325687595,0,8)
 insert into Notas values (44,33,100)


 --Volcado de datos para la tabla PromedioEstudiante
 --insert into PromedioEstudiante values (364829575,1,40,1)
 --insert into PromedioEstudiante values ('Estudiante')

  --Volcado de datos para la tabla PromedioEstudiante
 insert into Matricula values ('2021-09-05 08:10:00.000')
 insert into Matricula values ('2021-09-05 08:20:00.000')
 insert into Matricula values ('2021-09-05 08:30:00.000')
 insert into Matricula values ('2021-09-05 08:40:00.000')
 insert into Matricula values ('2021-09-05 08:50:00.000')
 insert into Matricula values ('2021-09-05 09:10:00.000')
 insert into Matricula values ('2021-09-05 09:20:00.000')
 insert into Matricula values ('2021-09-05 09:30:00.000')


-- delete Matricula

 select * from Matricula

--Procedimietos almacenados
create procedure MostrarUsuarios
as
select * from Usuarios
go
exec MostrarUsuarios


Create procedure InsertaNotas @nota1 decimal(18,2),@nota2 decimal(18,2), @nota3 decimal(18,2),
@identificacion int, @promedio decimal(18,2), @idmatricula int
as
insert into Notas values(@nota1,@nota2,@nota3,@identificacion,@promedio,@idmatricula)
go
exec InsertaNotas @nota1=50,@nota2=80,@nota3=90,@identificacion=315243695,@promedio=0,@idmatricula=1

select * from notas

create procedure EditarPromedio @promedio decimal(18,2), @identificacion int
as
update Notas set promedio=@promedio where identificacion= @identificacion
go
exec EditarPromedio @promedio=30, @identificacion=315243695

select * from notas
--delete notas

select * from notas where identificacion=315243695










--delete notas
-- ALTER TABLE PromedioEstudiante
--ALTER COLUMN id_promedio varchar(80);