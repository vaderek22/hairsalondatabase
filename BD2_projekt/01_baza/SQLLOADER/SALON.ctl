LOAD DATA
INFILE 'SALON.csv'
BADFILE 'SALON.bad'
DISCARDFILE 'SALON.dsc'
REPLACE INTO TABLE SALON
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(salon_id,nazwa_salonu,rok_otwarcia,strona_internetowa,kontakt_id,siec_id,region_salonu_id)