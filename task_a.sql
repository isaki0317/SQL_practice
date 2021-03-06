--練習ドリル-A

--LEVEL1

--1
SELECT 口座番号, 名義, 種別, 残高, 更新日 FROM 口座
--2
SELECT 口座番号 FROM 口座
--3
SELECT 口座番号, 残高 FROM 口座
--4
SELECT * FROM 口座
--5
UPDATE 口座
SET 名義 = 'XXXXX'
--6
UPDATE 口座
SET 残高 = 9999999, 更新日 = '2018-03-01'
--7
INSERT INTO (口座番号, 名義, 種別, 残高, 更新日)
VALUES ('0642191', 'アオキ　ハルカ', '1', 3640551, '2018-03-13')
--8
DELETE FROM 口座

--LEVEL2

--9
SELECT * FROM 口座 WHERE 口座番号 = '0037651'
--10
SELECT * FROM 口座 WHERE 残高 > 0
--11
SELECT * FROM 口座 WHERE 口座番号 < '1000000'
--12
SELECT * FROM 口座 WHERE 更新日 < '2018-01-01'
--13
SELECT * FROM 口座 WHERE 残高 >= 1000000
--14
SELECT * FROM 口座 WHERE 種別 <> '1'
--15
SELECT * FROM 口座 WHERE 更新日 IS NULL
--16
SELECT * FROM 口座 WHERE 名義 LIKE '%ハシ%'
--17
SELECT * FROM 口座 WHERE 更新日 BETWEEN '2018-01-01' AND '2020-01-31'
--18
SELECT * FROM 口座 WHERE 種別 IN ('3', '2')
--19
SELECT * FROM 口座 WHERE 名義 IN (
'サカタ　リョウヘイ', 'マツモト　ミワコ', 'ハマダ　サトシ')
--20
SELECT * FROM 口座 WHERE 更新日 BETWEEN '2017-12-30' AND '2018-01-04'
--21
SELECT * FROM 口座 WHERE 残高 < 10000 AND 更新日 IS NOT NULL
--22
SELECT * FROM 口座 WHERE 口座番号 LIKE '2____' OR 名義 LIKE 'エ__%コ'
--23
口座番号、取引番号、取引事由ID

--LEVEL3

--24
SELECT * FROM 口座 ORDER BY 口座番号
--25
SELECT DISTINCT 名義 FROM 口座 ORDER BY 名義
--26
SELECT * FROM 口座 ORDER BY 4 DESC, 1
--27
SELECT 更新日 FROM 口座 WHERE 更新日 IS NOT NULL
ORDER BY 更新日 OFFSET 0 ROWS FETCH NEXT 10 NEXT ONLY
--28
SELECT 更新日, 残高 FROM 口座
WHERE 残高 <> 0 AND 更新日 IS NOT NULL
ORDER BY 残高, 更新日 DESC OFFSET 10 ROWS FETCH NEXT 10 NEXT ONLY
--29
SELECT 口座番号 FROM 口座 UNION SELECT 口座番号 FROM 廃止口座 ORDER BY 口座
--30
SELECT 名義 FROM 口座 EXCEPT SELECT 名義 FROM 廃止口座 ORDER BY 口座番号 DESC
--31
SELECT 名義 FROM 口座 INTERSECT SELECT 名義 FROM 廃止口座 ORDER BY 名義
--32
SELECT 口座番号, 残高 FROM 口座 WHERE 残高 = 0 UNION
SELECT 口座番号, 残高 FROM 廃止口座 WHERE 残高 <> 0 ORDER BY 口座番号
--33
SELECT 口座番号, 名義, '〇' AS 口座区分 FROM 口座 UNION
SELECT 口座番号, 名義, '×' AS 口座区分 FROM 廃止口座 ORDER BY 名義

--LEVEL4

