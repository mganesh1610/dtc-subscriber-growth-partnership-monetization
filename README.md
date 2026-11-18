# International DTC Streaming Subscriber Growth, Content/Macro Driver Forecasting & Wholesale Partnership Deal Structuring Engine

An end-to-end Direct-to-Consumer (DTC) international streaming subscriber planning, cohort retention, wholesale distribution partnership deal structuring, and executive reporting suite built with **Excel (`.xlsx` live formula business model)**, **SQL (`SQL Joins & CTEs`, Window Functions)**, **Python 3**, and a **schema-grounded AI executive deck variance brief generator** across **102,438 SHA-256-verified public records**.

---

## 1. Executive Architecture & Business Scope

1. **International Regional Subscriber Business Planning (`12` Markets / `192` Region-Quarters):**
   - Models quarterly `Beginning Subscribers`, `Gross Additions`, `Voluntary & Involuntary Churn`, `Net Additions`, `ARPU`, and `Recurring Subscription Revenue` across **12 international markets** (`United Kingdom`, `Germany`, `France`, `Spain`, `Italy`, `Japan`, `South Korea`, `India`, `Australia`, `Brazil`, `Mexico`, and `Canada`) grouped into `EMEA`, `APAC`, `LATAM`, and `NAM-INTL`.
   - Quantifies both **internal drivers** (tentpole movie & series release cadence, multi-service streaming bundle share, annual vs. monthly contract mix) and **external drivers** (World Bank country-level GDP growth, CPI inflation headwinds, and seasonal competitor launch waves).
2. **Wholesale Telco & Distribution Partnership Deal Structuring (`6` Deal Structures):**
   - Evaluates wholesale carrier/broadband bundle structures (`Unfenced Telco Promo`, `Soft Broadband Bundle`, `Ad-Supported Carrier Tier`, `Tenure-Fenced Hard Bundle`, and `Q4 Tentpole Fenced Ad-Hybrid`) to maximize **net incremental subscribers** and **operating income (`OI`)** while bounding **retail subscriber cannibalization** and timing deal launches to fiscal Q4 capital-market guidance windows.
3. **Dynamic Multi-Tab Excel Financial Model & Grounded AI Executive Deck Briefs:**
   - Generates `outputs/dtc_subscriber_growth_partnership_model.xlsx` with live Excel formulas (`SUM`, subtraction/stock-flow identities, cross-sheet KPI references) alongside `outputs/executive_deck_variance_brief.json` with 100% SQL-verified slide takeaways (`0` ungrounded metrics).

---

## 2. Verified Public Datasets & SHA-256 Provenance (`102,438` Combined Rows)

| Dataset File | Public Source | Verified Scale | SHA-256 Checksum |
| :--- | :--- | :---: | :--- |
| `data/Telco-Customer-Churn.csv` | IBM Recurring Subscription & Streaming Add-On Cohort Dataset (`https://raw.githubusercontent.com/IBM/telco-customer-churn-on-icp4d/master/data/Telco-Customer-Churn.csv`) | `7,043` accounts × `21` cols | `16320c9c1ec72448db59aa0a26a0b95401046bef5d02fd3aeb906448e3055e91` |
| `data/global_streaming_titles.csv` | Global Streaming Movies & TV Series Catalog (`https://raw.githubusercontent.com/prasertcbs/basic-dataset/master/netflix_titles.csv`) | `6,234` titles × `12` cols | `7df8166ec178f05b79ad9fbe2be95816bccf14c88dfe30423f60001894b377e5` |
| `data/world_bank_gdp.csv` | World Bank Country-Year GDP Series (`https://raw.githubusercontent.com/datasets/gdp/main/data/gdp.csv`) | `13,979` rows × `4` cols | `8d84ef6bcaccf740c01c5ed7566aae8f7b149d0e2c20001e441efd3cb5b2fa86` |
| `data/world_bank_cpi.csv` | World Bank Country-Year CPI Inflation Series (`https://raw.githubusercontent.com/datasets/cpi/main/data/cpi.csv`) | `11,182` rows × `4` cols | `182baa44c536079bea07bb8700c37c85441c3d7d5f8e6dd68fb92fcb4a7815e8` |
| `data/Hillstrom-Campaign.csv` | Kevin Hillstrom Multi-Channel Promotional Experiment (`http://www.minethatdata.com/Kevin_Hillstrom_MineThatData_E-MailAnalytics_DataMiningChallenge_2008.03.20.csv`) | `64,000` records × `12` cols | `0e5893329d8b93cefecc571777672028290ab69865718020c78c7284f291aece` |

