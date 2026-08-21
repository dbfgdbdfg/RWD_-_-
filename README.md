# 🧬 2026 KNAPS 하계 직능계발대회
## 📊 RWD-Based Medical 전략수립대회 (with 한국 노바티스)

**13팀 (Team 13)**  
**본선 진출 (Finalist)**

---

# 📖 프로젝트 소개

**Leqvio (Inclisiran)**는 ASCVD 환자의 LDL-C 감소를 위한 **siRNA 기반 치료제**입니다.

본 프로젝트에서는 **실제 임상 데이터(Real-World Data, RWD)**를 활용하여

- 국내 잠재 환자 규모를 추정하고,
-  다양한 치료 시나리오를 시뮬레이션하며,
-  시판 후 안전성을 평가함으로써,

**Leqvio의 국내 활용 전략을 제시**하고자 하였습니다.

---

# 🎯 프로젝트 개요

프로젝트는 세 가지 분석으로 구성되어 있습니다.

| 📂 분석 | 📌 내용 |
|---------|---------|
| **KNHANES 분석** | 국민건강영양조사(KNHANES)를 이용하여 국내 Leqvio 잠재 대상 환자를 추정 |
| **환자 시뮬레이션** | 다양한 치료 시나리오를 가정하여 Leqvio 도입 효과를 시뮬레이션 |
| **이상사례 분석** | FDA FAERS 데이터를 이용하여 Leqvio의 시판 후 안전성 평가 |

---

# 📁 Repository Structure

```text
.
├── FAERS_data_load.py        # FAERS 데이터 불러오기 및 전처리
├── FAERS_ROR_PRR.py          # ROR, PRR을 이용한 Signal 분석
│
├── KNHANES_data_load.py      # KNHANES 데이터 불러오기 및 전처리
│
├── for_simulation.py         # 시뮬레이션 입력 데이터 생성
├── Simulation.R              # R 기반 환자 시뮬레이션
│
└── README.md
```

---

# 🔍 분석 내용

## ① 👥 KNHANES 분석

###  목적

국민건강영양조사(KNHANES)를 이용하여 국내 **Leqvio 잠재 치료 대상자**를 추정하였습니다.

###  사용 데이터

- 국민건강영양조사(KNHANES)

###  수행 내용

- 대상 환자 선별
- 잠재 환자 규모 추정
- 연령 및 성별 분석
- 심혈관 위험인자 분석
- Lipid Profile 분석

---

## ② 🧪 환자 시뮬레이션

###  목적

Leqvio 도입 이후의 다양한 치료 시나리오를 예측하였습니다.

###  수행 과정

- Python 기반 입력 데이터 생성
- R 기반 시뮬레이션 수행
- 시나리오 비교
- 치료 대상 환자 규모 변화 예측

---

## ③ 🩺 이상사례 분석

###  목적

FAERS 데이터를 이용하여 Leqvio의 시판 후 안전성을 평가하였습니다.

###  사용 데이터

- FDA Adverse Event Reporting System (FAERS)

###  수행 과정

- FAERS 데이터 전처리
- ROR 계산
- PRR 계산
- Signal Detection

### 사용 지표

- Reporting Odds Ratio (ROR)
- Proportional Reporting Ratio (PRR)

---

# 🛠️ 사용 기술

- Python
- R
- pandas
- NumPy
- SciPy
- Jupyter Notebook

---

# 🏆 대회 정보


| 항목 | 내용 |
|------|------|
| 대회 | 2026 KNAPS 하계 직능계발대회 |
| 분야 | RWD-Based Medical 전략수립대회 |
| 협력 | 한국 노바티스 |
| 팀 | Team 13 |
| 성과 | **본선 진출**  |


---

# 📌 안내

본 저장소는 **2026 KNAPS 하계 직능계발대회**에서 수행한 분석 코드를 정리한 것으로, 연구 및 학습 목적으로 공개되었습니다.
