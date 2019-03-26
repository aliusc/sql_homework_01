/*1 Išrinkite visus įrašus, tiek iš knygų tiek iš autorių lentelių, išrinkdami pasirinktinai du stulpelius.*/
SELECT authors.authorId FROM authors UNION SELECT books.year FROM books;