--メモ

---inner join(内部結合)
----JOIN(結合)：テーブルの結合(テーブルを単純に足し合わせるのではなく、条件を指定して結合する(NULLが存在する行は結果表から消滅する)

---outer join(外部結合)
----LEFT JOIN(左外部結合)：結合元(左表)の値にNULLがある場合や、左表の結合条件の列がNULLの場合、選択列リストに抽出される右表の列は全てNULLになる(左表が必ず抽出される)
----RIGHT JOIN(右外部結合)：LEFT JOINの反対の結果が得られる(右表が必ず抽出される)
----FULL JOIN(完全外部結合)：左右の全行を必ず抽出する(RDBMSの種類によっては、FULL JOINが使えない代わりに、UNIONで同等の処理を実行する)

---そのほかの結合や注意点
----self join(自己結合)：同じテーブルに違う名前をつけて結合することになる
----副問い合わせの結果表との結合も可能(その場合は、副問い合わせの結果表にASで命名をする)

--8章演習問題

--.2-1
SELECT 社員番号, S.名前 AS 名前, B.名前 AS 部署名
FROM 社員 AS S
JOIN 部署 AS B
ON S.部署ID = B.部署ID

--.2-2
SELECT 社員番号, S1.名前 AS 名前, S2.名前 AS 上司名
FROM 社員 AS S1
LEFT JOIN 社員 AS S2 
ON S1.上司ID = S2.社員番号

--.2-3
SELECT 社員番号, S.名前 AS 名前, B.名前 AS 部署名, K.名前 AS 勤務地
FROM 社員 AS S
JOIN 部署 AS B
ON S.部署ID = B.部署ID
JOIN 支店 AS K
ON S.勤務地ID = K.支店ID

--.2-4
SELECT 支店ID AS 支店コード, K.名前 AS 支店名, S.名前 AS 支店長名, T.社員数 AS 社員数
FROM 支店 AS K
JOIN 社員 AS S
ON S.社員番号 = K.支店長ID
JOIN (SELECT COUNT(*) AS 社員数, 勤務地ID
     FROM 社員 GROUP BY 勤務地ID) AS T
ON K.支店ID = T.勤務地ID

--.2-5
SELECt S1.社員番号 AS 社員番号, S1.名前 AS 名前,
       K1.名前 AS 本人勤務地, K2.名前 AS 上司勤務地
FROM 社員 AS S1
JOIN 社員 AS S2
ON S1.上司ID = S2.社員番号
AND S1.勤務地ID <> S2.勤務地ID
JOIN 支店 AS K1
ON S1.勤務地ID = K1.支店ID 
JOIN 支店 AS K2
ON S2.勤務地ID = K2.支店ID