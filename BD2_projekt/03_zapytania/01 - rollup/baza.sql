---1. Ilość usług, z których skorzystał dany klient
SELECT u.nazwa_uslugi, r.klient_id, COUNT(w.wizyta_id) AS "Ilosc uslug" FROM USLUGI u
INNER JOIN REZERWACJA r ON u.usluga_id = r.usluga_id
INNER JOIN WIZYTY w ON r.rezerwacja_id = w.rezerwacja_id
GROUP BY ROLLUP(u.nazwa_uslugi, r.klient_id);

---2. Ilość wykorzystanych form płatności za daną usługę.
SELECT t.forma_platnosci, r.usluga_id, COUNT(w.wizyta_id) AS "Ilosc platnosci" FROM TYP_PLATNOSCI t
INNER JOIN PLATNOSCI p ON t.typ_platnosci_id = p.typ_platnosci_id
INNER JOIN WIZYTY w ON p.platnosci_id = w.platnosci_id
INNER JOIN REZERWACJA r ON r.rezerwacja_id = w.rezerwacja_id
GROUP BY ROLLUP(t.forma_platnosci, r.usluga_id);

---3. Ilość pracowników o danej specjalizacji w danym salonie.
SELECT s.nazwa_salonu, p.pracownik_id, sp.nazwa_specjalizacji, COUNT(p.pracownik_id) AS "Ilosc pracownikow" FROM SPECJALIZACJA sp
INNER JOIN PRACOWNICY p ON sp.specjalizacja_id = p.specjalizacja_id
INNER JOIN SALON s ON p.salon_id = s.salon_id
GROUP BY ROLLUP (s.nazwa_salonu, p.pracownik_id, sp.nazwa_specjalizacji);