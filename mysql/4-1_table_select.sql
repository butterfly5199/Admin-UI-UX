use lala;

/***** Table Select *****/

# 1. 전체 가져오기
SELECT * FROM contact;

# 2-1. 선택한 column만 가져오기
SELECT
	seq,
    lastName,
    firstName,
    id,
    nickname
FROM
	contact
;

# 2-2. 선택한 column만 가져오기 - table에 별명을 붙여서 가져오기 (feat. alias)
SELECT
	seq,
    a.lastName,
    a.firstName,
    a.id,
    a.nickname
FROM
	contact as a # contact a => 동일 구문. as를 쓰지 않고 공백만 줘도 된다.
;

# 3. count() 함수 - 해당 column의 개수는 총 몇개인가?
SELECT
	count(a.seq)
FROM
	contact a
;

# 4-1. 조건에 맞는 데이터 가져오기
SELECT
	seq,
    a.lastName,
    a.firstName,
    a.id,
    a.nickname
FROM
	contact a
WHERE 1=1 AND # 1=1 AND가 들어간 이유는, 아래 구문들 중 AND 앞에 조건만 주석처리 할 경우 오류가 나기 때문에 편의상 쓴 것 (개발자들이 많이 사용하는 편법임)
	# a.seq = 3 					# seq가 3인 데이터
    # a.seq > 3 					# seq가 3 보다 큰 데이터
    a.seq > 3 AND a.lastName = "홍"	# seq가 3 보다 크고 lastName이 "홍"인 데이터
;

# 4-2. 조건에 맞는 데이터 가져오기
SELECT
	seq,
    a.lastName,
    a.firstName,
    a.id,
    a.nickname
FROM
	contact a
WHERE 1=1 AND
    # a.firstName = "길동"	# 정확히 "길동"과 일치하는 데이터
    a.firstName LIKE "%길%"	/* 	LIKE 키워드
								% 앞뒤: "길"이 어디든 포함되어 있는 데이터
								% 앞에만: 뒤가 길로 끝나는 데이터
                                % 뒤에만: 앞이 길로 시작하는 데이터
								*주의 - 퍼포먼스가 아주 떨어짐 
							*/
;

# 5. 정렬 (DESC - 내림차순 / ASC - 오름차순)
SELECT
	*
FROM
	contact a
ORDER BY
	#seq DESC 				#1개 컬럼만 정렬
    favorite DESC, seq ASC 	#2개 컬럼 정렬. 먼저 쓴 column이 먼저 정렬된다.
;