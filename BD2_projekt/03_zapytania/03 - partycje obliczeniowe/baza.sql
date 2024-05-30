---1. Udział procentowy danej usługi w karierze danego pracownika.
SELECT p.pracownik_id, u.nazwa_uslugi, ROUND(100*u.usluga_id/SUM(u.usluga_id) OVER (PARTITION BY p.pracownik_id)) AS "Udzial procentowy" FROM USLUGI u
INNER JOIN REZERWACJA r ON u.usluga_id = r.usluga_id
INNER JOIN WIZYTY w ON r.rezerwacja_id = w.rezerwacja_id
INNER JOIN PRACOWNICY p ON w.pracownik_id = p.pracownik_id
ORDER BY p.pracownik_id;

---2. Udział procentowy danego pracownika, z którego usług skorzystał dany klient.
SELECT r.klient_id, p.pracownik_id, ROUND(100*w.wizyta_id/SUM(w.wizyta_id) OVER (PARTITION BY r.klient_id)) AS "Udzial procentowy" FROM REZERWACJA r
INNER JOIN WIZYTY w ON r.rezerwacja_id = w.rezerwacja_id
INNER JOIN PRACOWNICY p ON w.pracownik_id = p.pracownik_id
ORDER BY r.klient_id;

---3. Suma zysków każdego salonu w danym miesiącu danego roku.
SELECT s.nazwa_salonu, EXTRACT(YEAR FROM w.data_wizyty) Rok, EXTRACT(MONTH FROM w.data_wizyty) Miesiac,
SUM(u.cena_uslugi) OVER (PARTITION BY s.nazwa_salonu ORDER BY EXTRACT(YEAR FROM w.data_wizyty), EXTRACT(MONTH FROM w.data_wizyty)
RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS "Suma zyskow" FROM SALON s
INNER JOIN PRACOWNICY p ON s.salon_id = p.salon_id
INNER JOIN WIZYTY w ON p.pracownik_id = w.pracownik_id
INNER JOIN REZERWACJA r ON w.rezerwacja_id = r.rezerwacja_id
INNER JOIN USLUGI u ON r.usluga_id = u.usluga_id
ORDER BY s.nazwa_salonu, Rok, Miesiac;
