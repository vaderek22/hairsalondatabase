1. Ranking dla średniej ceny usługi.
SELECT u.nazwa_uslugi, AVG(u.cena_uslugi) AS "Srednia cena",
RANK() OVER (ORDER BY AVG(u.cena_uslugi) ASC) AS "Ranking"
FROM USLUGI u
INNER JOIN REZERWACJA r ON u.usluga_id = r.usluga_id
INNER JOIN WIZYTY w ON r.rezerwacja_id = w.rezerwacja_id
GROUP BY u.nazwa_uslugi;

2. Ranking dla ilości wykonanych usług przez pracowników.
SELECT o.nazwisko, p.pracownik_id, COUNT(w.wizyta_id) AS "Ilosc uslug",
RANK() OVER (ORDER BY COUNT(w.wizyta_id) DESC) AS "Ranking"
FROM OSOBY o
INNER JOIN PRACOWNICY p ON o.osoba_id = p.osoba_id
INNER JOIN WIZYTY w ON p.pracownik_id = w.pracownik_id
GROUP BY o.nazwisko, p.pracownik_id;

3. Ranking dla sumy zysków wygenerowanych przez salony.
SELECT s.nazwa_salonu, SUM(u.cena_uslugi) AS "Zysk",
RANK() OVER (ORDER BY SUM(u.cena_uslugi) DESC) AS "Ranking" 
FROM SALON s
INNER JOIN PRACOWNICY p ON s.salon_id = p.salon_id
INNER JOIN WIZYTY w ON p.pracownik_id = w.pracownik_id
INNER JOIN REZERWACJA r ON w.rezerwacja_id = r.rezerwacja_id
INNER JOIN USLUGI u ON r.usluga_id = u.usluga_id
GROUP BY s.nazwa_salo