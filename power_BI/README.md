# Dashboard Power BI – Segmentacja klientów (RFM)

Folder `power_BI/` zawiera interaktywny dashboard Power BI wspierający analizę klientów oraz ocenę ich wartości biznesowej na podstawie segmentacji RFM.

---

## Podgląd dashboardu

![Dashboard – przegląd ogólny](screenshots/dashboard_overview.png)

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

- liczba klientów (łącznie i wg segmentów),
- udział segmentów w całkowitych przychodach,
- średnia wartość koszyka (Average Order Value),
- Recency, Frequency, Monetary na poziomie segmentów,
- koncentracja przychodów (Pareto).

Wszystkie metryki oparte są na miarach DAX oraz finalnej tabeli RFM.

---

## Struktura dashboardu

Dashboard składa się z logicznych sekcji umożliwiających analizę od ogółu do szczegółu:

1. **Overview**
   - struktura klientów i przychodów,
   - udział segmentów RFM,
   - identyfikacja kluczowych grup biznesowych.

2. **Segment Analysis**
   - porównanie segmentów pod kątem RFM,
   - średni koszyk i udział w sprzedaży,
   - identyfikacja segmentów wysokiej i niskiej wartości.

3. **Customer Risk & Potential**
   - segmenty At Risk i Nearly Lost,
   - segmenty o wysokim potencjale wzrostu,
   - wsparcie decyzji reaktywacyjnych i retencyjnych.

---

## Logika analityczna

- Segmentacja oparta na analizie **RFM (Recency, Frequency, Monetary)**.
- Klienci zostali przypisani do segmentów biznesowych na podstawie kwantyli.
- Model danych oparty na tabeli faktów (transakcje) oraz tabeli klientów (RFM).
- Zastosowano miary DAX do obliczeń dynamicznych i filtrów kontekstowych.

---

## Zrzut ekranu

W folderze `screenshots/` znajduje się zrzut ekranu prezentujący widok ogólny dashboardu.

(Zrzut umożliwia zapoznanie się z dashboardem bez uruchamiania pliku `.pbix`).

---

## Uwagi techniczne

- Dashboard nie został opublikowany online ze względu na ograniczenia konta edukacyjnego Power BI.
- Do uruchomienia wymagany jest Power BI Desktop.
- Plik źródłowy: `RFM-vizualizacja.pbix`.