--34
SELECT 口座番号, 残高 / 1000 AS 千円単位の残高 FROM 口座 WHERE 残高 >= 1000000
--35
INSERT INTO 口座 (口座番号, 名義, 種別, 残高, 更新日)
VALUES('06565', 'タカギ　ノブオ', '1', 10000 + 3000, '2018-04-01')
--36
UPDATE 口座 SET 残高 = (残高 - 3000) * 1.003
WHERE 口座番号 IN ('06565', '1026413')
--37
SELECT 口座番号, 更新日, 更新日 + 180 AS 通帳期限日
FROM 口座 WHERE 更新日 < '2017-01-01'
--38
SELECT 口座番号, 'カ)' || 名義 AS 名義 FROM 口座 WHERE 種別 = '3'
--39
SELECT DISTINCT 種別 AS 種別コード CASE 種別 WHEN '1' THEN '普通'
WHEN '2' THEN '当座' WHEN '3' THEN '別段' END AS 種別名 FROM 口座
--40
SELECT 口座番号, 名義 CASE 残高 WHEN 残高 < 100000 THEN 'C'
WHEN 残高 >= 100000 AND 残高 < 1000000 THEN 'B'
ELSE 'A' END AS 残高ランク FROM 口座
--41
SELECT LENGTH(口座番号), LENGTH(REPLACE(名義, '　', '')),
LENGTH(CAST(残高 AS VARCHER)) FROM 口座
--42
SELECT * FROM 口座 WHERE SUBSTRING(名義, 1, 5) LIKE '%カワ%'
--43
--44
SELECT 口座番号, 残高, TRUNC(残高 * 0.0002, 0) AS 利息 FROM 口座 ORDER BY 残高 DESC
--45
SELECT 口座番号, 残高, CASE 残高 WHEN 残高 < 500000 THEN TRUNC(残高 * 0.0001, 0)
WHEN 残高 >= 500000 AND 残高 < 2000000 THEN TRUNC(残高 * 0.0002, 0)
ELSE TRUNC(残高 * 0.0003, 0) END AS 残高別利息 FROM 口座
ORDER BY 残高別利息 DESC, 口座番号
--46
INSERT INTO 口座 (口座番号, 名義, 種別, 残高, 更新日)
VALUES('0351262', 'イトウ　ダイ', '2', 635110, CURRENT_DATE)
--47
SELECT 口座番号, 名義, 種別, 残高, SUBSTRING(CAST(更新日 AS VARCHER), 1, 4) ||
'年' || SUBSTRING(CAST(更新日 AS VARCHER), 6, 2) || '月' ||
SUBSTRING(CAST(更新日 AS VARCHER), 9, 2) || '日' AS 更新日
FROM 口座 WHERE 更新日 >= '2018-01-01'
--48
SELECT COALESCE(CAST(更新日 AS VARCHER), '設定なし') AS 更新日 FROM 口座

--LEVEL5

--49
SELECT SUM(残高) AS 合計, MAX(残高) AS 最高, MIN(残高) AS 最小, 
AVG(残高) AS 平均, COUNT(*) AS 件数 FROM 口座
--50
SELECT COUNT(*) AS 件数 FROM 口座 
WHERE 種別 <> '1' AND 残高 >= 1000000 AND 更新日 < '2018-01-01'
--51
SELECT COUNT(*) - COUNT(更新日) AS 件数 FROM 口座
--52
SELECT MAX(名義) AS 最大値, MIN(名義) AS 最小値 FROM 口座
--53
SELECT MAX(更新日) AS 最大, MIN(更新日) AS 最小 FROM 口座
--54
SELECT 種別, SUM(残高) AS 合計, MAX(残高) AS 最高, MIN(残高) AS 最小, 
AVG(残高) AS 平均, COUNT(*) AS 件数 FROM 口座 GROUP BY 種別
--55
SELECT SUBSTRING(口座番号, 7, 1) AS グループ, COUNT(*) AS 件数 FROM 口座
GROUP BY SUBSTRING(口座番号, 7, 1) ORDER BY 件数 DESC
--56
SELECT SUBSTRING(COALESCE(CAST(更新日 AS VARCHER),'XXXX'), 1, 4) AS 更新年
SUM(残高) AS 合計, MAX(残高) AS 最高, MIN(残高) AS 最小, 
AVG(残高) AS 平均, COUNT(*) AS 件数 FROM 口座
GROUP BY SUBSTRING(COALESCE(CAST(更新日 AS VARCHER),'XXXX'), 1, 4)
--57
SELECT 種別, SUM(残高) AS 合計, COUNT(*) AS 件数 FROM　口座
GROUP BY 種別 HAVING SUM(残高) > 3000000
--58

--LEXEL6

--59
UPDATE 口座 SET 残高 = 残高 + (SELECT COALESCE(SUM(入金額) - SUM(出金額), 0)
FROM 取引 WHERE 口座番号 = '0351333' AND 日付 = '2018-01-11'),
更新日 = '2018-01-11' WHERE 口座番号 = '0351333'
--60
SELECT 残高, (SELECT SUM(入金額) FROM 取引 WHERE 口座番号 = '1115600' AND 
日付 = '2017-12-28') AS 入金額合計, (SELECT SUM(出金額) FROM 取引 WHERE 口座番号
= '1115600' AND 日付 = '2017-12-28') AS 出金額合計 FROM 口座 
WHERE 口座番号 = '1115600'
--61
SELECT 口座番号, 名義, 残高 FROM 口座 WHERE 口座番号 IN (SELECT 口座番号 FROM 取引 
WHERE 入金額 >= 1000000)
--62
SELECT * FROM 口座 WHERE 更新日 > ALL(SELECT 日付 FROM 取引)
--63
SELECT A, 日付, (SELECT MAX(入金額) FROM 取引 WHERE 口座番号 = '3104451')
AS 最大入金額, (SELECT MAX(出金額) FROM 取引 WHERE 口座番号 = '3104451')
AS 最大出金額 FROM (SELECT 日付 FROM 取引 WHERE 口座番号 = '3104451'
GROUP BY 日付 HAVING SUM(入金額) > 0 AND SUM(出金額) > 0) AS A
--64
INSERT INTO 廃止口座 SELECT * FROM 口座 WHERE 口座番号 = '2761055'
DELETE FROM 口座 WHERE 口座番号 = '2761055'
