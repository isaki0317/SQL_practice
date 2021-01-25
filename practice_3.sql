--メモ
--- '='は単体の条件指定しかできないが、'IN(NOT IN)'は複数条件の指定ができる
SELECT * FROM 家計簿
WHERE 費目 IN ('食費', '交際費')
---WHERE 品目 = '食費'
---WHERE 品目 = '交際費'

---------RDBMSの種類によっては、副問合せでのみ使用可能---------
--- 'ANY'演算子 => 値リストのそれぞれと比較して、いずれかがtrueなら真
--- 式(カラム名) 基本比較演算子(=, <, >...) ANY (値1, 値2, 値3...)

--- 'ALL'演算子 => 値リストのそれぞれと比較して、全てがtrueなら真
--- 式(カラム名) 基本比較演算子(=, <, >...) ALL (値1, 値2, 値3...)

-- 3章演習問題

--.1-1
SELECT * FROM 気象観測
WHERE 月 = 6

--.1-2
SELECT * FROM 気象観測
WHERE NOT 月 <> 6
--<> 6以外の...

--.1-3
SELECT * FROM 気象観測
WHERE 降水量 < 100

--.1-4
SELECT * FROM 気象観測
WHERE 降水量 > 200

--.1-5
SELECT * FROM 気象観測
WHERE 最高気温 >= 30

--.1-6
SELECT * FROM 気象観測
WHERE 最高気温 <= 0

--.1-7
SELECT * FROM 気象観測
WHERE 月 IN (3, 5, 7)

WHERE 月 = 3 OR 月 = 5 OR 月 = 7

--.1-8
SELECT * FROM 気象観測
WHERE 月 NOT IN (3, 5, 7)

WHERE 月 <> 3 OR 月 <> 5 OR 月 <> 7

--.1-9
SELECT * FROM 気象観測
WHERE 降水量 <= 100 AND 湿度 < 50

--.1-10
SELECT * FROM 気象観測
WHERE 最低気温 < 5 OR 最高気温 > 35

--.1-11
SELECT * FROM 気象観測
WHERE 湿度 BETWEEN 60 AND 79

WHERE 湿度 >= 60 AND 湿度 >= 79

--.1-12
SELECT * FROM 気象観測
WHERE 降水量 IS NULL OR 最高気温 IS NOT NULL OR
      最低気温 IS NOT NULL OR 湿度 IS NOT NULL


--.2-1
SELECT * FROM 都道府県
WHERE 都道府県名 LIKE '%川'

--.2-2
SELECT * FROM 都道府県
WHERE 都道府県名 LIKE '%島%'

--.2-3
SELECT * FROM 都道府県
WHERE 都道府県名 LIKE '愛%'

--.2-4
SELECT * FROM 都道府県
WHERE 都道府県名 = 県庁所在地

--.2-5
SELECT * FROM 都道府県
WHERE 都道府県名 <> 県庁所在地


--.3-1
SELECT * FROM 成績表

--.3-2
INSERT INTO 成績表
VALUES ('S001', '織田　信長', 77, 55, 80, 75, 93, NULL)
INSERT INTO 成績表
VALUES ('A002', '豊臣　秀吉', 64, 69, 70, 0, 59, NULL)

--.3-3
UPDATE 成績表
SET 法学 = 85, 哲学 = 67
WHERE 学籍番号 = S001

--.3-4
UPDATE 成績表
SET 外国語 = 81
WHERE 学籍番号 IN ('A002', 'E003')

--.3-5_1
UPDATE 成績表
SET 総合成績 = 'A'
WHERE 法学 >= 80 AND 経済学 >= 80 AND 哲学 >= 80 AND 情報理論 >= 80 AND 外国語 >= 80

--.3-5_2
UPDATE 成績表
SET 総合成績 = 'B'
WHERE (法学 >= 80 OR 外国語 >= 80) AND (経済学 >= 80 OR 哲学 >= 80)

--.3-5_3
UPDATE 成績表
SET 総合成績 = 'D'
WHERE 法学 < 50 AND 経済学 < 50 AND 哲学 < 50 AND 情報理論 < 50 AND 外国語 < 50

--.3-5_4
UPDATE 成績表
SET 'C'
WHERE 総合成績 = IS NULL