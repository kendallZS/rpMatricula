
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

select * from Usuarios

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

 select * from Rol

 --Volcado de datos para la tabla Notas
 insert into Notas values (70,85,60,364829575,0,1)
 insert into Notas values (55,44,33,315243695,0,2)
 insert into Notas values (77,49,90,365987542,0,3)
 insert into Notas values (94,98,97,325698654,0,4)
 insert into Notas values (51,88,86, 315247585,0,5)
 insert into Notas values (74,71,95,369852147,0,6)
 insert into Notas values (88,87,89,364829517,0,7)
 insert into Notas values (64,93,91,325687595,0,8)
 insert into Notas values (0,0,0,999999999,0,12)
 select * from notas
 select * from Usuarios
 update Usuarios set id_rol=2 where identificacion=545454545
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
 insert into Matricula values ('2021-09-05 09:40:00.000')
 insert into Matricula values ('2021-09-05 09:50:00.000')


--delete Usuarios
--delete Notas
 select * from Matricula

--PROCEDIMIENTOS ALMACENADOS
select * from Notas
select * from Usuarios

--ALTER procedure SP_mostrar_usrs_sin_nota
--as
--select Usuarios.identificacion, Usuarios.nombre, Notas.nota_1,Notas.nota_2,Notas.nota_3
--from Notas
--inner join Usuarios on Notas.identificacion = Usuarios.identificacion
--where id_rol=2 and nota_1=null and nota_2=null and nota_3=null
--go

ALTER PROCEDURE Sp_mostrar_usuarios
as
select Usuarios.identificacion, nombre, apellidos from Usuarios
inner join Rol on Usuarios.id_rol=rol.id_rol
where rol.id_rol=2 
go

exec Sp_mostrar_usuarios

select * from Usuarios
select * from Notas


CREATE PROCEDURE SP_Mostrar_usrs_sin_nota

Create procedure InsertaNotas @nota1 decimal(18,2),@nota2 decimal(18,2), @nota3 decimal(18,2),
@identificacion int, @promedio decimal(18,2), @idmatricula int
as
insert into Notas values(@nota1,@nota2,@nota3,@identificacion,@promedio,@idmatricula)
go
exec InsertaNotas 0,0,0,365987542,0,7

select * from usuarios


CREATE PROCEDURE Sp_actualizar_rol @idRol int, @identificacion int
as
update Usuarios set id_rol=@idRol where identificacion=@identificacion
go

exec Sp_actualizar_rol 1, 105659862



create procedure EditarPromedio @promedio decimal(18,2), @identificacion int
as
update Notas set promedio=@promedio where identificacion= @identificacion
go
exec EditarPromedio @promedio=30, @identificacion=315243695

select * from Usuarios 



--Obsoleto
--SP que valida si un usuario ya tiene asignadas sus notas para que no ingrese otro registro con otras notas distintas
--a la tabla
ALTER procedure sp_inserta_si_no_existe @nota1 decimal(18,2),@nota2 decimal(18,2), @nota3 decimal(18,2),
@identificacion int, @promedio decimal(18,2), @idmatricula int
    as
	DECLARE @conteoExistencia INT
        SET @conteoExistencia = (SELECT COUNT(*) FROM Notas WHERE identificacion = @identificacion);
            IF @conteoExistencia > 0 begin
                --SIGNAL SQLSTATE '45000'
                --print 'El registro ya existe';
			--	RAISERROR (
   --        N'El usuario que indicó ya cuenta con sus notas asignadas.', -- Mensaje de ejemplo
   --        10, -- Severity,  
   --        1   -- State
			--);
			--RAISERROR (50027, 16, 1, 'Error en al insertar los datos de la tabla clientes')



			BEGIN TRY  
    -- RAISERROR con 'severity' 11-19 para causar la ejecución de bloque CATCH  
    RAISERROR ('Error raised in TRY block.', 
               11, -- Severity.  
               19 -- State.  
               );  
END TRY  
BEGIN CATCH  
    DECLARE @ErrorMessage NVARCHAR(4000);  
    DECLARE @ErrorSeverity INT;  
    DECLARE @ErrorState INT;  

    SELECT   
        @ErrorMessage = 'EL USUARIO QUE INDICÓ YA CUENTA CON LAS NOTAS ASIGNADAS',  
        @ErrorSeverity = ERROR_SEVERITY(),  
        @ErrorState = ERROR_STATE();  

    -- RAISE ERROR en bloque catch para forzar la devolución de error personalizado
    RAISERROR (@ErrorMessage, -- Message text.  
               @ErrorSeverity, -- Severity.  
               @ErrorState -- State.  
               );  
