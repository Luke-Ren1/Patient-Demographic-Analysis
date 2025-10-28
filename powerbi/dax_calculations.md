# DAX Calculations

## Age Group Categorization

### Primary Calculation: Patient Age Groups
```dax
Age Group = 
SWITCH(
    TRUE(),
    Patient[Age] < 18, "0-17",
    Patient[Age] <= 35, "18-35", 
    Patient[Age] < 65, "36-64",
    "65+"
)