- **Backup Public Datasets:** Orange Telecom Customer Churn Dataset (OpenML ID 1111, `50,000` subscriber records, `https://www.openml.org/d/1111`) and UCI Online Retail Multi-Country Consumer Panel (`541,909` invoice rows across `38` countries, `https://archive.ics.uci.edu/dataset/352/online+retail`).

---

## 3. Mathematical & Financial Formulations

### 3.1 Subscriber Stock-Flow Conservation & Quarterly Revenue Bridge
$$\text{EndingSubs}_{m,t} = \text{BeginningSubs}_{m,t} + \text{GrossAdds}_{m,t}(\mathbf{x}_{m,t}^{\text{internal}}, \mathbf{z}_{m,t}^{\text{macro}}) - \text{ChurnedSubs}_{m,t}(\mathbf{x}_{m,t}^{\text{internal}}, \mathbf{z}_{m,t}^{\text{macro}})$$

$$\text{Revenue}_{m,t} = 3 \times \left(\frac{\text{BeginningSubs}_{m,t} + \text{EndingSubs}_{m,t}}{2}\right) \times \text{ARPU}_{m,t}$$

### 3.2 Wholesale Partnership Net Subscriber & Operating Income Optimization
For wholesale partner reach $R_d$, conversion rate $p_d$, wholesale discount $\delta_d$, retail subscriber cannibalization rate $c_d$, annual retention $(1 - \kappa_d)$, ad-tier monetization uplift $a_d$, and serving costs $(F_d, v_d)$:

$$\Delta \text{NetSubs}_d = R_d p_d (1 - \kappa_d) - R_d p_d c_d$$

$$\Delta \text{OI}_d = 12 \cdot R_d p_d (1 - \kappa_d) \left[\text{ARPU}_{\text{retail}}(1 - \delta_d) + a_d - v_d\right] - 12 \cdot (R_d p_d c_d)\text{ARPU}_{\text{retail}} - F_d$$

---

## 4. Verified Execution Benchmarks (`outputs/validation_summary.json`)

| Analytical Dimension | Verified Output |
| :--- | :---: |
| Combined SHA-256 Verified Public Records | `102,438` |
| International Markets / Region-Quarters Modeled | `12` Markets / `192` Quarters (`96` Out-of-Sample Holdout) |
| Walk-Forward Subscriber Forecast Holdout MAPE | `0.95%` (vs. `2.85%` seasonal naive — **`66.77%` error reduction**) |
| Annual Plan vs. Month-to-Month Churn Rate (`7,043` Accounts) | `11.27%` (`One year`) vs. `42.71%` (`Month-to-month`) |
| Dual-Streaming Bundle vs. Single-Tier Realized LTV | `$4,256.66` (`$93.24` ARPU) vs. `$2,519.92` (`$77.08` ARPU) |
| Optimal Q4 Fenced Ad-Hybrid Partnership Net Incremental Subs | `+306.08K` (`+306K`) vs. `+123.95K` Unfenced Promo |
| Retail Subscriber Cannibalization Rate Reduction | `41.0%` (Unfenced) $\rightarrow$ `11.0%` (Q4 Fenced Hybrid) (**`-30.0 pp`**) |
| Optimal Partnership Incremental Operating Income (`OI`) | `+$28.46M` (`+$32.54M` improvement over unfenced baseline `-$4.08M`) |
| SQL Reconciliation & Integrity Gates / Unit Tests | `6/6 (100%)` / `6/6 Passed` |

---

## 5. Repository Structure & Quick Start

```text
dtc-subscriber-growth-partnership-monetization/
├── .github/workflows/ci.yml
├── data/                                                  # 5 SHA-256 verified public CSV datasets (102,438 rows)
├── outputs/
│   ├── dtc_subscriber_growth_partnership_model.xlsx       # 3-tab dynamic Excel business model with live formulas
│   ├── executive_deck_variance_brief.json                 # Grounded 3-slide executive readout brief
│   ├── partnership_deal_cannibalization_scenarios.csv     # 6 wholesale partnership deal evaluations
│   ├── regional_subscriber_quarterly_forecast.csv         # 192 region-quarter subscriber & revenue forecasts
│   └── validation_summary.json                            # Full execution & SHA-256 provenance receipt
├── sql/
│   └── dtc_subscriber_growth_mart.sql                     # ANSI / BigQuery / Snowflake SQL Joins & CTEs mart
├── src/
│   ├── build_excel_model.py                               # Live-formula .xlsx workbook builder
│   └── pipeline.py                                        # Zero-dependency forecasting & deal optimization engine
└── tests/
    └── test_pipeline.py                                   # Automated unit & SQL conservation test suite
```

```bash
python3 src/pipeline.py
python3 -m unittest discover -s tests -v
```
