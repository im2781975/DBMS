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
"""              project                """
CREATE TABLE student(
    serial int PRIMARY KEY,
    name VARCHAR(20), age INT );
INSERT INTO student(serial, name, age)
VALUES(1, 'Ankit', 17), (2, 'Ramya', 18), (3, 'Ram', 16);
select * From student;
CREATE TABLE course(
    course_id INT, name VARCHAR(20) );
INSERT INTO student(course_id, name)
VALUES(101, "python"), (102, " CPP"), (103, "DBMS");
select * From course;
CREATE TABLE enroll(
    serial INT, course_id INT, admit_date date,
    PRIMARY KEY(serial, course_id),
    FOREIGN KEY(serial) REFERENCES student(serial)
        ON DELETE CASCADE,
    FOREIGN KEY(course_id) REFERENCES course(course_id)
        ON DELETE CASCADE
);
INSERT INTO enroll(serial, course_id, admit_date)
VALUES(1, 101, "06-01-21"), (1, 102, "06-01-21"), (2, 103, "06-01-21");
select * from enroll
SET SQL_SAFE_UPDATES = 0;
DELETE from student where name = "mollavai"
SET SQL_SAFE_UPDATES = 1;
"""               project               """
CREATE TABLE student(
    serial INT PRIMARY KEY,
    name VARCHAR(30) NOT NULL );
CREATE TABLE course(
    course_id INT, course_name VARCHAR(30),
    PRIMARY KEY(course_id)
);
CREATE TABLE enroll(
    serial INT, course_id INT, admitDate date,
    PRIMARY KEY(serial, course_id),
    FOREIGN KEY(serial) REFERENCES student,
    FOREIGN KEY(course_id) REFERENCES course
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
