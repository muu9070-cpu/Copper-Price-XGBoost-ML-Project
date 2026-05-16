CREATE DATABASE IF NOT EXISTS financial_market_analysis;
USE financial_market_analysis;

CREATE TABLE copper_data (
    Date_Str VARCHAR(20),  
    Price DECIMAL(18, 4),
    Open DECIMAL(18, 4),
    High DECIMAL(18, 4),
    Low DECIMAL(18, 4),
    Vol VARCHAR(20),
    Change_Pct VARCHAR(10)
);

CREATE TABLE dxy_data (
    Date_Str VARCHAR(30),
    Price DECIMAL(18, 4),
    Open DECIMAL(18, 4),
    High DECIMAL(18, 4),
    Low DECIMAL(18, 4),
    Vol VARCHAR(20),
    Change_Pct VARCHAR(20)
);

CREATE TABLE klci_data (
    Date_Str VARCHAR(30),
    Price VARCHAR(20), 
    Open VARCHAR(20),
    High VARCHAR(20),
    Low VARCHAR(20),
    Vol VARCHAR(20),
    Change_Pct VARCHAR(20)
);


CREATE TABLE sp500_data (
    Date_Str VARCHAR(30),
    Price VARCHAR(20),
    Open VARCHAR(20),
    High VARCHAR(20),
    Low VARCHAR(20),
    Vol VARCHAR(20),
    Change_Pct VARCHAR(20)
);

SELECT 
    STR_TO_DATE(c.Date_Str, '%m/%d/%Y') AS Trade_Date,
    -- 铜价（目标变量 Y）
    c.Price AS Copper_Price,
    -- 美元指数（特征 X1）
    d.Price AS DXY_Index,
    -- 马来西亚指数（特征 X2，处理可能存在的逗号）
    CAST(REPLACE(k.Price, ',', '') AS DECIMAL(18,2)) AS KLCI_Index,
    -- 标普 500（特征 X3，处理可能存在的逗号）
    CAST(REPLACE(s.Price, ',', '') AS DECIMAL(18,2)) AS SP500_Index
FROM copper_data c
INNER JOIN dxy_data d ON c.Date_Str = d.Date_Str
INNER JOIN klci_data k ON c.Date_Str = k.Date_Str
INNER JOIN sp500_data s ON c.Date_Str = s.Date_Str
ORDER BY Trade_Date ASC;