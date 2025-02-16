use lala;

/***** column 수정하기 *****/
/* 
	SET: 바꿀 컬럼 내용
	WHERE: 조건
	주의!!! 조건을 안쓰면 모든 데이터가 바뀜
*/
UPDATE contact
SET
	honorific = "쌤",
    memo = "나이스"
WHERE
	seq = 1
;
    
/***** 데이터 삭제하기 *****/
# 주의!!! WHERE 조건을 안쓰면 모든 데이터가 삭제됨
DELETE FROM contact
WHERE
	seq = 6
;