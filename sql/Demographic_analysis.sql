-- Patient_Demographic.sql
-- Patient Demographic Analysis

SELECT 
    department,
    COUNT(*) as total_patients,
    AVG(length_of_stay) as avg_stay_days,
    SUM(CASE WHEN readmitted_30_days = 1 THEN 1 ELSE 0 END) as readmissions,
    ROUND(
        SUM(CASE WHEN readmitted_30_days = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) as readmission_rate
FROM patient_records
GROUP BY department
ORDER BY readmission_rate DESC;
