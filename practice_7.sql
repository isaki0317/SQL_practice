--メモ
---SQL文でもネスト構造の命令を出すことができる、SQL文内部でSELECTを使う場合は()で囲って記述する
---ネスト構成の子要素(SELECT)を、副問い合わせ・副照会・サブクエリと呼ぶ(サブクエリを複数記述することや、サブクエリの中にサブクエリを書くことも可能)
---サブクエリを持つSQL文では、サブクエリ(子要素)から順番に処理されていく→サブクエリの処理結果を元に親のSQL文が実行される

---INSERT文内で、SELECT文を使用する場合は、()を使わない、またこの場合は、副問い合わせとは呼ばない(INSERT文の特殊構文)

---副問い合わせの内部から主問い合わせの表や列を利用する副問い合わせを、相関副問い合わせと呼ぶ
---EXISTS演算子と共に使われることが多いが、繰り返し副問い合わせを実行する処理になるので、Dbへの負荷は大幅に増加する

--7章演習問題

--.3-1
INSERT INTO 頭数集計
SELECT 飼育県, COUNT(個体識別番号)
FROM 個体識別
GROUP BY 飼育県

--.3-2
SELECT 飼育県 AS 都道府県名, 個体識別番号,
CASE 雌雄コード WHEN '1' THEN '雄'
                WHEN '2' THEN '雌' END AS 雌雄
FROM 個体識別
WHERE 飼育県 IN (SELECT 飼育県 FROM 頭数集計
                ORDER BY 頭数 DESC
                OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY)

--.3-3
SELECT 個体識別番号, 出生日, 母牛番号,
CASE 品種コード WHEN '01' THEN '乳用種'
                WHEN '02' THEN '肉用種'
                WHEN '03' THEN '交雑種' END AS 品種
FROM 個体識別
--WHERE 品種コード = '01' ?
WHERE 母牛番号 IN (SELECT 個体識別番号 FROM 個体識別
WHERE 品種コード = '01')
