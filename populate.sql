INSERT INTO author(id, name)
VALUES(0, 'Anton');
INSERT INTO author(id, name)
VALUES(1, 'Vasya');
INSERT INTO author(id, name)
VALUES(2, 'Anna');

INSERT INTO ramen(id, name, style)
VALUES(0, 'Nissin', 'Cup');
INSERT INTO ramen(id, name, style)
VALUES(1, 'New Touch', 'Pack');
INSERT INTO ramen(id, name, style)
VALUES(2, 'Wei Lih', 'Cup');

INSERT INTO review(id, stars, author_id, ramen_id)
VALUES(0, 9, 0, 0);
INSERT INTO review(id, stars, author_id, ramen_id)
VALUES(1, 6, 0, 2);
INSERT INTO review(id, stars, author_id, ramen_id)
VALUES(2, 8, 1, 1);
INSERT INTO review(id, stars, author_id, ramen_id)
VALUES(3, 8, 2, 0);
INSERT INTO review(id, stars, author_id, ramen_id)
VALUES(4, 3, 2, 2);
