LOAD DATA
INFILE 'WIZYTY.csv'
BADFILE 'WIZYTY.bad'
DISCARDFILE 'WIZYTY.dsc'
REPLACE INTO TABLE WIZYTY
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(wizyta_id,data_wizyty,pracownik_id,rezerwacja_id,kosmetyki_id,sprzet_id,platnosci_id)