END CATCH;
				end
            ELSE 
			begin
                INSERT INTO Notas values(@nota1, @nota2, @nota3,@identificacion,@promedio,@idmatricula)
				declare @CalcProm decimal =(@nota1 + @nota2 + @nota3)/3
				
				--Calcula la hora de matricula segun promedio
                    declare @hora_matriculaAct int=0

                    if (@CalcProm <= 100 and @CalcProm >= 90)
                    begin
                       set @hora_matriculaAct = 3
                    end
                    else if (@CalcProm <= 90 and @CalcProm >= 80)
                    begin
                       set @hora_matriculaAct = 4
                    end
                    else if (@CalcProm <= 80 and @CalcProm >= 70)
                    begin
                        set @hora_matriculaAct = 5
                    end
                    else if (@CalcProm <= 70 and @CalcProm >= 60)
                    begin
                        set @hora_matriculaAct = 6;
                    end
                    else if (@CalcProm <= 60 and @CalcProm >= 50)
                    begin
                        set @hora_matriculaAct = 7;
                    end
                    else if (@CalcProm <= 50 and @CalcProm >= 40)
                    begin
                       set @hora_matriculaAct = 8;
                    end
                    else if (@CalcProm <= 40 and @CalcProm >= 30)
                    begin
                        set @hora_matriculaAct = 9;
                    end
                    else if (@CalcProm <= 30 and @CalcProm >= 20)
                    begin
                       set @hora_matriculaAct = 10;
                    end
                    else if (@CalcProm <= 20 and @CalcProm >= 10)
                    begin
                       set @hora_matriculaAct = 11;
                    end
                    else if (@CalcProm <= 10 and @CalcProm >= 0)
                    begin
                        set @hora_matriculaAct = 12;
                    end
				--------------------------------------------------
				update Notas set promedio =@CalcProm, id_matricula= @hora_matriculaAct 
				where identificacion=@identificacion
            END
    go
--	drop procedure sp_inserta_si_no_existe
exec sp_inserta_si_no_existe 9,9,9,315243695,0,3

delete Notas
select * from Notas


--Procedimiento para editar notas
create procedure sp_editar_notas @nota1 decimal(18,2),@nota2 decimal(18,2), @nota3 decimal(18,2),
@identificacion int, @promedio decimal(18,2), @idmatricula int
as
update Notas set nota_1=@nota1, nota_2=@nota2, nota_3=@nota3, promedio=@promedio,id_matricula=@idmatricula
where identificacion=@identificacion
go

exec sp_editar_notas 55,55,55,315243695,0,5

select * from Notas where identificacion=315243695

Create procedure Sp_Muestra_horario_matricula @identificacion int
as
select Matricula.fecha
from Matricula
inner join Notas on Matricula.id_matricula= Notas.id_matricula
where Notas.identificacion=@identificacion
go
exec Sp_Muestra_horario_matricula 364829517

--drop procedure Muestra_horario_matricula
select * from Notas where identificacion=365987542
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

CREATE PROCEDURE Mostrar_notas
as
select Notas.identificacion,Usuarios.nombre, nota_1,nota_2,nota_3,promedio from notas
inner join Usuarios on Usuarios.identificacion = Notas.identificacion
go

exec Mostrar_notas 


ALTER PROCEDURE sp_mostrar_estudiantes_con_notas
as
select Usuarios.identificacion, Usuarios.nombre, notas.nota_1,
notas.nota_2, Notas.nota_3
from Usuarios
inner join Notas on Usuarios.identificacion=Notas.identificacion
go

exec sp_mostrar_estudiantes_con_notas


--SP QUE MUESTRA LOS USUARIOS QUE NO TIENEN UN ROL ASIGNADO (id_rol = 3) se muestra en mod Asignacion rol
Alter PROCEDURE Sp_mostrar_usrs_sin_rol
as
select Usuarios.identificacion, Usuarios.nombre, Usuarios.apellidos, Rol.id_rol from usuarios
inner join Rol on Usuarios.id_rol = rol.id_rol
where rol.id_rol = 3
go

EXEC Sp_mostrar_usrs_sin_rol

select * from Matricula
select * from Usuarios
select * from notas where identificacion=121212121

exec Sp_registra_usuario 315243695,'Raul','Vazquez Arrieta',1,'111'
exec Sp_registra_usuario 365987542,'Marta','Aguilar Brenes',1,'111'
exec Sp_registra_usuario  325698654,'Jeovanny','Coto Perez',1,'111'
exec Sp_registra_usuario  315247585,'Maria','Figueroa Mata',1,'111'
exec Sp_registra_usuario  369852147,'Rafael','Jimenez Azofeifa',2,'111'
exec Sp_registra_usuario  364829517,'Yorleny','Fuentes Zuñiga',2,'111'
exec Sp_registra_usuario  325687595,'Roberto','Ulloa Obando',2,'111'
exec Sp_registra_usuario  325486179,'Kimberly','Hernandez Hernandez',2,'111'
exec Sp_registra_usuario  365987452,'Andres','Vega Valladares',2,'111'

exec Sp_registra_usuario  398653256,'John','Céspedes Matarrita',3,'111'
exec Sp_registra_usuario  365987521,'Inessa','Rebbeck',3,'111'
exec Sp_registra_usuario  326548195,'Chelsey','Pinkett',3,'111'
exec Sp_registra_usuario  326598562,'Hyacinthe','Playford',3,'111'
exec Sp_registra_usuario  369856324,'Kingsly','Conneely',3,'111'
exec Sp_registra_usuario  369856547,'Todd','Lyard',3,'111'
exec Sp_registra_usuario  325487595,'Godard','Brevitt',3,'111'