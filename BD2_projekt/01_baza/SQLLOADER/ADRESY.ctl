LOAD DATA
INFILE 'ADRESY.csv'
BADFILE 'ADRESY.bad'
DISCARDFILE 'ADRESY.dsc'
REPLACE INTO TABLE ADRESY
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(adres_id,ulica,nr_budynku,nr_mieszkania,kod_pocztowy,miasto)