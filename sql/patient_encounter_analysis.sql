-- Patient Encounter Analysis
-- Analysis of patient demographics and hospital encounters

SELECT
    p.Id,
    p.GENDER,
    DATEDIFF(YEAR, p.BIRTHDATE, GETDATE()) AS age,
    p.CITY,
    p.RACE,
    e.ENCOUNTERCLASS,
    e.[START] AS admission,
    e.STOP AS discharge,
    DATEDIFF(DAY, e.[START], e.STOP) AS LOS,
    YEAR(e.START) AS admission_year
FROM  
    patients p  
JOIN encounters e ON p.Id = e.PATIENT
WHERE 
    e.STOP IS NOT NULL 
    AND e.[START] IS NOT NULL
    AND DATEDIFF(DAY, e.[START], e.STOP) > 0;
