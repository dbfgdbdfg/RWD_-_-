# 2026 KNAPS Summer Professional Development Competition
## RWD-Based Medical Strategy Competition (with Novartis Korea)

This repository contains the analysis code developed by **Team 13** for the **2026 KNAPS Summer Professional Development Competition – RWD-Based Medical Strategy Competition**, hosted in collaboration with **Novartis Korea**.

Our project focused on developing a **real-world data (RWD)-based medical strategy for Leqvio (Inclisiran)** by integrating multiple analytical approaches, including population estimation, patient simulation, and pharmacovigilance analysis.

🏅 **Finalist (Advanced to the Final Round)**

---

## Project Overview

The project consists of three independent analyses.

| Analysis | Description |
|----------|-------------|
| KNHANES Analysis | Estimate the potential target population eligible for Leqvio using the Korea National Health and Nutrition Examination Survey (KNHANES). |
| Patient Simulation | Simulate patient eligibility and treatment scenarios using R. |
| Pharmacovigilance | Evaluate the post-marketing safety profile of Leqvio using the FDA Adverse Event Reporting System (FAERS). |

---

# Repository Structure

```
.
├── FAERS_data_load.py        # Load and preprocess FAERS data
├── FAERS_ROR_PRR.py          # Pharmacovigilance signal detection (ROR / PRR)
│
├── KNHANES_data_load.py      # Load and preprocess KNHANES data
│
├── for_simulation.py         # Generate simulation input data
├── Simulation.R              # Patient simulation using R
│
└── README.md
```

---

# Analysis Details

## 1. KNHANES Analysis

### Objective

Estimate the number and characteristics of patients who may be eligible for Leqvio in Korea.

### Data Source

- Korea National Health and Nutrition Examination Survey (KNHANES)

### Main Analysis

- Patient selection based on clinical criteria
- Identification of potential Leqvio candidates
- Demographic characteristics
- Cardiovascular risk factor analysis
- Lipid profile analysis

---

## 2. Patient Simulation

### Objective

Simulate real-world treatment scenarios after the introduction of Leqvio.

### Workflow

- Generate simulation-ready datasets (`for_simulation.py`)
- Perform patient simulation (`Simulation.R`)
- Compare different treatment scenarios
- Estimate changes in the eligible patient population

---

## 3. Pharmacovigilance Analysis

### Objective

Evaluate the post-marketing safety profile of Leqvio.

### Data Source

- FDA Adverse Event Reporting System (FAERS)

### Workflow

- Load and preprocess FAERS data (`FAERS_data_load.py`)
- Perform disproportionality analysis (`FAERS_ROR_PRR.py`)
- Detect potential safety signals

### Signal Detection Metrics

- Reporting Odds Ratio (ROR)
- Proportional Reporting Ratio (PRR)

---

# Technologies

- Python
- R
- pandas
- NumPy
- SciPy
- Jupyter Notebook

---

# Competition Information

**Competition**

2026 KNAPS Summer Professional Development Competition

**Track**

RWD-Based Medical Strategy Competition

**Industry Partner**

Novartis Korea

**Team**

Team 13

**Achievement**

🏅 Advanced to the Final Round

---

# Disclaimer

This repository contains the analysis code developed for the competition and is provided for research and educational purposes only.
