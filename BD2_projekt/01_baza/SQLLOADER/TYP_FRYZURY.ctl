LOAD DATA
INFILE 'TYP_FRYZURY.csv'
BADFILE 'TYP_FRYZURY.bad'
DISCARDFILE 'TYP_FRYZURY.dsc'
REPLACE INTO TABLE TYP_FRYZURY
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(typ_fryzury_id,opis,klient_id)