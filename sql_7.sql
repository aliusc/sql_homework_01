/*1 Knygos gali turėti vieną ir daugiau autorių*/

ALTER TABLE `authors` ENGINE=InnoDB;

CREATE TABLE `book_author` (
	`bookAuthorId` INT(10) NOT NULL AUTO_INCREMENT,
	`bookId` INT(10) NOT NULL DEFAULT '0',
	`authorId` INT(10) NOT NULL DEFAULT '0',
	PRIMARY KEY (`bookAuthorId`),
	UNIQUE INDEX `Index 2` (`authorId`, `bookId`),
	INDEX `FK_book_author_books` (`bookId`),
	CONSTRAINT `FK_book_author_authors` FOREIGN KEY (`authorId`) REFERENCES `authors` (`authorId`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK_book_author_books` FOREIGN KEY (`bookId`) REFERENCES `books` (`bookId`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

/*2 Sutvarkyti duomenų bazės duomenis, jei reikia papildykite naujais.*/
INSERT INTO book_author (bookId, authorId)
SELECT books.bookId, authors.authorId 
FROM books 
INNER JOIN authors ON books.authorId=authors.authorId;

ALTER TABLE `books` DROP COLUMN `authorId`;

INSERT INTO book_author SET bookId=4, authorId=7;

/*3 Išrinkite visas knygas su jų autoriais. (autorius, jei jų daugiau nei vienas atskirkite kableliais)*/
SELECT books.title AS book, GROUP_CONCAT(authors.NAME SEPARATOR ', ') AS 'authors'
FROM books
INNER JOIN book_author ON books.bookId=book_author.bookId
INNER JOIN authors ON book_author.authorId=authors.authorId
GROUP BY books.bookId
ORDER BY books.title

/*4 Sutvarkykite  knygų lentelę, kad galėtumėte išsaugoti originalų knygos pavadinimą. (Pavadinime išsaugokite, lietuviškas raides kaip ą,ė,š ir pan.)*/
ALTER TABLE `books`
	COLLATE='utf8_general_ci',
	CHANGE COLUMN `title` `title` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci' AFTER `bookId`;