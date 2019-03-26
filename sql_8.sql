/*1 Paruoškite duomenų bazės atnaujinimo skriptą. (tik struktūros). */

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

/* performuodami struktura turime paruošti ir duomenų migraciją */
INSERT INTO book_author (bookId, authorId)
SELECT books.bookId, authors.authorId 
FROM books 
INNER JOIN authors ON books.authorId=authors.authorId;

ALTER TABLE `books`
	COLLATE='utf8_general_ci',
	DROP COLUMN `authorId`,
	CHANGE COLUMN `title` `title` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci' AFTER `bookId`;