use EN_L4_MSkupien
go
select avg(PRAC_PLACA_POD) from PRACOWNICY

select * from PRACOWNICY
select count (PRAC_ID) as [liczba pracowników], PRAC_ZAKL_ID from PRACOWNICY
group by PRAC_ZAKL_ID

select * from PRACOWNICY
select PRAC_ETAT_NAZWA, count (PRAC_ID_SZEFA) from PRACOWNICY
group by PRAC_ETAT_NAZWA

select * from PRZYDZIALY
select PRZYDZ_PROJ_ID, count (PRZYDZ_PRAC_ID) as [liczba pracownikow] from PRZYDZIALY
group by PRZYDZ_PROJ_ID



select avg (PRAC_PLACA_POD) as [srednia placa],PRAC_ETAT_NAZWA from PRACOWNICY
group by PRAC_ETAT_NAZWA