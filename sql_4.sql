/*1 Suskaičiuokite kiek knygų kiekvieno autoriaus yra duomenų bazėje (įtraukdami autorius, kurie neturi knygų, bei neįtraukdami šių autorių).*/
SELECT COUNT(books.bookId), authors.name FROM books LEFT JOIN authors ON authors.authorId=books.authorId GROUP BY books.authorId;
SELECT COUNT(books.bookId), authors.name FROM books INNER JOIN authors ON authors.authorId=books.authorId GROUP BY books.authorId;

/*2 Pašalinkite autorius, kurie neturi knygų.*/
DELETE authors FROM authors LEFT JOIN books ON authors.authorId=books.authorId WHERE books.bookId IS NULL;