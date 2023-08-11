CREATE TABLE studentMarks 
(stud_id SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
total_marks INT, 
grade VARCHAR(5));

INSERT INTO studentMarks(total_marks, grade) 
VALUES(450, 'A'), (480, 'A+'), (490, 'A++'), 
(440, 'B+'),(400, 'C+'),(380,'C'),(250, 'D'),
(200,'E'),(100,'F'),(150,'F'),(220, 'E');

