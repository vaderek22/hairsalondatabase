LOAD DATA
INFILE 'SPRZET.csv'
BADFILE 'SPRZET.bad'
DISCARDFILE 'SPRZET.dsc'
REPLACE INTO TABLE SPRZET
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(sprzet_id,producent,typ_sprzetu_id)