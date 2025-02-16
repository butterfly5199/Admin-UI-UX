use lala;

/***** contact table 데이터 추가 *****/
select * from contact;

# 문자열은 "", '' 전부 가능
INSERT INTO contact
(
    favorite,
    lastName,
    firstName,
    id,
    nickname,
    memo
)
VALUES 
(
    6,
    "전",
    '지현',
    "jihyun777",
    '예쁜지현',
    "전지현 이쁘다!"
) 
; 

/***** contact_phone table 데이터 추가 *****/
select * from contact_phone;

INSERT INTO contact_phone
(
    main,
    type,
    number,
    contact_seq
)
VALUES 
(
    0,
    "부모님집",
    "028879977",
    5
) 
; 

/***** contact_email table 데이터 추가 *****/
select * from contact_email;

INSERT INTO contact_email
(
    main,
    email,
    contact_seq
)
VALUES 
(
    1,
    "missyou123@naver.com",
    5
) 
; 

/***** contact_memoryday table 데이터 추가 *****/
select * from contact_memoryday;

INSERT INTO contact_memoryday
(
    main,
    type,
    date,
    solar,
    contact_seq
)
VALUES 
(
    0,
    "기념일",
    "2030-09-18",
    1,
    5
) 
; 

/***** contact_affiliation table 데이터 추가 *****/
select * from contact_affiliation;

INSERT INTO contact_affiliation
(
    main,
    company,
    department,
    position,
    contact_seq
)
VALUES 
(
    1,
    "LG전자",
    "사업팀",
    "CTO",
    5
) 
; 

/***** contact_address table 데이터 추가 *****/
select * from contact_address;

INSERT INTO contact_address
(
    main,
    type,
    zipcode,
    address,
    contact_seq
)
VALUES 
(
    0,
    "집",
    "99008",
    "파주시 파주읍 55-6",
    5
) 
; 

/***** contact_homepage table 데이터 추가 *****/
select * from contact_homepage;

INSERT INTO contact_homepage
(
    main,
    url,
    contact_seq
)
VALUES 
(
    1,
    "https://good.net",
    5
) 
; 

/***** contact_homepage table 데이터 추가 *****/
select * from contact_msgsns;

INSERT INTO contact_msgsns
(
    main,
    type,
    address,
    contact_seq
)
VALUES 
(
    1,
    "Threads",
    "gagamel77",
    5
) 
; 

/********* Mapping Table *********/

/***** grouplist table 데이터 추가 *****/
select * from grouplist;

INSERT INTO grouplist
(
    groupName
)
VALUES 
(
    "학교동기"
) 
; 

/***** contact_grouplist table 데이터 추가 *****/
select * from contact_grouplist;

INSERT INTO contact_grouplist
(
    contact_seq,
    grouplist_seq
)
VALUES 
(
    5,
    4
) 
; 