CREATE TABLE `news` (
	`newsId` INT(11) NOT NULL AUTO_INCREMENT,
	`text` TEXT NOT NULL,
	`date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPdate CURRENT_TIMESTAMP,
	PRIMARY KEY (`newsId`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `comments` (
	`commentId` INT(11) NOT NULL AUTO_INCREMENT,
	`text` TEXT NOT NULL,
	`date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPdate CURRENT_TIMESTAMP,
	`newsId` INT(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`commentId`),
	INDEX `newsId` (`newsId`),
	CONSTRAINT `FK_comments_news` FOREIGN KEY (`newsId`) REFERENCES `news` (`newsId`) ON UPDATE NO ACTION ON DELETE CASCADE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=3
;

SELECT news.newsId, news.date AS 'newsdate', news.text AS 'newsText', comments.date AS 'commentdate', comments.text AS 'commentText'
FROM news
INNER JOIN (
	SELECT MAX(comments.date) AS 'last_comment_date', comments.newsId
	FROM comments
	GROUP BY comments.newsId
) AS last_news_comment ON news.newsId = last_news_comment.newsId 
INNER JOIN comments ON comments.newsId=last_news_comment.newsId AND comments.date=last_news_comment.last_comment_date
ORDER BY news.date DESC
LIMIT 10;