LOAD DATA
INFILE 'USLUGI.csv'
BADFILE 'USLUGI.bad'
DISCARDFILE 'USLUGI.dsc'
REPLACE INTO TABLE USLUGI
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(usluga_id,nazwa_uslugi,cena_uslugi)