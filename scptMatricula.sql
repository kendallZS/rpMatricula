
create database Matricula

use Matricula

Create table Usuarios(
identificacion int primary key,
nombre varchar(20),
apellidos varchar(40),
id_rol int, --* listo
contrasena varbinary(50),
--llave varchar(50)
)

select * from usuarios
--drop table Usuarios
--delete usuarios
--alter table usuarios
--drop column llave

Create table Rol(
id_rol int primary key,
rol varchar(20)
)
insert into Rol values (4,'hackeado')
select * from Rol
Create table Notas(
id_nota int primary key identity(1,1),
nota_1 decimal(18,2),
nota_2 decimal(18,2),
nota_3 decimal(18,2),
identificacion int, --* listo
promedio decimal(18,2) null,
id_matricula int --* listo
)



--delete Notas

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
--PARA HACER LOS JOINS SE DEBEN VINCULAR DESDE LA LLAVE FORANEA O ATRIBUTO QUE RELACIONA AMBAS TABLAS EN CASO DE QUE UNA
--TABLA TENGA MAS REGISTROS QUE LA OTRA
select Notas.identificacion, Notas.nota_1,Notas.nota_2,Notas.nota_3, Notas.promedio,
Matricula.fecha
from Matricula
inner join Notas on Matricula.id_matricula= Notas.id_matricula
where Notas.identificacion=315243695

select * from Notas where Notas.identificacion=315243695
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

ALTER TABLE Usuarios
ADD llave varchar(50); --Agrega campo LLAVE para la desencriptacion

--ALTER TABLE Usuarios
--drop column llave ;

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
 insert into Rol values (3,'Por asignar')


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
 select * from notas

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

--PROCEDIMIENTOS ALMACENADOS


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



--SP que valida si un usuario ya tiene asignadas sus notas para que no ingrese otro registro con otras notas distintas
--a la tabla
create procedure sp_inserta_si_no_existe @nota1 decimal(18,2),@nota2 decimal(18,2), @nota3 decimal(18,2),
@identificacion int, @promedio decimal(18,2), @idmatricula int
    as
	DECLARE @conteoExistencia INT
        SET @conteoExistencia = (SELECT COUNT(*) FROM Notas WHERE identificacion = @identificacion);
            IF @conteoExistencia > 0 begin
                --SIGNAL SQLSTATE '45000'
                print 'El registro ya existe';
				RAISERROR (
           N'El usuario que indicó ya cuenta con sus notas asignadas.', -- Mensaje de ejemplo
           10, -- Severity,  
           1   -- State
			);
				end
            ELSE 
			begin
                INSERT INTO Notas values(@nota1, @nota2, @nota3,@identificacion,@promedio,@idmatricula)
            END
    go
--	drop procedure sp_inserta_si_no_existe
exec sp_inserta_si_no_existe 50,60,44,315243695,0,3


select * from Notas


--Procedimiento para editar notas
create procedure sp_editar_notas @nota1 decimal(18,2),@nota2 decimal(18,2), @nota3 decimal(18,2),
@identificacion int, @promedio decimal(18,2), @idmatricula int
as
update Notas set nota_1=@nota1, nota_2=@nota2, nota_3=@nota3, promedio=@promedio,id_matricula=@idmatricula
where identificacion=@identificacion
go

exec sp_editar_notas 55,55,55,315243695,0,5

select * from Notas

Create procedure Sp_Muestra_horario_matricula @identificacion int
as
select Matricula.fecha
from Matricula
inner join Notas on Matricula.id_matricula= Notas.id_matricula
where Notas.identificacion=@identificacion
go
exec Sp_Muestra_horario_matricula 364829517

--drop procedure Muestra_horario_matricula

select * from Notas
select * from Matricula
select * from Usuarios

--Muestra detalle de notas y promedio (mod estudiante)

Create procedure Sp_Muestra_desglose @identificacion int
as
select Notas.nota_1 Nota1,Notas.nota_2 Nota2,Notas.nota_3 Nota3,Notas.promedio Promedio
from Notas
where Notas.identificacion=@identificacion
go

exec Sp_Muestra_desglose 364829517


--Encripta contrasena cuando se hace un registro
--https://www.c-sharpcorner.com/blogs/password-encryption-and-decryption-in-sql-sp
Alter PROCEDURE Sp_registra_usuario 
@identificacion int,
@nombre varchar(20),
@apellidos varchar(40),
@id_rol int,
@contrasena varchar(50)
as
Declare @Encrypt varbinary(200)  
--								clave | campo a encriptar

Select @Encrypt = EncryptByPassPhrase('key',@contrasena)  
insert into Usuarios values (@identificacion,@nombre,@apellidos,@id_rol,@Encrypt)
go

exec Sp_registra_usuario 364829572,'test','test test',1,'333'

select * from Usuarios

--Desencripta la contrasena
ALTER PROCEDURE Sp_desencripta 
@identificacion int
as
declare @valor varchar(50)
Select identificacion,id_rol,libre= convert(varchar(100),DecryptByPassPhrase('key',contrasena)) from Usuarios as Decrypt   
where identificacion=@identificacion
go

exec Sp_desencripta 369852147

select * from Usuarios 
--delete Usuarios


------------------------ALGORITMO DESENCRIPTAR-------------------------------------------------------
--Declare @Encrypt varbinary(200)  
--Select @Encrypt = EncryptByPassPhrase('key', 'Jothish' )  
--Select @Encrypt as Encrypt  

--Select convert(varchar(100),DecryptByPassPhrase('key',@Encrypt )) as Decrypt  
----------------------------------------------------------------------------------------------------


select * from Matricula
select * from Usuarios
select * from notas

exec Sp_registra_usuario 315243695,'Raul','Vazquez Arrieta',1,'111'
exec Sp_registra_usuario 365987542,'Marta','Aguilar Brenes',1,'111'
exec Sp_registra_usuario  325698654,'Jeovanny','Coto Perez',1,'111'
exec Sp_registra_usuario  315247585,'Maria','Figueroa Mata',1,'111'
exec Sp_registra_usuario  369852147,'Rafael','Jimenez Azofeifa',2,'111'
exec Sp_registra_usuario  364829517,'Yorleny','Fuentes Zuñiga',2,'111'
exec Sp_registra_usuario  325687595,'Roberto','Ulloa Obando',2,'111'
exec Sp_registra_usuario  325486179,'Kimberly','Hernandez Hernandez',2,'111'
exec Sp_registra_usuario  365987452,'Andres','Vega Valladares',2,'111'