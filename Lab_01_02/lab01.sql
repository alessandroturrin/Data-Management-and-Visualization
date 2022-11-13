--1
SELECT SUM(Price), DateYear, PhoneRateType
FROM FACTS F, TIMEDIM T, PHONERATE P
WHERE F.ID_time=T.ID_time and F.ID_phoneRate=P.ID_phoneRate
GROUP BY cube(phoneRateType, dateYear)

--2
SELECT SUM(NumberOfCalls) as TotalCalls, SUM(Price) as TotalIncome, DateMonth, RANK() OVER (ORDER BY SUM(Price) DESC) as RankIncome
FROM TIMEDIM T, FACTS F
WHERE T.ID_time=F.ID_time
GROUP BY DateMonth

--3
SELECT DateMonth, SUM(NumberOfCalls) as TotalCalls, RANK() over (ORDER BY SUM(NumberOfCalls) DESC) as RankCalls
FROM FACTS F, TIMEdim T
WHERE F.id_time=T.id_time and dateYear=2003
GROUP BY dateMonth

--4
SELECT DateMonth, SUM(Price) as TotalIncome, AVG(SUM(Price)) OVER (ORDER BY DateMonth
                                                                    ROWS 2 PRECEDING) AS AvgLast3Days
FROM FACTS F, TIMEdim T
WHERE F.id_time=T.id_time and DateMonth='7-2003' and DateYear=2003
GROUP BY DateMonth

--5
SELECT DateYear, DateMonth, SUM(Price) as MonthlyIncome, SUM(SUM(Price)) OVER (PARTITION BY DateYear
                                                                            ORDER BY DateMonth
                                                                            ROWS UNBOUNDED PRECEDING) as CumTotal
FROM FACTS F, TIMEdim T
WHERE F.id_time=T.id_time
GROUP BY DateMonth, DateYear

