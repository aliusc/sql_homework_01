DELETE FROM authors WHERE authorId IN (@insertIdFirst, @insertIdSecond);