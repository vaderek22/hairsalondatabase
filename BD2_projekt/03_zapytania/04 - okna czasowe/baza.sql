---1. Sredni wydatek w danym regionie w danym miesiącu (od 2020r.).
SELECT DISTINCT re.nazwa_regionu, EXTRACT(YEAR FROM w.data_wizyty) Rok, EXTRACT(MONTH FROM w.data_wizyty) Miesiac,
ROUND(AVG(u.cena_uslugi) OVER (PARTITION BY re.nazwa_regionu ORDER BY EXTRACT(MONTH FROM w.data_wizyty)
RANGE BETWEEN 12 PRECEDING AND CURRENT ROW), 2) AS "Sredni wydatek" FROM REGION_SALONU re
INNER JOIN SALON s ON re.region_salonu_id = s.region_salonu_id
INNER JOIN PRACOWNICY p ON s.salon_id = p.salon_id
INNER JOIN WIZYTY w ON p.pracownik_id = w.pracownik_id
INNER JOIN REZERWACJA r ON w.rezerwacja_id = r.rezerwacja_id
INNER JOIN USLUGI u ON r.usluga_id = u.usluga_id
WHERE EXTRACT(YEAR FROM w.data_wizyty) BETWEEN 2020 AND EXTRACT(YEAR FROM SYSDATE)
ORDER BY re.nazwa_regionu, Rok, Miesiac;

---2. Suma zysków danego salonu w danym roku (od 2020r.).
SELECT DISTINCT s.nazwa_salonu, EXTRACT(YEAR FROM w.data_wizyty) Rok,
ROUND(SUM(u.cena_uslugi) OVER (PARTITION BY s.nazwa_salonu ORDER BY EXTRACT(YEAR FROM w.data_wizyty)
RANGE BETWEEN 2020 PRECEDING AND CURRENT ROW), 2) AS "Zysk" 
FROM SALON s
INNER JOIN PRACOWNICY p ON s.salon_id = p.salon_id
INNER JOIN WIZYTY w ON p.pracownik_id = w.pracownik_id
INNER JOIN REZERWACJA r ON w.rezerwacja_id = r.rezerwacja_id
INNER JOIN USLUGI u ON r.usluga_id = u.usluga_id
WHERE EXTRACT(YEAR FROM w.data_wizyty) BETWEEN 2020 AND EXTRACT (YEAR FROM SYSDATE)
ORDER BY s.nazwa_salonu, Rok;

---3. Liczba klientów danego salonu w danym miesiącu 2020 roku.
SELECT DISTINCT s.nazwa_salonu, EXTRACT(YEAR FROM w.data_wizyty) Rok, EXTRACT(MONTH FROM w.data_wizyty) Miesiac,
ROUND(COUNT(r.klient_id) OVER (PARTITION BY s.nazwa_salonu ORDER BY EXTRACT(MONTH FROM w.data_wizyty)
RANGE BETWEEN 12 PRECEDING AND CURRENT ROW), 2) AS "Liczba klientow" 
FROM SALON s
INNER JOIN PRACOWNICY p ON s.salon_id = p.salon_id
INNER JOIN WIZYTY w ON p.pracownik_id = w.pracownik_id
INNER JOIN REZERWACJA r ON w.rezerwacja_id = r.rezerwacja_id
INNER JOIN USLUGI u ON r.usluga_id = u.usluga_id
WHERE EXTRACT(YEAR FROM w.data_wizyty) = 2020
ORDER BY s.nazwa_salonu, Miesiac;