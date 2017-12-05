def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT b.title, b.year FROM books b INNER JOIN series s ON b.series_id = s.id "+
  "WHERE s.id = 1 ORDER BY b.year"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto FROM characters WHERE LENGTH(motto) = (SELECT MAX(LENGTH(motto)) FROM characters)"
end


def select_value_and_count_of_most_prolific_species
  "SELECT c.species, COUNT(c.species) FROM characters c GROUP BY c.species ORDER BY c.species DESC LIMIT 1"
end

def select_name_and_series_subgenres_of_authors
  "SELECT a.name, sub.name FROM authors a INNER JOIN series s ON a.id = s.author_id INNER JOIN subgenres sub "+
  "ON s.subgenre_id = sub.id"
end

def select_series_title_with_most_human_characters
  "SELECT s.title FROM series s INNER JOIN books b ON s.id = b.series_id INNER JOIN "+
  "character_books cb ON b.id = cb.book_id INNER JOIN characters c ON cb.character_id = c.id "+
  "WHERE c.species = 'human' GROUP BY s.title ORDER BY COUNT(s.title) DESC LIMIT 1"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT c.name, COUNT(cb.character_id) FROM characters c INNER JOIN character_books cb ON c.id = cb.character_id "+
  "GROUP BY c.name ORDER BY COUNT(cb.character_id) DESC"
end
