--メモ

---デットロックを防ぐためにも、全てのtransactionにおいて可能な限り処理の順番(テーブルへのアクセス順)を統一する


--.1
A. transaction
B. commit
C. 原子性
D. 分離性
E. transactionの分離レベル

--.2-1
---2種類のSQL文の実行途中でトラブルが発生した場合に、データが不整合になる危険性

--.2-2
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
INSERT INTO 受注 (注文番号, 日付, 顧客番号, 商品番号, 注文数)
VALUES ('11111', '2020-02-11', '8856', '0012', 12);
UPDATE 在庫
SET 残数 = 残数 - 12
WHERE 商品番号 = '0012'
COMMIT;

--.3
---ア、エ、カ、ク

