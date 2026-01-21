# RFM Analiza klientów
# Autor: Milana Ksenafontava
# Data: 30 listopada 2025

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np

# Ustawienia wyświetlania Pandas
pd.set_option('display.max_columns', None)

# 1. Wczytanie danych
try:
    df = pd.read_csv('D:/projects/Retail-Analytics/data/RFM-data/rfm_transactions_202511261935.csv', parse_dates=['invoice_date'])
    print("Dane zostały pomyślnie załadowane.")
except FileNotFoundError:
    print("Błąd: Nie znaleziono określonego pliku.")


print(f"Rozmiar danych: {df.shape}")
print(f"Liczba unikalnych klientów: {df['customer_id'].nunique()}")
print(f"Okres danych: od {df['invoice_date'].min()} do {df['invoice_date'].max()}")

# 2. Obliczenie metryk RFM

## Ustalenie daty analizy jako dzień po ostatniej dacie faktury w danych
analysis_date = df['invoice_date'].max() + pd.Timedelta(days=1)
print (f"Data analizy: {analysis_date}")

## Grupowanie danych według customer_id i obliczanie metryk RFM
rfm_table = df.groupby('customer_id').agg({
    'invoice_date': lambda x: (analysis_date - x.max()).days, #Recency - dni od ostatniego zakupu
    'invoice': 'nunique', #Frequency - liczba unikalnych faktur
    'revenue': 'sum' #Monetary - całkowite przychody
}).rename(columns={
    'invoice_date': 'Recency',
    'invoice': 'Frequency',
    'revenue': 'Monetary'
}).round(2)

print(f"Tabela RFM utworzona dla {len(rfm_table)} klientów")

# 3. Przypisanie ocen RFM
# Definiowanie przedziałów dla ocen R, F, M

## Recency: im mniejsza wartość, tym wyższa ocena
recency_bins = [0, 15, 35, 75, 180, float('inf')]
recency_labels = [5, 4, 3, 2, 1]
rfm_table['R_Score'] = pd.cut(rfm_table['Recency'], bins=recency_bins, labels=recency_labels, right=True)

## Frequency: im większa wartość, tym wyższa ocena
frequency_bins = [1, 2, 3, 5, 10, float('inf')]
frequency_labels = [1, 2, 3, 4, 5]
rfm_table['F_Score'] = pd.cut(rfm_table['Frequency'], bins=frequency_bins, labels=frequency_labels, right=False)

## Monetary: im większa wartość, tym wyższa ocena
monetary_bins = [0, 250, 550, 1000, 2500, float('inf')]
monetary_labels = [1, 2, 3, 4, 5]
rfm_table['M_Score'] = pd.cut(rfm_table['Monetary'], bins=monetary_bins, labels=monetary_labels, right=False)

print("Rozkład ocen RFM:")
for score in ['R_Score', 'F_Score', 'M_Score']:
    print(f"\n{score}:")
    print(rfm_table[score].value_counts().sort_index())

# 4. Segmentacja klientów na podstawie ocen RFM

## Tworzenie kombinacji ocen RFM
rfm_table['RFM_Score'] = (
    rfm_table['R_Score'].astype(str) + 
    rfm_table['F_Score'].astype(str) + 
    rfm_table['M_Score'].astype(str)
)

## Funkcja do przypisania segmentów na podstawie ocen RFM
def rfm_segments(df):
    r, f, m = df['R_Score'], df['F_Score'], df['M_Score']
    
    # 1. Chamopions 
    if r >= 4 and f >= 4 and m >= 4:
        return 'Champions'  
    
    # 2. Loyal Customers
    elif r > 3 and f >= 3 and m >= 3:
        return 'Loyal'  
    
    # 3. Potential Loyalists 
    elif r >= 4 and f <= 2 and m >= 2:  
        return 'Potential Loyalists' 
    
    # 4. At Risk 
    elif (r == 3 or r == 2) and f >= 2 and m >= 2:  
        return 'At Risk'
    
    # 5. Sleeping 
    elif r <= 2 and f >= 2 and m >= 2:  
        return 'Sleeping'
    
    # 6. Mass Customers
    elif r >= 3 and m <= 2:
        return 'Mass Customers'
    
    # 7. Others
    else: 
        return 'Nearly Lost'

# Przypisanie segmentów do wszystkich klientów
rfm_table['Segment'] = rfm_table.apply(rfm_segments, axis=1)

# 5. Analiza wyników

## Rozkład klientów pomiędzy segmentami
segment_counts = rfm_table['Segment'].value_counts()
print("\nSegmenty klientów na podstawie wyników RFM:\n", segment_counts)

## Szczegółowa analiza segmentów
segment_analysis = rfm_table.groupby('Segment').agg({
    'Recency': 'mean',      # Średnia liczba dni od ostatniego zakupu
    'Frequency': 'mean',    # Średnia liczba zakupów
    'Monetary': 'mean',     # Średnia wartość wydatków
    'RFM_Score': 'count'    # Liczba klientów w segmencie
}).rename(columns={'RFM_score': 'Count'})
print("\nAnaliza segmentowa:\n", segment_analysis. round(2))

## Analiza udziału w przychodach według segmentów
revenue_by_segment = rfm_table.groupby('Segment')['Monetary'].sum()
total_revenue = revenue_by_segment.sum()
revenue_percentage = ((revenue_by_segment / total_revenue) * 100).round(1)

print("\nUdział segmentów w całkowitych przychodach:")
for segment in revenue_percentage.sort_values(ascending=False).index:
    print(f"Segment: {segment}, Udział w przychodach: {revenue_percentage[segment]}%")

rfm_table['Monetary'] = rfm_table['Monetary'].astype(str).str.replace('.', ',')

# Zapisanie tabeli RFM do pliku CSV
rfm_table.to_csv('rfm_table.csv', index=True, decimal=',')


