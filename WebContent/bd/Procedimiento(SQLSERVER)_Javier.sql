use DSQ_RENIEC
go

if OBJECT_ID('registraPersona') is not null
	drop proc registraPersona
go
create proc registraPersona(
@nDNI char(8),
@nombre varchar(40) ,
@apellidoP varchar(40) ,
@apellidoM varchar(40) ,
@sexo varchar(40) ,
@fechaNac date ,
@telefono char(11) ,
@direccion varchar(45),
@email varchar(45) ,
@foto image ,
@firma image ,
@huella image,
@idDist   int)
as
	insert into persona values (@nDNI,@nombre,@apellidoP,@apellidoM,@sexo,@fechaNac,
@telefono,@direccion,@email,@foto,@firma,@huella,@idDist) 
go
if OBJECT_ID('modificaPersona') is not null
	drop proc modificaPersona
go
create proc modificaPersona(
@nDNI char(8),
@nombre varchar(40) ,
@apellidoP varchar(40) ,
@apellidoM varchar(40) ,
@sexo varchar(40) ,
@fechaNac date ,
@telefono char(11) ,
@direccion varchar(45),
@email varchar(45) ,
@foto image ,
@firma image ,
@huella image,
@idDist   int
)
as
	update persona set
	nombre=@nombre,
	apellidoP=@apellidoP,
	apellidoM=@apellidoM,
	sexo=@sexo,
	fechaNac=@fechaNac,
	telefono=@telefono,
	direccion=@direccion,
	email=@email,
	foto=@foto,
	firma=@firma,
	huella=@huella,
	idDist=@idDist
	where nDNI=@nDNI
go
if OBJECT_ID('eliminaPersona') is not null
	drop proc eliminaPersona
go
create proc eliminaPersona
(@nDNI char(8))
as
	delete from Persona where nDNI=@nDNI
go
if OBJECT_ID('listaPersona') is not null
	drop proc listaPersona
go
create proc listaPersona
as
SELECT        dbo.PERSONA.nDNI, dbo.PERSONA.nombre, dbo.PERSONA.apellidoP, dbo.PERSONA.apellidoM, dbo.PERSONA.sexo, dbo.PERSONA.fechaNac, 
                         dbo.PERSONA.telefono, dbo.PERSONA.direccion, dbo.PERSONA.email, dbo.PERSONA.foto, dbo.PERSONA.firma, dbo.PERSONA.huella, dbo.DISTRITO.distrito, 
                         dbo.PROVINCIA.provincia, dbo.DEPARTAMENTO.departamento
FROM            dbo.PERSONA INNER JOIN
                         dbo.DISTRITO ON dbo.PERSONA.idDist = dbo.DISTRITO.idDist INNER JOIN
                         dbo.PROVINCIA ON dbo.DISTRITO.idProv = dbo.PROVINCIA.idProv INNER JOIN
                         dbo.DEPARTAMENTO ON dbo.PROVINCIA.idDepa = dbo.DEPARTAMENTO.idDepa
go
if OBJECT_ID('listaPersonaxCodigo') is not null
	drop proc listaPersonaxCodigo
go
create proc listaPersonaxCodigo
(@nDNI char(8))
as
	select * from persona where nDNI=@nDNI
go
if OBJECT_ID('listaProvxDep') is not null
	drop proc listaProvxDep
go
create proc listaProvxDep
(@dep int)
as
	select idProv,provincia from PROVINCIA where idDepa=@dep
go
if OBJECT_ID('listaDistxProv') is not null
	drop proc listaDistxProv
go
create proc listaDistxProv
(@prov int)
as
	select idDist,distrito from DISTRITO where idProv=@prov
go
if OBJECT_ID('ingresarHuella') is not null
	drop proc ingresarHuella
go
create proc ingresarHuella
(@huella image,
@dni char(8))
as
	update PERSONA set huella=@huella where nDNI=@dni
go