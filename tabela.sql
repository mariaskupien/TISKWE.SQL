select *from ETATY
insert into ETATY( ETAT_NAZWA, ETAT_PLACA_MIN, ETAT_PLACA_MAX)
values ( 'Instalator',5500,10200)
select *from ETATY
insert into ETATY values ('Sprzatacz',3500,null)
select *from ETATY
insert into ETATY values ('Sprzataczka',default,9500)
insert into ETATY (ETAT_NAZWA, ETAT_PLACA_MAX)
values ('Monter', 8200)
insert into ZAKLADY (ZAKL_NAZWA, ZAKL_MIASTO, ZAKL_ULICA)
values ('Zak³ad Zap³onniów', 'Szczecin', 'ul.Marynarzy 6')
select * from ZAKLADY