LOAD DATA
INFILE 'REZERWACJA.csv'
BADFILE 'REZERWACJA.bad'
DISCARDFILE 'REZERWACJA.dsc'
REPLACE INTO TABLE REZERWACJA
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(rezerwacja_id,klient_id,usluga_id)