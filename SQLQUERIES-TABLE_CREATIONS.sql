CREATE TABLE dim_location (
    LocationID INT PRIMARY KEY,
    Country VARCHAR(50),
    State VARCHAR(50),
    City VARCHAR(50)
);

-- Second, create dim_workplace (since dim_employee references it)
CREATE TABLE dim_workplace (
    WorkplaceType VARCHAR(50) PRIMARY KEY,
    CompanySize VARCHAR(50)
);

-- Third, create dim_health
CREATE TABLE dim_health (
    HealthID INT PRIMARY KEY,
    PreviousMentalHealthIssues VARCHAR(50),
    SubstanceUse VARCHAR(50)
);

-- Fourth, create dim_employee (it references dim_location & dim_workplace)
CREATE TABLE dim_employee (
    EmployeeID VARCHAR(100) PRIMARY KEY,
    Age INT,
    Gender VARCHAR(10),
    JobRole VARCHAR(100),
    LocationID INT,
    WorkplaceType VARCHAR(50),  -- Foreign key to dim_workplace
    FOREIGN KEY (LocationID) REFERENCES dim_location(LocationID),
    FOREIGN KEY (WorkplaceType) REFERENCES dim_workplace(WorkplaceType)
);

-- Fifth, create dim_job_satisfaction (it references dim_employee)
CREATE TABLE dim_job_satisfaction (
    EmployeeID VARCHAR(100) PRIMARY KEY,
    SalarySatisfaction INT,
    FOREIGN KEY (EmployeeID) REFERENCES dim_employee(EmployeeID)
);

-- Sixth, create dim_date
CREATE TABLE dim_date (
    DateID INT PRIMARY KEY,
    FullDate DATE,
    Year INT,
    Quarter INT,
    Month INT,
    Day INT
);


-- Seventh, create fact_work_details (it references dim_employee & dim_date)
CREATE TABLE fact_work_details (
    EmployeeID VARCHAR(100),
    WorkHoursPerWeek INT,
    Workload VARCHAR(50),
    BurnoutLevel VARCHAR(50),
    DateID INT,
    FOREIGN KEY (EmployeeID) REFERENCES dim_employee(EmployeeID),
    FOREIGN KEY (DateID) REFERENCES dim_date(DateID)
);

-- Eighth, create fact_health_details (it references dim_employee & dim_date)
CREATE TABLE fact_health_details (
    EmployeeID VARCHAR(100),
    SleepHoursPerDay INT,
    StressLevel INT,
    ExerciseFrequencyPerWeek INT,
    DepressionLevel VARCHAR(50),
    AnxietyLevel INT,
    DateID INT,
    FOREIGN KEY (EmployeeID) REFERENCES dim_employee(EmployeeID),
    FOREIGN KEY (DateID) REFERENCES dim_date(DateID)
);
INSERT INTO fact_work_details (EmployeeID, WorkHoursPerWeek, Workload, BurnoutLevel, DateID) VALUES
('A12', 20, 'Medium', 'Moderate', 1),
('Anitha', 20, 'Medium', 'Moderate', 2),
('SANJANA', 45, 'Medium', 'Mild', 3),
('Rajendra Reddy', 8, 'Medium', 'Severe', 4),
('Prem', 60, 'Medium', 'Moderate', 5),
('Ramu', 55, 'High', 'Severe', 6),
('Medagam lakshmi Nanditha', 96, 'Medium', 'Moderate', 7),
('Leela Shakunya Devi', 50, 'Medium', NULL, 8),
('Indu', 60, 'High', 'Mild', 9),
('Vikas', 8, 'Medium', 'Moderate', 10),
('Karthik', 8, 'Medium', 'Moderate', 1),
('Malli', 8, 'Medium', 'Moderate', 2),
('Babu', 8, 'Low', 'Moderate', 3),
('Aswanth', 8, 'Low', 'Mild', 4),
('Balaji', 8, 'Low', 'Severe', 5);
INSERT INTO fact_health_details (EmployeeID, SleepHoursPerDay, StressLevel, ExerciseFrequencyPerWeek, DepressionLevel, AnxietyLevel, DateID) VALUES
('A12', 7, 3, 1, 'Mild', 1, 1),
('Anitha', NULL, 5, 3, 'Severe', 0, 2),
('SANJANA', 7, 3, 3, 'Mild', 2, 3),
('Rajendra Reddy', 6, 3, 0, 'Moderate', 3, 4),
('Prem', 7, 4, 2, 'Moderate', 3, 5),
('Ramu', 6, 5, 4, 'Moderate', 4, 6),
('Medagam lakshmi Nanditha', 8, 3, 3, 'Moderate', 4, 7),
('Leela Shakunya Devi', 9, 4, 3, 'Moderate', 3, 8),
('Indu', 6, 4, 4, 'Moderate', 4, 9),
('Vikas', 8, 3, 3, 'Severe', 3, 10),
('Karthik', 8, 2, 2, 'Moderate', 2, 1),
('Malli', 8, 2, 4, 'Severe', 4, 2),
('Babu', 8, 3, 4, 'Severe', 4, 3),
('Aswanth', 8, 3, 3, 'Moderate', 3, 4),
('Balaji', 8, 5, 5, 'None', 5, 5);





