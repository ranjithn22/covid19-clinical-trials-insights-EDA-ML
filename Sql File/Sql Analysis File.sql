create database covid19;
use covid19;

select * from `clinical trials`;

# Count the number of trials by status
SELECT 
    Status, COUNT(*) AS TrialCount
FROM
    `clinical trials`
GROUP BY Status
ORDER BY TrialCount DESC;

# Get the average enrollment by trial phase:
SELECT 
    Phases, AVG(Enrollment) AS AvgEnrollment
FROM
    `clinical trials`
GROUP BY Phases
ORDER BY AvgEnrollment DESC;

# List top 10 countries by number of clinical trials
SELECT 
    SUBSTRING_INDEX(Locations, ',', - 1) AS Country,
    COUNT(*) AS TrialCount
FROM
    `clinical trials`
GROUP BY Country
ORDER BY TrialCount DESC
LIMIT 10;

# Find trials that are recruiting and target adults
SELECT 
    `NCT Number`, Title, Status, Age
FROM
    `clinical trials`
WHERE
    Status LIKE 'Recruiting'
        AND Age LIKE '%Adult%';

# Get counts of trials by study type and funding source
SELECT 
    `Study Type`, `Funded Bys`, COUNT(*) AS TrialCount
FROM
    `clinical trials`
GROUP BY `Study Type` , `Funded Bys`
ORDER BY TrialCount DESC;

# Calculate the number of trials started each month
SELECT 
    DATE_FORMAT(`Start Date`, '%Y-%m') AS StartMonth,
    COUNT(*) AS TrialCount
FROM
    `clinical trials`
GROUP BY StartMonth
ORDER BY StartMonth;

# Count trials by sponsor/collaborator
SELECT `Sponsor/Collaborators`, COUNT(*) AS TrialCount
FROM `clinical trials`
GROUP BY `Sponsor/Collaborators`
ORDER BY TrialCount DESC
LIMIT 10;
