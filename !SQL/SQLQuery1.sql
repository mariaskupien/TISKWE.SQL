use EN_L4_MSkupien
go

select *from PRACOWNICY
select *from ETATY 

--SELECT TOP 10 atrybut tabeli, a, b
--FROM nazwa tabeli, tabela1, tabela2
--WHERE < > = in like
--ORDER BY atrybut tab ASC DESC

--select *from PRACOWNICY
--where PRAC_PLACA_POD >2000

--select TOP 10  PRACOWNICY.PRAC_IMIE AS [Imi�], PRACOWNICY.PRAC_NAZWISKO as [Nazwisko], 12*PRACOWNICY.PRAC_PLACA_POD  as [P�aca roczna]FROM PRACOWNICY

--select TOP 25 percent PRACOWNICY.PRAC_ID AS ID, PRACOWNICY.PRAC_IMIE AS IMI�, PRACOWNICY.PRAC_NAZWISKO AS NAZWISKO, 'ETAT:'+ PRACOWNICY.PRAC_ETAT_NAZWA AS [NAZWA ETATU], PRACOWNICY.PRAC_DATA_ZATRUD FROM PRACOWNICY

--SELECT P.PRAC_IMIE AS IMI�, P.PRAC_NAZWISKO AS NAZWISKO FROM PRACOWNICY AS P
--WHERE P.PRAC_PLACA_POD>2500
--ORDER BY P.PRAC_NAZWISKO

--SELECT PRAC_IMIE, PRAC_NAZWISKO FROM PRACOWNICY
--WHERE PRAC_PLACA_POD IN (2000,6500)

--SELECT  P.PRAC_NAZWISKO, P.PRAC_PLACA_POD, P.PRAC_DATA_ZATRUD FROM PRACOWNICY AS P
--WHERE PRAC_ZAKL_ID IN (20,40)
--ORDER BY PRAC_PLACA_POD


--SELECT *FROM PRACOWNICY
----WHERE PRAC_NAZWISKO LIKE '%SKI'
----WHERE PRAC_NAZWISKO LIKE 'S_R%'
----WHERE PRAC_NAZWISKO LIKE '[P-T]%'
--WHERE PRAC_NAZWISKO LIKE '[^P-T]%'

--SELECT P.PRAC_IMIE  +''+ P.PRAC_NAZWISKO AS [IMIE I NAZWISKO] , 3*P.PRAC_PLACA_POD AS [KWARTALNE ZAROBKI] FROM PRACOWNICY AS P
--WHERE PRAC_NAZWISKO LIKE 'K%'

--SELECT  P.PRAC_NAZWISKO, P.PRAC_ETAT_NAZWA,  P.PRAC_PLACA_POD FROM PRACOWNICY AS P
--WHERE PRAC_PLACA_POD>=3000 AND PRAC_ETAT_NAZWA='KIEROWNIK'
--ORDER BY PRAC_PLACA_POD

SELECT P.PRAC_NAZWISKO, P.PRAC_ID_SZEFA, P.PRAC_ETAT_NAZWA, P.PRAC_PLACA_DOD FROM PRACOWNICY AS P
WHERE PRAC_ETAT_NAZWA='CZELADNIK' AND PRAC_PLACA_DOD IS NULL


SELECT P.PRAC_ID FROM PRACOWNICY AS P
WHERE PRAC_PLACA_POD BETWEEN 2000 AND 4000

SELECT E.ETAT_NAZWA, 0.5*E.ETAT_PLACA_MAX AS [POLOWA PLACY MAX], 2*E.ETAT_PLACA_MIN AS [DWIE PLACE MIN] FROM ETATY AS E
WHERE ETAT_NAZWA LIKE '%IK'
ORDER BY  ETAT_NAZWA DESC



