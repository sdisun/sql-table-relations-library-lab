def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT title, year
  FROM books
  WHERE series_id = 1
  ORDER BY year;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto FROM characters
  ORDER BY motto
  LIMIT 1;"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species) AS 'count' 
  FROM characters
  GROUP BY species
  ORDER BY count DESC
  LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
  FROM series
  INNER JOIN authors ON series.author_id = authors.id
  INNER JOIN subgenres ON series.subgenre_id = subgenres.id
  GROUP BY authors.id;"
end

def select_series_title_with_most_human_characters
  "SELECT series.title 
  FROM series
  INNER JOIN books ON  books.series_id = series.id
  INNER JOIN character_books ON character_books.book_id = books.id
  INNER JOIN characters ON characters.id = character_books.character_id
  WHERE characters.species = 'human'
  GROUP BY series.id
  LIMIT 1;"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(characters.name) AS count
  FROM characters
  INNER JOIN character_books ON character_books.character_id = characters.id
  GROUP BY characters.name
  ORDER BY count DESC, characters.name;"
end
