-- メモ
--- DISTINCT(ディスティンクト)：重複業を除外(SELECTの直後に記述)
--- ORDER BY：検索結果の順序並び替え
--- OFFSET-FETCH：検索結果から件数を限定して取得
----- 集合演算子 ------
--- UNION：検索結果に他の検索結果を足し合わせる
--- EXCEPT：検索結果から他の検索結果を差し引く
--- INTERSECT：検索結果と他の検索結果で重複する部分を取得する

-- 4章演習問題

--.1-1
SELECT * FROM 注文履歴
ORDER BY 注文番号, 注文枝番

--.1-2
SELECT DISTINCT 商品名 FROM 注文履歴
WHERE 日付 >= '2018-01-01' AND 日付 <= '2020-01-31'
ORDER BY 商品名

--.1-3
SELECT 注文番号, 注文枝番, 注文金額 FROM 注文履歴
WHERE 分類 = '1'
ORDER BY 注文金額
OFFSET 1 ROWS FETCH NEXT 3 NEXT ONLY

--.1-4
SELECT 日付, 商品名, 単価, 数量, 注文金額 FROM 注文履歴
WHERE 分類 = '3', 数量 >= 2
ORDER BY 日付, 数量 DESC

--.1-5
SELECT DISTINCT 分類, 商品名, サイズ, 単価 FROM 注文履歴
WHERE 分類 = '1'
UNION
SELECT DISTINCT 分類, 商品名, 単価 FROM 注文履歴
WHERE 分類 = '2'
UNION
SELECT DISTINCT 分類, 商品名, 単価 FROM 注文履歴
WHERE 分類 = '3'
ORDER BY 分類, 商品名

--.2-1
SELECT * FROM 奇数
UNION 
SELECT * FROM 偶数

--.2-2
SELECT * FROM 整数
EXCEPT
SELECT * FROM 偶数

--.2-3
SELECT * FROM 整数
INTERSECT
SELECT * FROM 偶数

--.2-4
SELECT * FROM 偶数
INTERSECT
SELECT * FROM 奇数
