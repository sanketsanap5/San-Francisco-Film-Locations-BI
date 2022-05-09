-- Big Query Public Data
-- san francisco film locations
-- r sherman
-- 2022-03-19
--
SELECT
	title,
	release_year,
	locations,
	fun_facts,
	production_company,
	distributor,
	director,
	writer,
	actor_1,
	actor_2,
	actor_3
FROM `bigquery-public-data`.san_francisco_film_locations.film_locations