--creating SchoolDetails table
CREATE TABLE SchoolDetails (
    ManagementID varchar(255) PRIMARY KEY,
    SchoolName varchar(255),
    Address varchar(255),
    Email varchar(255),
    Password varchar(255)
);
--adding mock values to the SchoolDetails table
INSERT INTO SchoolDetails (ManagementID, SchoolName, Address, Email, Password)  
   VALUES ('admin', 'Little Flower', 'Main Road, Uppal, Hyderabad', 'testuser@relevel.com', 'password');

--creating Standards table   
CREATE TABLE Standards (
    StandardName varchar(8) PRIMARY KEY
);

--adding mock values to the Standards table
INSERT INTO Standards (StandardName)  
   VALUES ('1A');
INSERT INTO Standards (StandardName)  
   VALUES ('1B');
INSERT INTO Standards (StandardName)  
   VALUES ('2A');
INSERT INTO Standards (StandardName)  
   VALUES ('2B');
INSERT INTO Standards (StandardName)  
   VALUES ('3A');   
INSERT INTO Standards (StandardName)  
   VALUES ('3B');   
INSERT INTO Standards (StandardName)  
   VALUES ('4A');
INSERT INTO Standards (StandardName)  
   VALUES ('4B');
INSERT INTO Standards (StandardName)  
   VALUES ('5A');

   
--creating StudentDetails table
CREATE TABLE StudentDetails (
    StudentId INTEGER PRIMARY KEY,
    StandardName varchar(8) references Standards(StandardName),
    StudentName varchar(255),
    FatherName varchar(255),
    FatherMobile varchar(255)
);

--adding mock values to the StudentDetails table
INSERT INTO StudentDetails (StudentId, StandardName, StudentName, FatherName, FatherMobile)  
   VALUES (4414, '1A', 'Suresh','Sharma', '8845214522');
INSERT INTO StudentDetails (StudentId, StandardName, StudentName, FatherName, FatherMobile)
   VALUES (4471, '1A', 'Rahul','Vivek', '8845774522');
INSERT INTO StudentDetails (StudentId, StandardName, StudentName, FatherName, FatherMobile)
   VALUES (4415, '1A', 'Shiva','Shankar', '7745214522');
INSERT INTO StudentDetails (StudentId, StandardName, StudentName, FatherName, FatherMobile)
   VALUES (4416, '1A', 'Ravi','Venkat', '7488214522');
   
   
--creating FacultyDetails table
CREATE TABLE FacultyDetails (
    FacultyId INTEGER PRIMARY KEY,
    FacultyName varchar(255),
    MobileNumber varchar(255),
    Subject varchar(255)
);

--adding mock values to the FacultyDetails table
INSERT INTO FacultyDetails (FacultyId, FacultyName, MobileNumber, Subject)  
   VALUES (6685, 'Ramesh', '7784455677', 'Mathematics');
INSERT INTO FacultyDetails (FacultyId, FacultyName, MobileNumber, Subject)  
   VALUES (1147, 'Suresh', '7784447477', 'Biology');
INSERT INTO FacultyDetails (FacultyId, FacultyName, MobileNumber, Subject)  
    VALUES (8856, 'Kiran', '8869741297', 'Science');
INSERT INTO FacultyDetails (FacultyId, FacultyName, MobileNumber, Subject)  
     VALUES (4457, 'Mahesh', '7725479638', 'English');
     
   
--creating Classes table
CREATE TABLE Classes (
    ClassId INTEGER PRIMARY KEY,
    StandardName varchar(8) references Standards(StandardName),
    FacultyId INTEGER references FacultyDetails(FacultyId),
    ClassName varchar(255),
    Date DATE,
    Time varchar(255),
    DurationInMinutes INTEGER
);

--adding mock values to the Classes table 
INSERT INTO Classes (ClassId, StandardName, FacultyId, ClassName, Date, Time, DurationInMinutes)  
   VALUES (2200, '1A', 6685, 'Maths', '2021-08-05', '08:30', 60);
INSERT INTO Classes (ClassId, StandardName, FacultyId, ClassName, Date, Time, DurationInMinutes)
   VALUES (2201, '1A', 1147, 'Biology', '2021-08-05', '09:30', 60);
INSERT INTO Classes (ClassId, StandardName, FacultyId, ClassName, Date, Time, DurationInMinutes) 
   VALUES (2202, '1A', 8856, 'Science', '2021-08-05', '01:30', 60);
