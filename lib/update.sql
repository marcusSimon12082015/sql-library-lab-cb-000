UPDATE characters SET name = 'Martian' WHERE id = (SELECT MAX(id) FROM characters);
