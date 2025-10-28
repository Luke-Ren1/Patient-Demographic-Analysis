# Patient Demographic Analysis

## Description
Brief description of your healthcare analytics project.

## SQL Analysis

### Patient Encounter Analysis

**Objective:** Analyze patient demographics and hospital encounter patterns to understand length of stay and patient characteristics.

**Key Query Features:**
- Patient demographics (age, gender, race, location)
- Encounter types and duration
- Length of Stay (LOS) calculations
- Temporal analysis by admission year

```sql
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
```

## Tools
- Power BI
- SQL
- Python (optional)

Project Structure
