SELECT*FROM britishlib

--Cleaning the column Place of Publication

UPDATE britishlib
SET [Place of Publication] = 'London'
WHERE [Place of Publication] = 'London]'

UPDATE britishlib
SET [Place of Publication] = 'London'
WHERE [Place of Publication] LIKE '%London%'

UPDATE britishlib
SET [Place of Publication] = 'Paris'
WHERE [Place of Publication] LIKE '%Paris%'

UPDATE britishlib
SET [Place of Publication] = 'Boston'
WHERE [Place of Publication] LIKE '%Boston%'

UPDATE britishlib
SET [Place of Publication] = 'Edinburgh'
WHERE [Place of Publication] LIKE '%Edinburgh%'

SELECT [Place of Publication] FROM britishlib

-- Dropping unnecessary columns

ALTER TABLE britishlib
DROP COLUMN [Edition Statement]

ALTER TABLE britishlib
DROP COLUMN [Corporate Author], [Corporate Contributors], [Former Owner], [Engraver]

-- Dropping rows with NULL

SELECT*FROM britishlib
WHERE Title IS NULL AND Author IS NULL AND Publisher IS NULL

DELETE FROM britishlib
WHERE [Place of Publication] IS NULL AND [Author] IS NULL

DELETE FROM britishlib
WHERE Title IS NULL AND Author IS NULL AND Publisher IS NULL

-- Filling out empty Author

SELECT*FROM britishlib
WHERE Author IS NULL AND Title LIKE '%by%'

SELECT SUBSTRING(Title, CHARINDEX('by',Title)+3, CHARINDEX(']',Title)) FROM britishlib
WHERE Title IS NULL

UPDATE britishlib
SET Author = SUBSTRING(Title, CHARINDEX('by',Title)+3, CHARINDEX(']',Title))
WHERE Title IS NULL
