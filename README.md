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
## Query Result
<img width="1797" height="355" alt="image" src="https://github.com/user-attachments/assets/78bd08cb-238f-425e-a9ef-97b5081b80de" />


## 
```markdown
```
## Power BI Dashboard & Data Modeling

### Power Query Transformations

**Data Preparation Steps:**
- Standardized patient demographics and gender categories
- Calculated patient age from birthdates
- Processed encounter data with valid date ranges
- Created Length of Stay categories for analysis
- Established data model relationships between Patients and Encounters

[View Power Query transformations](powerbi/power_query_transformations.md)

![Power Query Editor](images/power_query_editor.png)

### DAX Calculations

**Age Group Categorization:**
```markdown
```dax
Age Group = 
SWITCH(
    TRUE(),
    Patient[Age] < 18, "0-17",
    Patient[Age] <= 35, "18-35", 
    Patient[Age] < 65, "36-64",
    "65+"
)
```
<img width="1386" height="385" alt="image" src="https://github.com/user-attachments/assets/46427b0e-930d-4380-a3b6-b35d8d943ff3" />

### Interactive Dashboard

**Dashboard Features:**
- Patient demographics overview with filters
- Length of Stay analysis by encounter type
- Temporal trends in hospital admissions
- Department performance metrics
- Interactive drill-through capabilities

**Key Insights Visualized:**
- 📊 **35%** of encounters are outpatient services
- ⏱️ **Average LOS** of 3.2 days across all encounter types
- 📈 **15% increase** in emergency visits during winter months
- 👥 **Gender distribution** remains consistent across all metrics

![Power BI Dashboard](images/powerbi_dashboard.png)

**Dashboard Components:**
1. **Patient Overview** - Demographics and volume metrics
2. **Encounter Analysis** - LOS and type breakdown
3. **Temporal Trends** - Monthly/quarterly patterns
4. **Department Metrics** - Performance by healthcare unit

## Tools
- Power BI
- SQL
- Python (optional)

Project Structure
