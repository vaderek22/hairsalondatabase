CREATE TABLE ADRESY (
	adres_id	NUMBER(6) CONSTRAINT adresy_pk PRIMARY KEY,
	ulica		VARCHAR2(50),
	nr_budynku	NUMBER(4),
	nr_mieszkania	NUMBER(4),
	kod_pocztowy	VARCHAR2(6),
	miasto		VARCHAR2(50)
);

CREATE TABLE KONTAKT (
	kontakt_id	NUMBER(6) CONSTRAINT kontakt_pk PRIMARY KEY,
	telefon		NUMBER(9),
	e_mail		VARCHAR2(50),
	UNIQUE(telefon),
	UNIQUE(e_mail)
);

CREATE TABLE OSOBY (
	osoba_id	NUMBER(6) CONSTRAINT osoby_pk PRIMARY KEY,
	imie		VARCHAR2(50),
	nazwisko	VARCHAR2(50),
	PESEL		NUMBER(11),
	adres_id	NUMBER(6) NOT NULL,
	kontakt_id	NUMBER(6) NOT NULL,
	CONSTRAINT os_adresy_fk FOREIGN KEY(adres_id) REFERENCES ADRESY(adres_id),
	CONSTRAINT os_kontakt_fk FOREIGN KEY(kontakt_id) REFERENCES KONTAKT(kontakt_id),
	UNIQUE(PESEL)
);

CREATE TABLE SIEC_SALONU (
	siec_id 	NUMBER(6) CONSTRAINT siec_salonu_pk PRIMARY KEY,
	nazwa_sieci	VARCHAR2(50)
);

CREATE TABLE REGION_SALONU (
	region_salonu_id	NUMBER(6) CONSTRAINT region_salonu_pk PRIMARY KEY,
	nazwa_regionu		VARCHAR2(50)
);

CREATE TABLE SALON (
	salon_id		NUMBER(6) CONSTRAINT salony_pk PRIMARY KEY,
	nazwa_salonu		VARCHAR2(50),
	rok_otwarcia		NUMBER(4),
	strona_internetowa	VARCHAR2(50),
	kontakt_id		NUMBER(6) NOT NULL,
	siec_id			NUMBER(6) NOT NULL,
	region_salonu_id	NUMBER(6) NOT NULL,
	CONSTRAINT s_kontakt_fk FOREIGN KEY(kontakt_id) REFERENCES KONTAKT(kontakt_id),
	CONSTRAINT s_siec_fk FOREIGN KEY(siec_id) REFERENCES SIEC_SALONU(siec_id),
	CONSTRAINT s_siec_salonu_fk FOREIGN KEY(region_salonu_id) REFERENCES REGION_SALONU(region_salonu_id)

);

CREATE TABLE SPECJALIZACJA (
	specjalizacja_id	NUMBER(6) CONSTRAINT specjalizacja_pk PRIMARY KEY,
	nazwa_specjalizacji	VARCHAR2(100),
	dodatkowe_informacje	VARCHAR2(60)		
);

CREATE TABLE PRACOWNICY (
	pracownik_id		NUMBER(6) CONSTRAINT pracownicy_pk PRIMARY KEY,
	staz			NUMBER(4),
	osoba_id		NUMBER(6) NOT NULL,
	salon_id		NUMBER(6) NOT NULL,
	specjalizacja_id	NUMBER(6) NOT NULL,
	CONSTRAINT p_osoby_fk FOREIGN KEY(osoba_id) REFERENCES OSOBY(osoba_id),
	CONSTRAINT p_salon_fk FOREIGN KEY(salon_id) REFERENCES SALON(salon_id),
	CONSTRAINT p_specjalizacja_fk FOREIGN KEY(specjalizacja_id) REFERENCES SPECJALIZACJA(specjalizacja_id)
);

CREATE TABLE USLUGI (
	usluga_id	NUMBER(6) CONSTRAINT uslugi_pk PRIMARY KEY,
	nazwa_uslugi	VARCHAR2(100),
	cena_uslugi	NUMBER(6)
);

CREATE TABLE PRZEDSTAWICIEL (
    	przedstawiciel_id	NUMBER(6) CONSTRAINT przedstawiciel_pk PRIMARY KEY,
    	osoba_id     	   	NUMBER(6) NOT NULL,
	siec_id			NUMBER(6) NOT NULL,
	CONSTRAINT pr_osoby_fk FOREIGN KEY(osoba_id) REFERENCES OSOBY(osoba_id),
	CONSTRAINT pr_siec_fk FOREIGN KEY(siec_id) REFERENCES SIEC_SALONU(siec_id)
);

