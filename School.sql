

CREATE DATABASE School1;

CREATE TABLE Classes (
    Class_ID INT NOT NULL PRIMARY KEY,
    Class_name VARCHAR(50) NOT NULL
);
CREATE TABLE Instructors (
    Instructor_ID INT PRIMARY KEY,
    Instructor_Name VARCHAR(50),
);

CREATE TABLE Students ( 
    Student_ID INT NOT NULL PRIMARY KEY,
    Student_Name VARCHAR(50),
    Class_ID INT FOREIGN KEY REFERENCES Classes(Class_ID),
    Instructor_ID INT FOREIGN KEY REFERENCES Instructors(Instructor_ID)
);



INSERT INTO Classes (Class_ID, Class_Name)

VALUES (
    1,'Software Developer Boot Camp'),
   (2,'C# Boot Camp'
);

INSERT INTO Students (Student_ID, Student_Name, Class_ID)

VALUES 
    (1,'Wilma Flintstone',2),
    (2,'George Jetson',1),
    (3,'Fred Flintstone',2),
    (4,'Barney Rubble',2),
    (5,'Elory Jetson',1),
    (6,'Jane Jetson',1)
;

INSERT INTO Instructors (Instructor_ID, Instructor_Name)

VALUES 
(1, 'Mickey Mcfinnigan'),
(2, 'Thelma Griffin')
; 

SELECT Instructor_Name 
FROM Instructors;

SELECT Student_Name 
FROM Students
ORDER BY Student_Name;

SELECT * FROM Classes AS Class

INNER JOIN Students AS Student
ON Class.Class_ID = Student.Class_ID

INNER JOIN Instructors AS Instructor
ON student.Instructor_ID = instructor.Instructor_ID ;