INSERT INTO dim_location (LocationID, Country, State, City) VALUES
(1, 'Australia', 'Queensland', 'Cairns'),
(2, 'India', 'Delhi', 'Saket'),
(3, 'Germany', 'Hamburg', 'Hamburg'),
(4, 'Australia', 'Western Australia', 'Bunbury'),
(5, 'Australia', 'Victoria', 'Ballarat'),
(6, 'Germany', 'Hesse', 'Frankfurt'),
(7, 'Canada', 'Quebec', 'Montreal'),
(8, 'Canada', 'British Columbia', 'Victoria'),
(9, 'Germany', 'Hesse', 'Wiesbaden'),
(10, 'India', 'Tamil Nadu', 'Chennai'),
(11, 'USA', 'Florida', 'Orlando'),
(12, 'Germany', 'Berlin', 'Berlin'),
(13, 'India', 'Delhi', 'Saket'),
(14, 'USA', 'Texas', 'Austin'),
(15, 'Germany', 'Bavaria', 'Munich'); -- Changed duplicate
INSERT INTO dim_workplace (WorkplaceType, CompanySize) VALUES
('Remote', 'Medium [50-500]'),
('On-site', 'Medium [50-500]'),
('Small Remote', 'Small [<50]'),
('Large Remote', 'Large [>500]'),
('Hybrid', 'Medium [50-500]');

INSERT INTO dim_health (HealthID, PreviousMentalHealthIssues, SubstanceUse) VALUES
(1, 'NO', 'None'),
(2, 'Yes', 'Occasional'),
(3, 'NO', 'None'),
(4, 'Yes', 'None'),
(5, 'Yes', 'None'),
(6, 'NO', 'None'),
(7, 'NO', 'None'),
(8, 'NO', 'None'),
(9, 'Yes', 'Frequent'),
(10, 'Yes', 'Frequent'),
(11, 'Yes', 'Frequent'),
(12, 'Yes', 'Frequent'),
(13, 'Yes', 'Frequent'),
(14, 'Yes', 'Frequent'),
(15, 'NO', 'Frequent');
INSERT INTO dim_employee (EmployeeID, Age, Gender, JobRole, LocationID) VALUES
('A12', 28, 'Female', 'Other', 1),
('Anitha', 28, 'Female', 'Manager', 2),
('SANJANA', 20, 'Female', 'Developer', 3),
('Rajendra Reddy', 21, 'Male', 'Other', 4),
('Prem', 30, 'Male', 'Other', 5),
('Ramu', 40, 'Male', 'Manager', 6),
('Medagam lakshmi Nanditha', 20, 'Female', 'Other', 7),
('Leela Shakunya Devi', 30, 'Female', 'Other', 8),
('Indu', 35, 'Female', 'Manager', 9),
('Vikas', 26, 'Male', 'Manager', 10),
('Karthik', 26, 'Male', 'Manager', 11),
('Malli', 26, 'Male', 'Developer', 12),
('Babu', 26, 'Male', 'Developer', 13),
('Aswanth', 25, 'Male', 'Developer', 14),
('Balaji', 26, 'Male', 'Developer', 15);
INSERT INTO dim_date (DateID, FullDate, Year, Quarter, Month, Day) VALUES
(1, '2022-01-01', 2022, 1, 1, 1),
(2, '2022-01-14', 2022, 1, 1, 14),
(3, '2022-01-28', 2022, 1, 1, 28),
(4, '2022-02-11', 2022, 1, 2, 11),
(5, '2022-02-25', 2022, 1, 2, 25),
(6, '2022-03-11', 2022, 1, 3, 11),
(7, '2022-03-25', 2022, 1, 3, 25),
(8, '2022-04-08', 2022, 2, 4, 8),
(9, '2022-04-21', 2022, 2, 4, 21),
(10, '2022-05-05', 2022, 2, 5, 5);
INSERT INTO dim_job_satisfaction (EmployeeID, SalarySatisfaction) VALUES
('A12', 4),
('Anitha', 3),
('SANJANA', 5),
('Rajendra Reddy', 2),
('Prem', 4),
('Ramu', 3),
('Medagam lakshmi Nanditha', 5),
('Leela Shakunya Devi', 3),
('Indu', 4),
('Vikas', 2),
('Karthik', 3),
('Malli', 4),
('Babu', 5),
('Aswanth', 3),
('Balaji', 4);








