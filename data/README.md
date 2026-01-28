# Dane projektu

Folder `data/` zawiera dane wykorzystane w projekcie analizy klientów oraz segmentacji RFM.

Celem tego folderu jest przechowywanie zarówno danych wejściowych, jak i finalnych zbiorów danych użytych w analizie oraz wizualizacji.

---

## Źródło danych

Dane pochodzą z publicznego zbioru:
**Online Retail Dataset** (Kaggle)

Zbiór zawiera dane transakcyjne brytyjskiego sklepu internetowego z lat **2010–2011**.

---

## Zakres i charakter danych

Dane obejmują m.in.:
- identyfikator klienta,
- datę transakcji,
- identyfikator produktu,
- ilość,
- cenę jednostkową,
- kraj,
- numer faktury.

Waluta: **GBP**

---

## Przygotowanie i selekcja danych

Na etapie przygotowania danych:
- usunięto transakcje zwrotów oraz ręczne korekty,
- odfiltrowano rekordy bez `CustomerID`,
- usunięto wartości zerowe i ujemne (ilości i ceny),
- obliczono wartość transakcji (`revenue = quantity × unit_price`).

Celem czyszczenia danych było uzyskanie wiarygodnej bazy do analizy zachowań klientów i segmentacji RFM.

---

## Zawartość folderu

- `rfm_table.csv`  
  Finalna tabela segmentacji RFM na poziomie klienta, wykorzystywana w Power BI.  
  Zawiera metryki Customer ID, Recency, Frequency, Monetary, RFM Score oraz przypisany segment biznesowy.

- `sample/`  
  Dane zostały wybrane **losowo** z pełnego zbioru danych i mają charakter wyłącznie poglądowy.  
  Ich celem jest umożliwienie szybkiego zapoznania się ze strukturą danych oraz procesem przygotowania danych bez konieczności pracy na pełnym zbiorze.  

- `readme.md`  
  Opis danych oraz procesu ich przygotowania.

---

## Uwagi i ograniczenia

- Dane obejmują wyłącznie rynek **UK**.
- Analiza opiera się na danych historycznych (2010–2011).
- Brak danych demograficznych klientów – segmentacja oparta wyłącznie na zachowaniu zakupowym.

