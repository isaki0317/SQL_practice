--メモ
---GROUP BY句では、元の表に対するWHERE(絞り込み条件)は指定できるが、集計結果(SUM等)に対するWHEREはerrorになる
---集計結果に対する絞り込み条件は HAVING句を使用する(集計結果が揃ってから実行される)

--6章演習問題

--.1-1
SELECT SUM(降水量) AS 年間降水量,
       AVG(最高気温) AS 平均最高気温,
       AVG(最低気温) AS 平均最低気温
FROM 都市別気象観測

--.1-2
SELECT SUM(降水量) AS 年間降水量,
       AVG(最高気温) AS 平均最高気温,
       AVG(最低気温) AS 平均最低気温
FROM 都市別気象観測
WHERE 都市名 = '東京'

--.1-3
SELECT 都市名, AVG(降水量) AS 平均降水量
       MIN(最高気温) AS 最も低かった最高気温
       MAX(最低気温) AS 最も高かった最低気温
FROM 都市別気象観測
GROUP BY 都市名

--.1-4
SELECT 月, AVG(降水量) AS 平均降水量,
       AVG(最高気温) AS 平均最高気温,
       AVG(最低気温) AS 平均最低気温
FROM 都市別気象観測
GROUP BY 月

--.1-5
SELECT 都市名, MAX(最高気温)
FROM 都市別気象観測
GROUP BY 都市名
HAVING MAX(最高気温) >= 38

--.1-6
SELECT 都市名, MIN(最低気温)
FROM 都市別気象観測
GROUP BY 都市名
HAVING MIN(最低気温) <= -10