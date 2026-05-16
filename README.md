# Global Macro Factors & Copper Price Prediction (XGBoost + SHAP)

本项目是一个完整的量化投研端到端（End-to-End）示例，展示了如何结合 **SQL 数据工程** 与 **机器学习非线性建模**，来预测 LME 铜价走势并进行宏观因子归因分析。

## 🚀 项目核心亮点 (Project Highlights)
- **异构数据对齐**：针对多市场（大宗商品、外汇、美股、东南亚市场）交易时间不一致导致的空值问题，在 MySQL 中编写 ETL 脚本，通过 `INNER JOIN` 机制实现金融时间序列的精准对准。
- **机器学习非线性建模**：放弃传统的线性回归，采用 **XGBoost Regressor** 捕捉金融市场在高波动、极端宏观环境下的非对称反应。
- **白盒化归因分析 (SHAP)**：引入 **SHAP (SHapley Additive exPlanations)** 游戏理论框架，拆解机器学习“黑箱”，量化各宏观因子对价格波动的边际贡献度。

## 📂 目录结构 (Repository Structure)
- `data_integration.sql`: 数据库建表、数据清洗、统一时序对齐的 SQL 脚本。
- `final_financial_data.csv`: 经 SQL 整合导出后的黄金数据集。
- `Copper_Price_Analysis.ipynb`: 包含相关性热力图、XGBoost 训练及 SHAP 归因的可视化 Python 笔记本。

## 📊 核心投研结论 (Key Insights)
1. **S&P 500 强驱动**：模型 SHAP 摘要图表明，标普 500 指数（风险资产风向标）是预测铜价最依赖的宏观先行指标，呈现极强的正向拉动效应。
2. **DXY 压制效应**：美元指数（DXY）与铜价呈现显著的非线性负相关（相关系数 -0.67），一旦美元指数脉冲式走高，模型对铜价的预测贡献度立刻转负，完美验证了大宗商品以美元计价的宏观常识。
