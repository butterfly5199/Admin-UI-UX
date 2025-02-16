use lala;

/***** Table Join *****/

# CASE 1 - Main(Master)이 되는 Table은 전부 보여주고, 조인하는 테이블에 데이터가 없으면 NULL로 처리해 보여줌
# 1) 전부 가져오기
SELECT * FROM 
	contact a
LEFT JOIN 
	contact_msgsns b
ON
	b.contact_seq = a.seq
;

# 2) 선택한 컬럼만 가져오기
SELECT
	a.seq,
    a.id,
    a.nickname,
    b.main,
    b.type,
    b.address
FROM 
	contact a
LEFT JOIN
	contact_msgsns b
ON
	b.contact_seq = a.seq
;

# 3) 조건에 맞는 데이터 가져오기 & 다중 테이블 JOIN 하기
SELECT * FROM 
	contact a
LEFT JOIN 
	contact_msgsns b
ON
	b.contact_seq = a.seq AND b.main = 1
LEFT JOIN 
	contact_email c
ON
	c.contact_seq = a.seq AND c.main = 1
WHERE 1=1 AND
	a.seq > 1
; # 보통 조인되는 테이블(b)에 조건을 걸때는 ON 뒤에 AND로 걸고, 메인이 되는 테이블(b)에 조건을 걸때는 WHERE로 건다.

# CASE 2 - Main(Master)이 되는 Table은 전부 보여주고, 조인하는 테이블에 데이터가 없으면 보여주지 않음
# 1) 전부 가져오기
SELECT * FROM 
	contact a
INNER JOIN
	contact_msgsns b
/* INNER 빼고 JOIN만 써도 동일
JOIN
	contact_msgsns b
*/
ON
	b.contact_seq = a.seq
;

# 2) 선택한 컬럼만 가져오기
SELECT
	a.seq,
    a.id,
    a.nickname,
    b.main,
    b.type,
    b.address
FROM
	contact a
JOIN
	contact_msgsns b
ON
	a.seq = b.contact_seq
;