INSERT INTO Classes (ClassId, StandardName, FacultyId, ClassName, Date, Time, DurationInMinutes) 
   VALUES (2203, '1A', 4457, 'English', '2021-08-05', '02:30', 60);
INSERT INTO Classes (ClassId, StandardName, FacultyId, ClassName, Date, Time, DurationInMinutes)
   VALUES (2204, '1A', 6685, 'Maths', '2021-08-06', '08:30', 60);
INSERT INTO Classes (ClassId, StandardName, FacultyId, ClassName, Date, Time, DurationInMinutes)
   VALUES (2205, '1A', 1147, 'Biology', '2021-08-06', '09:30', 60);
INSERT INTO Classes (ClassId, StandardName, FacultyId, ClassName, Date, Time, DurationInMinutes)
   VALUES (2206, '1A', 8856, 'Science', '2021-08-06', '01:30', 60);
INSERT INTO Classes (ClassId, StandardName, FacultyId, ClassName, Date, Time, DurationInMinutes)
   VALUES (2207, '1A', 4457, 'English', '2021-08-06', '02:30', 60);
INSERT INTO Classes (ClassId, StandardName, FacultyId, ClassName, Date, Time, DurationInMinutes)
   VALUES (2208, '1A', 6685, 'Maths', '2021-08-09', '08:30', 60);
INSERT INTO Classes (ClassId, StandardName, FacultyId, ClassName, Date, Time, DurationInMinutes)
   VALUES (2209, '1A', 4457, 'English', '2021-08-09', '09:30', 60);
   
   
--creating ExamDetails table
CREATE TABLE ExamDetails (
    ExamId INTEGER PRIMARY KEY,
    StandardName varchar(8) references Standards(StandardName),
    FacultyId INTEGER references FacultyDetails(FacultyId),
    ExamName varchar(255),
    Date DATE,
    Time varchar(255),
    DurationInMinutes INTEGER
);


--adding mock values to the ExamDetails table
INSERT INTO ExamDetails (ExamId, StandardName, FacultyId, ExamName, Date, Time, DurationInMinutes)  
   VALUES (1234, '1A', 4457, 'English', '2021-08-10', '10:30', 90);
INSERT INTO ExamDetails (ExamId, StandardName, FacultyId, ExamName, Date, Time, DurationInMinutes)    
   VALUES (1241, '1A', 6685, 'Maths', '2021-08-11', '10:30', 90);


--creating Marks table
CREATE TABLE Marks (
    ExamId INTEGER references ExamDetails(ExamId),
    StudentId INTEGER references StudentDetails(StudentId),
    MarksObtained INTEGER,
    MaximumMarks INTEGER
);

--adding mock values to the Marks table
INSERT INTO Marks (ExamId, StudentId, MarksObtained, MaximumMarks)  
   VALUES (1234, 4414, 80, 100);
INSERT INTO Marks (ExamId, StudentId, MarksObtained, MaximumMarks)  
   VALUES (1241, 4414, 85, 100);

--creating Attendance table
CREATE TABLE Attendance (
    ClassId INTEGER references Classes(ClassId),
    StudentId INTEGER references StudentDetails(StudentId),
    Date DATE,
    Status varchar(255)
);

--adding mock values to the Attendance table
INSERT INTO Attendance (ClassId, StudentId, Date, Status)  
   VALUES (2200, 4414, '2021-08-05', 'Present');
INSERT INTO Attendance (ClassId, StudentId, Date, Status)
   VALUES (2201, 4414, '2021-08-05', 'Present');
INSERT INTO Attendance (ClassId, StudentId, Date, Status)
   VALUES (2202, 4414, '2021-08-05', 'Present');
INSERT INTO Attendance (ClassId, StudentId, Date, Status)
   VALUES (2203, 4414, '2021-08-05', 'Present');
INSERT INTO Attendance (ClassId, StudentId, Date, Status)
   VALUES (2204, 4414, '2021-08-06', 'Present');
INSERT INTO Attendance (ClassId, StudentId, Date, Status)
   VALUES (2205, 4414, '2021-08-06', 'Present');
INSERT INTO Attendance (ClassId, StudentId, Date, Status)
   VALUES (2206, 4414, '2021-08-06', 'Present');
INSERT INTO Attendance (ClassId, StudentId, Date, Status)
   VALUES (2207, 4414, '2021-08-06', 'Present');




