---1. Ilość wykorzystanych sprzętów o danym typie.
SELECT t.typ_sprzetu_id, s.producent, COUNT(w.wizyta_id) AS "Ilosc sprzetu" FROM TYP_SPRZETU t
INNER JOIN SPRZET s ON t.typ_sprzetu_id = s.typ_sprzetu_id
INNER JOIN WIZYTY w ON s.sprzet_id = w.sprzet_id
GROUP BY CUBE(t.typ_sprzetu_id, s.producent)
ORDER BY t.typ_sprzetu_id;

---2. Średni wydatek klientów na daną usługę.
SELECT u.nazwa_uslugi, r.klient_id, ROUND(AVG(u.cena_uslugi), 3) AS "Sredni wydatek" FROM USLUGI u
INNER JOIN REZERWACJA r ON u.usluga_id = r.usluga_id
INNER JOIN WIZYTY w ON r.rezerwacja_id = w.rezerwacja_id
GROUP BY CUBE(u.nazwa_uslugi, r.klient_id)
ORDER BY u.nazwa_uslugi;

---3. Średni staż pracowników w danym salonie z danego regionu.
SELECT r.nazwa_regionu, s.nazwa_salonu, ROUND(AVG(p.staz), 3) AS "Sredni staz" FROM REGION_SALONU r
INNER JOIN SALON s ON r.region_salonu_id = s.region_salonu_id
INNER JOIN PRACOWNICY p ON s.salon_id = p.salon_id
GROUP BY CUBE(r.nazwa_regionu, s.nazwa_salonu)
ORDER BY r.nazwa_regionu;