LOAD DATA
INFILE 'KONTAKT.csv'
BADFILE 'KONTAKT.bad'
DISCARDFILE 'KONTAKT.dsc'
REPLACE INTO TABLE KONTAKT
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(kontakt_id,telefon,e_mail)