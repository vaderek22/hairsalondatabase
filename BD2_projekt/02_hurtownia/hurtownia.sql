CREATE TABLE H_REGION_SALONU (
	region_salonu_id	NUMBER(6) CONSTRAINT hregion_salonu_pk PRIMARY KEY,
	nazwa_regionu		VARCHAR2(30)
);

CREATE TABLE H_SALON (
	salon_id		NUMBER(6) CONSTRAINT hsalony_pk PRIMARY KEY,
	nazwa_salonu		VARCHAR2(30),
	rok_otwarcia		NUMBER(4),
	strona_internetowa	VARCHAR2(30),
	region_salonu_id	NUMBER(6) NOT NULL,
	CONSTRAINT hs_region_salonu_fk FOREIGN KEY(region_salonu_id) REFERENCES H_REGION_SALONU(region_salonu_id)
);

CREATE TABLE H_SPECJALIZACJA (
	specjalizacja_id	NUMBER(6) CONSTRAINT hspecjalizacja_pk PRIMARY KEY,
	nazwa_specjalizacji	VARCHAR2(20),
	dodatkowe_informacje	VARCHAR2(60)		
);

CREATE TABLE H_PRACOWNICY (
	pracownik_id		NUMBER(6) CONSTRAINT hpracownicy_pk PRIMARY KEY,
	staz			NUMBER(4),
	salon_id		NUMBER(6) NOT NULL,
	specjalizacja_id	NUMBER(6) NOT NULL,
	CONSTRAINT hp_salon_fk FOREIGN KEY(salon_id) REFERENCES H_SALON(salon_id),
	CONSTRAINT hp_specjalizacja_fk FOREIGN KEY(specjalizacja_id) REFERENCES H_SPECJALIZACJA(specjalizacja_id)
);

CREATE TABLE H_USLUGI (
	usluga_id	NUMBER(6) CONSTRAINT huslugi_pk PRIMARY KEY,
	nazwa_uslugi	VARCHAR2(50),
	cena_uslugi	NUMBER(6)
);

CREATE TABLE H_TYP_SPRZETU (
	typ_sprzetu_id	NUMBER(6) CONSTRAINT htyp_sprzetu_pk PRIMARY KEY,
	opis		VARCHAR2(30)
);

CREATE TABLE H_SPRZET (
	sprzet_id	NUMBER(6) CONSTRAINT hsprzet_pk PRIMARY KEY,
	producent	VARCHAR2(30),
	typ_sprzetu_id	NUMBER(6),
	CONSTRAINT hsp_typ_sprzetu_fk FOREIGN KEY(typ_sprzetu_id) REFERENCES H_TYP_SPRZETU(typ_sprzetu_id)
);

CREATE TABLE H_KLIENT (
	klient_id	NUMBER(6) CONSTRAINT hklient_pk PRIMARY KEY,
	imie		VARCHAR2(30),
	nazwisko	VARCHAR2(30)
);

CREATE TABLE H_REZERWACJA (
	rezerwacja_id	NUMBER(6) CONSTRAINT hrezerwacja_pk PRIMARY KEY,
	klient_id	NUMBER(6) NOT NULL,
	usluga_id	NUMBER(6) NOT NULL,
	CONSTRAINT hr_klient_fk FOREIGN KEY(klient_id) REFERENCES H_KLIENT(klient_id),
	CONSTRAINT hr_uslugi_fk FOREIGN KEY(usluga_id) REFERENCES H_USLUGI(usluga_id)
);

CREATE TABLE H_TYP_PLATNOSCI (
	typ_platnosci_id	NUMBER(6) CONSTRAINT htyp_platnosci_pk PRIMARY KEY,
	forma_platnosci		VARCHAR2(30)
);

CREATE TABLE H_PLATNOSCI (
	platnosci_id		NUMBER(6) CONSTRAINT hplatnosci_pk PRIMARY KEY,
	typ_platnosci_id	NUMBER(6) NOT NULL,
	CONSTRAINT hp_typ_platnosci_fk FOREIGN KEY(typ_platnosci_id) REFERENCES H_TYP_PLATNOSCI(typ_platnosci_id)
);

CREATE TABLE H_WIZYTY (
	wizyta_id	NUMBER(6) CONSTRAINT hwizyty_pk PRIMARY KEY,
	data_wizyty	DATE,
	pracownik_id	NUMBER(6) NOT NULL,
	rezerwacja_id	NUMBER(6) NOT NULL,
	sprzet_id	NUMBER(6) NOT NULL,	
	platnosci_id	NUMBER(6) NOT NULL,
	CONSTRAINT hw_pracownicy_fk FOREIGN KEY(pracownik_id) REFERENCES H_PRACOWNICY(pracownik_id),
	CONSTRAINT hw_rezerwacja_fk FOREIGN KEY(rezerwacja_id) REFERENCES H_REZERWACJA(rezerwacja_id),
	CONSTRAINT hw_sprzet_fk FOREIGN KEY(sprzet_id) REFERENCES H_SPRZET(sprzet_id),
	CONSTRAINT hw_platnosci_fk FOREIGN KEY(platnosci_id) REFERENCES H_PLATNOSCI(platnosci_id)
);