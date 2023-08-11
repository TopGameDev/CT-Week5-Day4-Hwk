-- Question 1

SELECT *
FROM film f;

CREATE OR REPLACE PROCEDURE insert_film(title VARCHAR, description TEXT, release_year YEAR, language_id INTEGER, rental_duration INTEGER, rental_rate NUMERIC(4,2), length INTEGER, replacement_cost NUMERIC(5,2), rating mpaa_rating)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating)
	VALUES (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating);
END;
$$;

CALL insert_film('Dracula Untold', 'The story of how a king turned into a demon to save his people', 2014, 1, 7, 5.99, 92, 19.99, mpaa_rating 'PG-13');




-- Question 2

SELECT c.category_id, c."name", count(*)
FROM category c
JOIN film_category fc  
ON c.category_id  = fc.category_id
JOIN film f
ON fc.film_id = f.film_id 
GROUP BY c.category_id, c."name"

CREATE OR REPLACE FUNCTION how_many(category_id INTEGER)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
	DECLARE movie_count INTEGER;
BEGIN 
	SELECT count(*) INTO movie_count
	FROM film_category fc
--	JOIN film_category fc  
--	ON c.category_id  = fc.category_id
--	JOIN film f
--	ON fc.film_id = f.film_id
	WHERE fc.category_id = how_many.category_id
	GROUP BY fc.category_id;
	RETURN movie_count;
END;
$$;

SELECT *
FROM category c

SELECT how_many(16);


