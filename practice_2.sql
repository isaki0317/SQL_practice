--2章演習問題

--.3-1
SELECt コード, 地域, 塗布道府県名, 県庁所在地, 面積
FROM 都道府県

--.3-2
SELECT * FROM 都道府県

--.3-3
SELECT 地域 AS area, 都道府県名 AS pref
FROM 都道府県

--.4-1
INSERT INTO 都道府県
VALUES (26, '近畿', '京都', NULL, 4613)

--.4-2
INSERT INTO 都道府県
VALUES (37, '四国', '香川', '高松', 1876)

--.4-3
INSERT INTO 都道府県 (コード, 都道府県名, 県庁所在地)
VALUES (40, '福岡', '福岡')

--.5-1
UPDATE 都道府県
SET 県庁所在地 = '京都' WHERE コード = '26'

--.5-2
UPDATE 都道府県
SET 地域 = '九州', 面積 = 4976
WHERE コード = '40'

--.6
DELETE FORM 都道府県
WHERE コード = '26'
