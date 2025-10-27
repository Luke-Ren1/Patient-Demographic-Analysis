# Project Title

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
-- Key Query Example
SELECT
    p.GENDER,
    p.RACE,
    e.ENCOUNTERCLASS,
    DATEDIFF(DAY, e.[START], e.STOP) AS LOS
FROM patients p  
JOIN encounters e ON p.Id = e.PATIENT;


```Tools & Technologies
- Power BI
- SQL
- Python (optional)

Project Structure
