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
promedio decimal(18,2) --*
)

--Create table PromedioEstudiante(
--id_promedio int identity(1,1) primary key,
--id_nota int, --* listo
--promedio decimal(18,2),
--id_matricula int --* listo
--)

--drop table PromedioEstudiante

Create table Matricula(
id_matricula int primary key identity(1,1),
fecha date
)

--FORÁNEAS
ALTER TABLE Usuarios
ADD FOREIGN KEY (id_rol) REFERENCES Rol(id_rol); --ejecutado

ALTER TABLE Notas
ADD FOREIGN KEY (identificacion) REFERENCES Usuarios(identificacion); --ejecutado

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
 insert into Notas values (1,70,85,60)
 insert into Notas values (2,55,44,33)
 insert into Notas values (3,77,49,90)
 insert into Notas values (4,94,98,97)
 insert into Notas values (5,51,88,86)
 insert into Notas values (6,74,71,95)
 insert into Notas values (7,88,87,89)
 insert into Notas values (8,64,93,91)
 insert into Notas values (9,44,33,100)


 --Volcado de datos para la tabla PromedioEstudiante
 insert into PromedioEstudiante values (364829575,1,40,1)
 insert into PromedioEstudiante values ('Estudiante')

-- ALTER TABLE PromedioEstudiante
--ALTER COLUMN id_promedio varchar(80);