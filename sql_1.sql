/*1 Išrinkite visus įrašus iš Knygų lentelės*/
SELECT books.* FROM books;

/*2 Išrinkite tik Knygų pavadinimus abėcėles tvarka.*/
SELECT books.title FROM books ORDER BY title;

/*3Suskaičiuokite, kiek knygų kiekvieno autoriaus yra knygų lentelėje*/
SELECT COUNT(books.bookId), authorId FROM books GROUP BY authorId;
