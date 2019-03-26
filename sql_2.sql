/*1 Papildykite autorių lentelę 2 įrašais; */
INSERT INTO authors SET name='Andrius Tapinas';
SET @insertIdFirst = LAST_INSERT_ID();
INSERT INTO authors SET name='Robert Kiyosaki';
SET @insertIdSecond = LAST_INSERT_ID();

/*2 Papildykite knygų lentelę, 3 įrašais apie knygas, kurių autorius įrašėte prieš tai.*/
INSERT INTO books SET authorId=@insertIdFirst, title='Vilko valanda', YEAR='2013';
INSERT INTO books SET authorId=@insertIdFirst, title='Maro diena', YEAR='2015';
INSERT INTO books SET authorId=@insertIdSecond, title='Rich Dad Poor Dad', YEAR='2000';

/*3 Pakeiskite vienos knygos autorių į kitą.*/
UPDATE books SET books.authorId=@insertIdFirst WHERE books.authorId=@insertIdSecond;