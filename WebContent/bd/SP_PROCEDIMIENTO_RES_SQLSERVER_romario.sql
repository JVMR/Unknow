use DSQ_RENIEC
go


IF OBJECT_ID('SP_PRUEBA') IS NOT NULL
	DROP PROC SP_PRUEBA
GO
CREATE PROC SP_PRUEBA( @dni CHAR(8), @contrase�a varchar(100))
AS
	IF EXISTS(SELECT * FROM PERSONA WHERE nDNI=@dni AND contrase�a=@contrase�a)
		SELECT firma FROM PERSONA WHERE nDNI=@dni AND contrase�a=@contrase�a
	ELSE
		SELECT fechaNac FROM PERSONA
GO

---SP_PRUEBA '70236562','contras�a'