# Dashboard Power BI – Segmentacja klientów (RFM)

Folder `power_BI/` zawiera interaktywny dashboard Power BI wspierający analizę klientów oraz ocenę ich wartości biznesowej na podstawie segmentacji RFM.

---

## Cel dashboardu

Dashboard został zaprojektowany w celu:
- szybkiej identyfikacji kluczowych segmentów klientów,
- analizy koncentracji przychodów,
- wykrywania segmentów zagrożonych odpływem klientów,
- wsparcia decyzji dotyczących retencji, reaktywacji oraz rozwoju klientów.

---

## Główne KPI i metryki

Dashboard prezentuje m.in.:

- liczbę klientów,
- całkowity przychód,
- średnią wartość zamówienia (AOV),
- mediany Recency, Frequency oraz Monetary.

Wszystkie metryki oparte są na miarach DAX oraz finalnej tabeli RFM.  
Metryki dobrano w celu oceny wartości klientów, ich aktywności zakupowej oraz potencjału retencyjnego.

---

## Struktura dashboardu

Dashboard składa się z jednej strony, logicznie podzielonej na obszary analityczne (sekcje wizualne):

1. **Overview**
   - struktura klientów i przychodów,
   - udział segmentów RFM,
   - identyfikacja kluczowych grup biznesowych.

2. **Segment Analysis**
   - porównanie segmentów pod kątem RFM,
   - średni koszyk i udział w sprzedaży,
   - identyfikacja segmentów wysokiej i niskiej wartości.

---

## Logika analityczna

- Segmentacja oparta na analizie **RFM (Recency, Frequency, Monetary)**.
- Klienci zostali przypisani do segmentów biznesowych na podstawie kwantyli.
- Model danych oparty jest na jednej tabeli RFM przygotowanej na poziomie klienta.
- Zastosowano miary DAX do obliczeń dynamicznych i filtrów kontekstowych.

---

## Uwagi techniczne

- Dashboard nie został opublikowany online ze względu na ograniczenia konta edukacyjnego Power BI.
- Do uruchomienia wymagany jest Power BI Desktop.
- Plik źródłowy: `RFM-vizualizacja.pbix`.



