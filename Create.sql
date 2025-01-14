"""                union                """
select id, name from Branch1 union select id, name from Branch2
select id, name from Branch1 union All select id, name from Branch2
select id, name from Branch1 MINUS select id, name from Branch2
"""                Trigger                """
CREATE TRIGGER trigger_name
AFTER INSERT OR UPDATE OR DELETE ON table_name
FOR EACH ROW
BEGIN
END;
CREATE TABLE StudentLog (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER log_student_insert
AFTER INSERT ON Students
FOR EACH ROW
BEGIN
    INSERT INTO StudentLog (student_id)
    VALUES (NEW.id);
END;
CREATE DATABASE phitron;
USE phitron;
CREATE TABLE student(
    roll INT, name VARCHAR(30)
);
DROP TABLE student;
"""                                """
CREATE TABLE student(
    roll INT, name VARCHAR(30), contact CHAR(11), Email VARCHAR(30)
);
INSERT INTO student(roll, name, contact, Email)
values(101, "Aa", "01234567890", "Aa@gmail.com");
INSERT INTO student(roll, name, Email)
values(102, "Bb", "Bb@gmail.com");
INSERT INTO student(roll, name, contact, Email)
values(103, "Dd", "01234567890", "Dd@gmail.com");
INSERT INTO student(roll, name, contact, Email)
values(104, "Ee", "01234567890", "Ee@gmail.com");
INSERT INTO student(roll, name, contact, Email)
values(105, "Ff", "01234567890", "Ff@gmail.com");
SELECT * from student
DELETE from student where roll = 102
"""            UPGRADES                """
SET SQL_SAFE_UPDATES = 0
UPDATE student
SET name = "Cc", contact = "00000000000" where roll = 101
SET SQL_SAFE_UPDATES = 1
SET SQL_SAFE_UPDATES = 0
DELETE from student where roll = 105
SET SQL_SAFE_UPDATES = 1
"""            CONSTRAINT               """
CREATE TABLE student(
roll INT NOT NULL, UNIQUE, PRIMARY KEY, 
  name varchar(30) NOT NULL,
  /* NOT NULL(name), */
  contact CHAR(11) UNIQUE,
  Email VARCHAR(30) UNIQUE,
  Age INT Default '13' CHECK (Age >= 18)
  CONSTRAINT student_check CHECK(Age >= 18 AND name = 'Molla')
);
"""                QUERY                """
SELECT name, roll from student where roll = 103;
SELECT name from student where roll > (
    SELECT name from student where roll = 104
    );
SELECT name from student where roll != 102 AND roll > (
    select name from student where roll = 102
    );
"""             Rename Table            """
RENAME TABLE student to person;
ALTER TABLE student RENAME person;
ALTER TABLE person ADD email VARCHAR(30);
ALTER TABLE person MODIFY email VRCHAR(100);
ALTER TABLE person  DROP column email;
"""             DROP TABLE            """
DROP TABLE person;
DROP TABLE If EXISTS person;
DELETE from person where name = "rahim";
TRUBCATE TABLE person;