CREATE TABLE WLASCICIEL_SALONU (
	wlasciciel_id	NUMBER(6) CONSTRAINT wlasciciel_salonu_id PRIMARY KEY,
	osoba_id	NUMBER(6) NOT NULL,
	salon_id	NUMBER(6) NOT NULL,
	CONSTRAINT ws_osoby_fk FOREIGN KEY(osoba_id) REFERENCES OSOBY(osoba_id),
	CONSTRAINT ws_salony_fk FOREIGN KEY(salon_id) REFERENCES SALON(salon_id)
);

CREATE TABLE TYP_SPRZETU (
	typ_sprzetu_id	NUMBER(6) CONSTRAINT typ_sprzetu_pk PRIMARY KEY,
	opis		VARCHAR2(100)
);

CREATE TABLE SPRZET (
	sprzet_id	NUMBER(6) CONSTRAINT sprzet_pk PRIMARY KEY,
	producent	VARCHAR2(50),
	typ_sprzetu_id	NUMBER(6),
	CONSTRAINT sp_typ_sprzetu_fk FOREIGN KEY(typ_sprzetu_id) REFERENCES TYP_SPRZETU(typ_sprzetu_id)
);

CREATE TABLE KLIENT (
	klient_id	NUMBER(6) CONSTRAINT klient_pk PRIMARY KEY,
	osoba_id	NUMBER(6) NOT NULL,
	CONSTRAINT k_osoby_fk FOREIGN KEY(osoba_id) REFERENCES OSOBY(osoba_id)
);

CREATE TABLE REZERWACJA (
	rezerwacja_id	NUMBER(6) CONSTRAINT rezerwacja_pk PRIMARY KEY,
	klient_id	NUMBER(6) NOT NULL,
	usluga_id	NUMBER(6) NOT NULL,
	CONSTRAINT r_klient_fk FOREIGN KEY(klient_id) REFERENCES KLIENT(klient_id),
	CONSTRAINT r_uslugi_fk FOREIGN KEY(usluga_id) REFERENCES USLUGI(usluga_id)
);

CREATE TABLE TYP_PLATNOSCI (
	typ_platnosci_id	NUMBER(6) CONSTRAINT typ_platnosci_pk PRIMARY KEY,
	forma_platnosci		VARCHAR2(50)
);

CREATE TABLE PLATNOSCI (
	platnosci_id		NUMBER(6) CONSTRAINT platnosci_pk PRIMARY KEY,
	typ_platnosci_id	NUMBER(6) NOT NULL,
	CONSTRAINT p_typ_platnosci_fk FOREIGN KEY(typ_platnosci_id) REFERENCES TYP_PLATNOSCI(typ_platnosci_id)
);

CREATE TABLE TYP_FRYZURY (
	typ_fryzury_id	NUMBER(6) CONSTRAINT typ_fryzury_pk PRIMARY KEY,
	opis		VARCHAR2(50),
	klient_id	NUMBER(6) NOT NULL,
	CONSTRAINT f_klient_fk FOREIGN KEY(klient_id) REFERENCES KLIENT(klient_id)
);

CREATE TABLE KOSMETYKI (
	kosmetyki_id	NUMBER(6) CONSTRAINT kosmetyki_pk PRIMARY KEY,
	nazwa_kosmetyku	VARCHAR2(50)
);

CREATE TABLE WIZYTY (
	wizyta_id	NUMBER(6) CONSTRAINT wizyty_pk PRIMARY KEY,
	data_wizyty	DATE,
	pracownik_id	NUMBER(6) NOT NULL,
	rezerwacja_id	NUMBER(6) NOT NULL,
	kosmetyki_id	NUMBER(6) NOT NULL,
	sprzet_id	NUMBER(6) NOT NULL,
	platnosci_id	NUMBER(6) NOT NULL,
	CONSTRAINT w_pracownicy_fk FOREIGN KEY(pracownik_id) REFERENCES PRACOWNICY(pracownik_id),
	CONSTRAINT w_rezerwacja_fk FOREIGN KEY(rezerwacja_id) REFERENCES REZERWACJA(rezerwacja_id),
	CONSTRAINT w_kosmetyki_fk FOREIGN KEY(kosmetyki_id) REFERENCES KOSMETYKI(kosmetyki_id),
	CONSTRAINT w_sprzet_fk FOREIGN KEY(sprzet_id) REFERENCES SPRZET(sprzet_id),
	CONSTRAINT w_platnosci_fk FOREIGN KEY(platnosci_id) REFERENCES PLATNOSCI(platnosci_id)
);