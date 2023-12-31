# Import necessary libraries
import pandas as pd
import matplotlib.pyplot as plt

# Step 1: Create sample data
# This data represents the age distribution of patients
age_data = {
    'AgeGroup': ['0-17', '18-35', '36-55', '56-75', '76+'],
    'NumberOfPatients': [50, 100, 75, 120, 30]
}
age_distribution_df = pd.DataFrame(age_data)

# This data represents the number of treatments per type
treatment_data = {
    'TreatmentName': ['Physical Therapy', 'Cognitive Behavioral Therapy', 'Occupational Therapy', 'Speech Therapy'],
    'NumberOfTreatments': [150, 80, 40, 30]
}
treatment_distribution_df = pd.DataFrame(treatment_data)

# Step 2: Perform data analysis
# Here you would typically have SQL queries that perform analysis
# Since we cannot run SQL queries here, we're using the provided sample data

# Step 3: Data visualization

# Visualization 1: Distribution of Patients by Age Group
plt.figure(figsize=(10, 6))
plt.bar(age_distribution_df['AgeGroup'], age_distribution_df['NumberOfPatients'], color='skyblue')
plt.xlabel('Age Group')
plt.ylabel('Number of Patients')
plt.title('Distribution of Patients by Age Group')
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()

# Visualization 2: Number of Treatments per Type
plt.figure(figsize=(10, 6))
plt.bar(treatment_distribution_df['TreatmentName'], treatment_distribution_df['NumberOfTreatments'], color='green')
plt.xlabel('Treatment Type')
plt.ylabel('Number of Treatments')
plt.title('Number of Treatments per Type')
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()
