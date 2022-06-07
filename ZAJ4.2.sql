use EN_L4_MSkupien
GO

CREATE VIEW WIDOKZLACZONY AS
SELECT PRAC_NAZWISKO, ZAKL_MIASTO FROM PRACOWNICY INNER JOIN ZAKLADY
on PRAC_ZAKL_ID=ZAKL_ID

GO

SELECT*FROM WIDOKZLACZONY WHERE PRAC_NAZWISKO LIKE 'G&'

-----
--DEKLARACJA ZMIENNYCH
DECLARE @MOJAZMIENNA INT, @A NUMERIC(8,2);
DECLARE @DATA DATETIME;
DECLARE @Z CHAR(40);

SET @A=50
SET @DATA= GETDATE();
SET @Z = 'JAKIS TEKST'

SELECT @A,@DATA,@Z
SELECT STR(YEAR(@DATA))+' '+STR(MONTH(@DATA))+' '+STR(DAY(@DATA))

SELECT @@ERROR, @@ROWCOUNT, @@SERVERNAME AS [NAZWA SERWERA]
---------
--IF
DECLARE @X INT
SET @X=10;
IF @X>11 SELECT*FROM PRACOWNICY
ELSE 
BEGIN INSERT INTO PRACOWNICY(PRAC_ID, PRAC_NAZWISKO) VALUES (300,'Filipiak')
SELECT*FROM PRACOWNICY
END

IF EXISTS (SELECT*FROM PRACOWNICY)
SELECT *FROM PRACOWNICY


---PROCEDURY
GO
CREATE PROCEDURE PRO1
AS
BEGIN 
   IF (SELECT COUNT(*) FROM PRACOWNICY WHERE PRAC_PLACA_POD>3500)>0
   BEGIN
   SELECT 'CO� JEST'
   END 
   ELSE 
   BEGIN 
   SELECT'NIC NIE MA' 
   END
   IF @@ERROR=0 SELECT 'WSZYSTKO JEST OKEJ'
END 


EXECUTE PRO1

GO 
CREATE PROCEDURE PRO2 @PAREM NUMERIC(8,3)
AS 
BEGIN
DECLARE @VAT INT
SET @VAT=1.1
SELECT*FROM PRACOWNICY WHERE PRAC_PLACA_POD>@PAREM*@VAT
END

GO 
EXEC PRO2 3000

go
create procedure pro3 @param int output 
as
begin 
  SELECT @param=COUNT(*)FROM PRACOWNICY WHERE PRAC_PLACA_DOD>300
END

GO 
DECLARE @X INT
EXEC pro3 @X
SELECT @X AS[LICZBA PRACOWNIKOW]

GO
CREATE FUNCTION FPRAC1(@PLACA NUMERIC(8,2))
RETURNS TABLE 
AS
RETURN(
SELECT PRAC_NAZWISKO, PRAC_PLACA_POD FROM PRACOWNICY
WHERE PRAC_PLACA_POD>@PLACA)

GO 
SELECT*FROM FPRAC1(2500)
GO 


CREATE FUNCTION FPRAC2 (@DOD NUMERIC (5,2))
RETURNS NUMERIC(6,2)
AS
BEGIN
DECLARE @ZWROT NUMERIC(6,2)
SELECT @ZWROT=AVG(PRAC_PLACA_POD) FROM PRACOWNICY
WHERE PRAC_PLACA_DOD>@DOD
RETURN (@ZWROT)
END

GO 
DECLARE @N NUMERIC(6,2)
EXEC @N= FPRAC2 100
SELECT @N

--WYZWALACZ
GO
create trigger INFO
ON ETATY
AFTER INSERT  --AFTER/BEFORE INSERT/UPDATE/DELETE
AS
BEGIN
  DECLARE @LICZBA_STANOWISK INT
  SELECT @LICZBA_STANOWISK= COUNT(*) FROM ETATY
  SELECT @LICZBA_STANOWISK AS [LICZBA STANOWISK]
  SELECT 'LICZBA STANOWISK = ' + STR(@LICZBA_STANOWISK)
  SELECT*FROM ETATY
END

GO 
SELECT * FROM ETATY
INSERT INTO ETATY VALUES ('ETAT 12',1234,1235)
