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
@telefono char(9) ,
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
@telefono char(9) ,
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
	select * from persona
go
if OBJECT_ID('listaPersonaxCodigo') is not null
	drop proc listaPersonaxCodigo
go
create proc listaPersonaxCodigo
(@nDNI char(8))
as
	select * from persona where nDNI=@nDNI
go