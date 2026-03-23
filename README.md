# Taiwanese Bankruptcy Prediction  
*Financial risk modeling using logistic regression, decision trees, random forests, and neural networks to identify early indicators of corporate bankruptcy.*

This project analyzes a Taiwanese corporate bankruptcy dataset containing **6,819 companies and 95 financial ratios** to determine which financial indicators most strongly predict bankruptcy and how machine learning models can classify firms into risk categories. The analysis integrates statistical modeling, ensemble methods, and deep learning to uncover early warning signals of financial distress.

---

## 📌 Project Overview
Bankruptcy prediction is a critical task in finance, risk management, and regulatory oversight. This project investigates:

- Which financial ratios are most strongly associated with bankruptcy  
- Whether financial features can classify firms into distinct risk groups  
- How interactions between financial variables influence bankruptcy likelihood  
- Whether early warning indicators can be identified before failure  

The dataset comes from the **UCI Machine Learning Repository**, originally sourced from the Taiwan Economic Journal.

> “This dataset… provides 95 features to study amongst the 6819 company entries between the years 1999–2009 to most accurately predict bankruptcy before occurrence.”

---

## 📊 Dataset
- **6,819 companies**  
- **95 financial ratios** (profitability, leverage, liquidity, efficiency, cash flow, growth metrics)  
- **Binary target:** bankrupt vs. non‑bankrupt  
- No timestamps, but rich financial indicators suitable for classification  

---

## 🧠 Research Questions & Hypotheses

### **1️⃣ Which financial ratios are most strongly associated with bankruptcy?**  
- **H₀:** No financial ratios are related to bankruptcy  
- **H₁:** At least one financial ratio is related  

### **2️⃣ Can financial features classify firms into distinct bankruptcy risk groups?**  
Evaluated through model performance (AUC, recall, accuracy).

### **3️⃣ Do interactions between financial ratios influence bankruptcy risk?**  
- **H₀:** No interactions matter  
- **H₁:** At least one interaction is significant  

### **4️⃣ Are there early warning indicators of bankruptcy?**  
- **H₀:** No indicators exist  
- **H₁:** At least one indicator signals risk prior to failure  

---

## 🔧 Methods & Tools
Models used:

- **Logistic Regression (stepwise)**  
- **Decision Trees (pruned, entropy-based)**  
- **Random Forests (Python, class‑weighted)**  
- **Artificial Neural Networks (Keras)**  

Tools:

- **SAS OnDemand** (PROC LOGISTIC, HPSPLIT, HPFOREST)  
- **Python (Google Colab)** for Random Forests + ANN  

> “SAS is a powerful analytics platform… enabling comparison across multiple modeling approaches.”

---

## 🧹 Data Preparation
- Missing values imputed in SAS  
- Outlier review showed **Var23** was binary, not erroneous  
- Multicollinearity and imbalance considered  
- Ethical considerations documented (privacy, bias, transparency)

---

## 📈 Logistic Regression — Key Findings
A **stepwise logistic regression** selected **17 significant predictors** out of 95.

> “The model iteratively added statistically significant predictors, ultimately reducing −2 Log L from 1943.71 to 1159.53.”

### **Top Predictors (all p < .05):**
- **Liability to Equity (Var87)** — leverage risk  
- **Long‑term Fund Suitability Ratio (Var38)** — capital stability  
- **Revenue Per Share (Var20)** — sales strength  
- **Fixed Assets Turnover (Var46)** — operational efficiency  
- **Current Assets / Total Assets (Var58)** — liquidity  
- **ROE (Var86)** — shareholder return  
- **Cash Flow to Total Assets (Var75)** — cash health  

### **Performance**
- **AUC = 0.9421**  
- Excellent discriminatory power  
- Strong early‑warning capability  

> “The ROC curve… exhibited a notably high AUC of 0.9421, indicating excellent classification ability.”

---

## 🌳 Decision Tree — Key Findings
Pruned tree using entropy splits.

### **Top Predictors**
- **Borrowing Dependency (Var41)**  
- **Operating Gross Margin (Var4)**  
- **Current Assets / Total Assets (Var58)**  
- **Operating Profit Growth Rate (Var24)**  
- **Inventory Turnover Rate (Var45)**  

### **Performance**
- **AUC = 0.7685**  
- **Accuracy ≈ 97%**  
- **Sensitivity = 15.63%** (low recall for bankruptcies)  

> “The tree delivered an interpretable, rule‑based structure… but sensitivity remained low.”

---

## 🌲 Random Forest — Key Findings
Implemented in Python due to SAS limitations.

### **Performance**
- **Accuracy = 96%**  
- **Recall = 15%** (50% improvement over decision tree)  
- **AUC = 0.9404**  

Consistently identified:

- Operating Gross Margin  
- Borrowing Dependency  
- ROE  

> “The Random Forest improved slightly on recall without sacrificing accuracy.”

---

## 🧠 Artificial Neural Network (ANN)
Built in Python (Keras).

### **Performance**
- **Recall = 31%** (highest of all models)  
- **AUC = 0.8169**  
- **Accuracy = 95%**  

> “The ANN demonstrated the highest recall… revealing its strength in capturing nonlinear patterns.”

---

## 🏆 Model Comparison

| Model | AUC | Recall | Accuracy | Notes |
|-------|------|---------|-----------|--------|
| **Logistic Regression** | **0.9421** | ~26% | Very High | Best overall, interpretable |
| **Decision Tree** | 0.7685 | 10.6% | High | Most interpretable |
| **Random Forest** | 0.9404 | 15% | 96% | Balanced, robust |
| **ANN** | 0.8169 | **31%** | 95% | Best recall |

> “These results highlight a trade‑off between transparency and predictive depth.”

---

## 📚 Key Insights
- Leverage, liquidity, profitability, and cash flow ratios are the strongest bankruptcy predictors  
- Logistic regression provides the best overall performance  
- ANN captures nonlinear patterns and detects more bankruptcies  
- Decision trees reveal interpretable financial thresholds  
- Random forests balance accuracy and robustness  

---

## ⚠️ Limitations
- Class imbalance reduces sensitivity  
- ANN interpretability is limited  
- Multicollinearity may affect coefficient interpretation  
- Ethical concerns: bias, transparency, responsible use  

---

## 📁 Project Files
- `final paper.docx` — full bankruptcy prediction analysis report  
- `Predicting Corporate Bankruptcy.pptm` — presentation summarizing methods, findings, and business insights  
- `TaiwanseBankruptcyPrediction.sas` — SAS code for logistic regression and decision tree models  
- `TaiwanBankruptcyForestANN.py` — Python code for Random Forest and ANN models  
- `taiwaneseData.csv` — Taiwanese corporate bankruptcy dataset (UCI source)  

---

## 📚 What I Learned
- How to apply multiple ML techniques to financial risk modeling  
- How to interpret financial ratios in bankruptcy prediction  
- How to compare models using AUC, recall, and accuracy  
- How to balance interpretability vs. predictive power  
- How to document ethical considerations in analytics  

