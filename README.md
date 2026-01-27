# Retail-Analitycs

## Cel projektu

Projekt przedstawia **analizę zachowań klientów brytyjskiego sklepu internetowego** opartą na danych transakcyjnych oraz segmentację metodą **RFM (Recency, Frequency, Monetary)**.

**Cel biznesowy:**

* Zrozumienie struktury przychodów.
* Identyfikacja kluczowych segmentów klientów.
* Wskazanie grup o wysokim potencjale oraz obszarów ryzyka (utrata klientów).
* Opracowanie strategii pracy z różnymi grupami klientów.

**Cel projektowy (portfolio):**

* Pokazanie umiejętności analitycznych end‑to‑end (od danych surowych do wniosków biznesowych).
* Praktyczne doświadczenie i zastosowanie segmentacji RFM.
* Stworzenie czytelnego i użytecznego dashboardu w **Power BI**.

---

## 📊 Dane

Analiza została oparta na publicznym zbiorze **Online Retail Dataset (Kaggle)**.

Charakterystyka danych:

* Dane transakcyjne sklepu internetowego z rynku **UK**.
* Okres: **2010–2011**.
* Waluta: **GBP**.

Na etapie przygotowania danych:

* Usunięto zwroty, ręczne korekty oraz rekordy niespełniające kryteriów jakości danych (m.in. brak CustomerID, wartości ujemne lub zerowe).
* Wyeliminowano rekordy bez identyfikatora klienta.
* Obliczono przychód na poziomie transakcji.

---

## 📌 Kluczowe wnioski biznesowe

1. **18% klientów generuje 60% całkowitych przychodów**
	-> Przychody są silnie skoncentrowane w wąskiej grupie klientów o najwyższej wartości.
	-> Wdrożenie programów lojalnościowych, ofert VIP oraz wcześniejszego dostępu do promocji.
	-> Cel: utrzymanie stabilnej bazy przychodowej i ograniczenie ryzyka churnu w segmencie o najwyższej wartości.

2. **Segmenty At Risk oraz Nearly Lost** obejmują łącznie **2 021 klientów (47,1% bazy)** i generują **24,9% przychodów**.
	-> Duża część klientów wykazuje spadek aktywności zakupowej, mimo istotnego wkładu w historyczne przychody.
	-> Pilne kampanie reaktywacyjne (e-mail reminder, zniżki czasowe, oferty personalizowane), z priorytetem dla segmentu At Risk.
	-> Cel: Odzyskanie części przychodów i zmniejszenie skali odpływu klientów o średniej i wysokiej wartości.

3. **Potential Loyalists** mają drugi najwyższy średni koszyk (**374 GBP**), jednak generują tylko **3,3% przychodów**
	-> Segment o wysokim potencjale wzrostu przy niskiej częstotliwości zakupów.
	-> Cross-selling, rekomendacje produktowe, zachęty do zwiększenia częstotliwości zakupów
	-> Cel: Rozwój segmentu i przekształcenie klientów w Loyal lub Champions.

4. **Mass Customers** charakteryzują się najniższym średnim koszykiem (**163 GBP**) i odpowiadają jedynie za **2% przychodów**.
	-> Segment o niskiej rentowności i ograniczonym wpływie na wynik finansowy.
	-> Automatyczne kampanie masowe oraz brak dedykowanych, kosztownych działań marketingowych.
	-> Cel: Minimalizacja kosztów obsługi przy zachowaniu podstawowej obecności marki.

---

## 📈 Dashboard

Interaktywny dashboard w **Power BI** umożliwia:

* analizę struktury klientów i przychodów,
* porównanie segmentów RFM,
* szybkie przejście od ogólnego obrazu do szczegółów.

Dashboard w Power BI nie został opublikowany online ze względu na ograniczenia konta edukacyjnego.
W folderze power_BI/ znajduje się plik .pbix oraz README ze zrzutami ekranu i opisem kluczowych metryk.

---

## 🧠 Metodologia

W projekcie prowadzono **analizę RFM**, która pozwala segmentować klientów na podstawie:

* **Recency** - jak dawno dokonali ostatniego zakupu,
* **Frequency** - jak często kupują,
* **Monetary** - jaką wartość generują.

Na tej podstawie klienci zostali przypisani do segmentów biznesowych (m.in. Champions, At Risk, Nearly Lost, Mass Customers, Potential Loyalists).

---

## 🛠️ Wykorzystane technologie

* **Power BI** - model danych, miary DAX, dashboard
* **Python (Pandas)** - eksploracja i przygotowanie danych
* **PostgreSQL** - czyszczenie i walidacja danych
* **Docker, DBeaver, Visual Studio Code** - środowisko pracy

---

## 📁 Struktura projektu

* `data\`  
	- `rfm_table.csv` - finalna tabela segmentacji RFM  
	- `sample\` - przykładowe dane (raw i po czyszczeniu)  
	- `readme.md` - opis danych i procesu przygotowania  

* `sql\` - zapytania SQL według etapów analizy  
	- `01_przeglad\`  
	- `02_sprawdzenie_jakosci\`  
	- `03_eksploracja\`  
	- `04_analiza_biznesowa\`  

* `python\`  
	- `rfm_functions.py` - funkcje do obliczeń RFM i segmentacja

* `power_BI\`  
	- `vizualizacja.pbix` - dashboard Power BI  
	- `screenshots\` - zrzuty ekranu wizualizacji  
	- `readme.md` - opis dashboardu i metryk

* `.gitignore`  
* `README.md`
