-- 一章演習問題

--.1
SELECT * FROM 家計簿 WHERE 入金額 = 50000
--Answer
---正解
--ポイント
---出力したい対象が該当するレコードなのか、値単体なのかでSELECTの発行をする

--.2
DELETE FROM 家計簿 WHERE 出金額 < 4000
--Answer
---正解

--.3
UPDATE 家計簿 SET メモ = 'カフェラテを購入' WHERE 日付 = '2018-02-18'
--Answer
---正解
--ポイント
---英文と同じだが、update時にfromを付けないように注意する(一回間違えた)