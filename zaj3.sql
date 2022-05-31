use firma
go

select* from PRACOWNICY
insert into PRACOWNICY values
(290, 'Marcin', 'Swiety', 'Czeladnik', 190, getdate(),8500,null,40)

SELECT*FROM PRACOWNICY
UPDATE PRACOWNICY SET PRAC_PLACA_DOD=0.08*PRAC_PLACA_POD


UPDATE PRACOWNICY SET PRAC_ETAT_NAZWA='Mistrz', PRAC_PLACA_POD=1.3*PRAC_PLACA_POD
WHERE (PRAC_IMIE='Adam') and (PRAC_NAZWISKO='Mickiewicz')

update PRACOWNICY SET PRAC_ETAT_NAZWA='Dyrektor', PRAC_ZAKL_ID=(select  ZAKL_ID from ZAKLADY where ZAKL_NAZWA='Administracja'), PRAC_PLACA_POD=1500+PRAC_PLACA_POD
WHERE (PRAC_IMIE='Wojciech') and (PRAC_NAZWISKO='Smyczek')

SELECT*FROM PRACOWNICY
delete PRACOWNICY WHERE PRAC_IMIE='Kamil' and PRAC_NAZWISKO='Baczyñski'
SELECT*FROM PRACOWNICY

delete PRACOWNICY where PRAC_ETAT_NAZWA='Czeladnik' and PRAC_NAZWISKO like'M%'

create table labEtaty
(
etat_Id int identity(1,1) primary key,
etat_placa_max numeric (8,2) not null default 5000,
etat_placa_min numeric (8,2) constraint ck_placa_min check (etat_placa_min<3100)
)

select* from labEtaty
insert into labEtaty values (default, 3000)

create table labPracownicy
(
prac_id int identity(0,10) primary key,
prac_nazwisko varchar(20),
praca_imie varchar(20),
prac_etat_id int constraint fk_labEtaty foreign key references labEtaty(etat_Id)
)

alter table labEtaty add nazwa_etatu varchar(2)
alter table labetaty drop column nazwa_etatu