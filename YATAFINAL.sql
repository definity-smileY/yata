/*YATAFINAL.sql*/
/*TRUNCATE: 공간, 데이터를 삭제*/ /*DELETE : 데이터 삭제*/
-- 전체 테이블 삭제
SELECT  'DROP TABLE ' || object_name || ' CASCADE CONSTRAINTS;'
FROM    user_objects
WHERE   object_type = 'TABLE';

/************************************************************예약**************************************************************************/

--지역 생성
SELECT * FROM AREA;
DELETE AREA;
TRUNCATE TABLE AREA;
DROP TABLE AREA CASCADE CONSTRAINTS;

INSERT INTO AREA VALUES (1,'서울');
INSERT INTO AREA VALUES (2,'경기');
INSERT INTO AREA VALUES (3,'인천');
INSERT INTO AREA VALUES (4,'강원');
INSERT INTO AREA VALUES (5,'충북');
INSERT INTO AREA VALUES (6,'충남');
INSERT INTO AREA VALUES (7,'세종');
INSERT INTO AREA VALUES (8,'대전');
INSERT INTO AREA VALUES (9,'경북');
INSERT INTO AREA VALUES (10,'대구');
INSERT INTO AREA VALUES (11,'경남');
INSERT INTO AREA VALUES (12,'전북');
INSERT INTO AREA VALUES (13,'전남');
INSERT INTO AREA VALUES (14,'광주');
INSERT INTO AREA VALUES (15,'부산');
INSERT INTO AREA VALUES (16,'울산');
INSERT INTO AREA VALUES (17,'제주');
COMMIT;
SELECT * FROM PAYLIST;
--대여장소 시퀀스
CREATE SEQUENCE SEQ_RENTPLACES START WITH 1 INCREMENT BY 1 NOCACHE;
DROP SEQUENCE SEQ_RENTPLACES;
--대여장소 생성
SELECT * FROM RENTPLACES;
DROP TABLE RENTPLACES;
DELETE RENTPLACES;
TRUNCATE TABLE RENTPLACES;
INSERT INTO RENTPLACES VALUES (SEQ_RENTPLACES.NEXTVAL,1,'인천국제공항');
INSERT INTO RENTPLACES VALUES (SEQ_RENTPLACES.NEXTVAL,1,'김포공항');
INSERT INTO RENTPLACES VALUES (SEQ_RENTPLACES.NEXTVAL,1,'가산디지털단지');
INSERT INTO RENTPLACES VALUES (SEQ_RENTPLACES.NEXTVAL,1,'구로디지털단지');
INSERT INTO RENTPLACES VALUES (SEQ_RENTPLACES.NEXTVAL,1,'판교');
INSERT INTO RENTPLACES VALUES (SEQ_RENTPLACES.NEXTVAL,1,'강남');
INSERT INTO RENTPLACES VALUES (SEQ_RENTPLACES.NEXTVAL,1,'서초');



--반납장소 시퀀스
CREATE SEQUENCE SEQ_RETURNPLACES START WITH 1 INCREMENT BY 1 NOCACHE;
DROP SEQUENCE SEQ_RETURNPLACES;
--반납장소 생성
SELECT * FROM RETURNPLACES;
TRUNCATE TABLE RETURNPLACES;
DROP TABLE RETURNPLACES;
DELETE returnplaces;
INSERT INTO returnplaces VALUES (SEQ_RETURNPLACES.NEXTVAL,1,'인천국제공항');
INSERT INTO returnplaces VALUES (SEQ_RETURNPLACES.NEXTVAL,1,'김포공항');
INSERT INTO returnplaces VALUES (SEQ_RETURNPLACES.NEXTVAL,1,'가산디지털단지');
INSERT INTO returnplaces VALUES (SEQ_RETURNPLACES.NEXTVAL,1,'구로디지털단지');
INSERT INTO returnplaces VALUES (SEQ_RETURNPLACES.NEXTVAL,1,'판교');
INSERT INTO returnplaces VALUES (SEQ_RETURNPLACES.NEXTVAL,1,'강남');
INSERT INTO returnplaces VALUES (SEQ_RETURNPLACES.NEXTVAL,1,'서초');

-- 결제방법
SELECT * FROM PAYLIST;
INSERT INTO PAYLIST VALUES (1,'카드결제');
INSERT INTO PAYLIST VALUES (2,'계좌이체');

-- 결제상태
SELECT * FROM PAYCONDITION;
CREATE SEQUENCE SEQ_PAYCONDITION START WITH 1 INCREMENT BY 1 NOCACHE;
DROP SEQUENCE SEQ_PAYCONDITION;
INSERT INTO PAYCONDITION  VALUES (SEQ_PAYCONDITION.NEXTVAL,'결제중');
INSERT INTO PAYCONDITION  VALUES (SEQ_PAYCONDITION.NEXTVAL,'결제취소');
INSERT INTO PAYCONDITION  VALUES (SEQ_PAYCONDITION.NEXTVAL,'결제완료');
INSERT INTO PAYCONDITION  VALUES (SEQ_PAYCONDITION.NEXTVAL,'대여중');
INSERT INTO PAYCONDITION  VALUES (SEQ_PAYCONDITION.NEXTVAL,'반납완료');
COMMIT;
-- 자기부담금
SELECT * FROM PREMIUM;
INSERT INTO PREMIUM VALUES (1,'70만원','4,500원');
INSERT INTO PREMIUM VALUES (2,'30만원','8,550원');
INSERT INTO PREMIUM VALUES (3,'5만원','16,500원');

SELECT * FROM CUSTOMER_RELATIONS;
SELECT * FROM RENT_RELATIONS;
DELETE RENT_RELATIONS;
CREATE SEQUENCE SEQ_RENT_RELATIONS START WITH 1 INCREMENT BY 1 NOCACHE;
DROP SEQUENCE SEQ_RENT_RELATIONS;
INSERT INTO RENT_RELATIONS (RRCODE, CTRCODE, CRCODE, RENCODE, RETCODE, PLCODE, PCCODE, PMCODE, RSDATE, RNDATE, RTDATE, PAY, PAYDAY)
VALUES (SEQ_RENT_RELATIONS.NEXTVAL, 1, 1, 1, 1, 1, 1, 1, SYSDATE,TO_DATE('2020/05/19', 'YYYY/MM/DD'),TO_DATE('2020/05/20', 'YYYY/MM/DD'),'50,000원','85,000원');


/*****************************************************************차량정보******************************************************************/
-- 탑승인원수
SELECT * FROM PASSENGER; 
INSERT INTO PASSENGER VALUES (1,'2인승');
INSERT INTO PASSENGER VALUES (2,'4인승');
INSERT INTO PASSENGER VALUES (3,'6인승');
INSERT INTO PASSENGER VALUES (4,'8인승');

-- 대여료
SELECT * FROM RENT;
UPDATE RENT SET RENT = '100,000' WHERE RCODE = 4; --수정쿼리
INSERT INTO RENT VALUES (1,'30,000');
INSERT INTO RENT VALUES (2,'50,000');
INSERT INTO RENT VALUES (3,'70,000');
INSERT INTO RENT VALUES (4,'100,000');

-- 연료규정
SELECT * FROM FUEL;
INSERT INTO FUEL VALUES (1,'FULL TO FULL'); /*연료를 다시 원상*/
INSERT INTO FUEL VALUES (2,'NONE'); /**/

-- 상태
SELECT * FROM CONDITION;
INSERT INTO CONDITION VALUES (1,'LPG');
INSERT INTO CONDITION VALUES (2,'경유');
INSERT INTO CONDITION VALUES (3,'휘발유');

--총주행거리계
SELECT * FROM DISTANCE;

INSERT INTO DISTANCE VALUES (1,'75,342km');
INSERT INTO DISTANCE VALUES (2,'130,500km');
INSERT INTO DISTANCE VALUES (3,'11,500km');
INSERT INTO DISTANCE VALUES (4,'158,000km');
INSERT INTO DISTANCE VALUES (5,'7,500km');

--차종
SELECT * FROM CARMODEL ORDER BY CARMOCODE ASC;

DELETE FROM CARMODEL;--삭제
INSERT INTO CARMODEL VALUES (0,'전체선택');
INSERT INTO CARMODEL VALUES (1,'세단');
INSERT INTO CARMODEL VALUES (2,'SUV');
INSERT INTO CARMODEL VALUES (3,'소형차');
COMMIT;

--차량회사
SELECT * FROM CARCOM;

DELETE FROM CARCOM WHERE CARCOM = '르노' ; --삭제
INSERT INTO CARCOM VALUES (1,'현대');
INSERT INTO CARCOM VALUES (2,'기아');
INSERT INTO CARCOM VALUES (3,'쌍용');


-- 차량시퀀스 생성
CREATE SEQUENCE SEQ_CAR START WITH 1 INCREMENT BY 1 NOCACHE;
DROP SEQUENCE SEQ_CAR;

--차량
SELECT * FROM CAR;

DELETE FROM CAR;
INSERT INTO CAR VALUES (SEQ_CAR.NEXTVAL,1,1,'제네시스G70','j1.jpg');
INSERT INTO CAR VALUES (SEQ_CAR.NEXTVAL,1,1,'제네시스G80','j2.jpg');
INSERT INTO CAR VALUES (SEQ_CAR.NEXTVAL,1,1,'그랜져','h3.png');
INSERT INTO CAR VALUES (SEQ_CAR.NEXTVAL,1,1,'아반떼','h1.png');
INSERT INTO CAR VALUES (SEQ_CAR.NEXTVAL,1,1,'소나타','h2.png');
INSERT INTO CAR VALUES (SEQ_CAR.NEXTVAL,1,2,'코나','h4.png');
INSERT INTO CAR VALUES (SEQ_CAR.NEXTVAL,2,1,'K5','k1.jpg');
INSERT INTO CAR VALUES (SEQ_CAR.NEXTVAL,2,2,'쏘렌토','k2.png');
INSERT INTO CAR VALUES (SEQ_CAR.NEXTVAL,3,2,'티볼리','s1.jpg');

--차량정보 (차량정보코드 기준)
DELETE FROM CAR_RELATIONS WHERE CRCODE = 1; --삭제
SELECT * FROM CAR_RELATIONS ORDER BY CRCODE ASC;
DELETE FROM CAR_RELATIONS;

INSERT INTO CAR_RELATIONS VALUES(1,'12가1236',4,1,1,1,1,2);--현대 아반테 1~2인 3만원
INSERT INTO CAR_RELATIONS VALUES(2,'12가1237',5,1,1,2,2,4);--현대 소나타  4인 5만원
INSERT INTO CAR_RELATIONS VALUES(3,'12가1238',3,1,1,3,2,3);--현대 그랜져  4인 7만원
INSERT INTO CAR_RELATIONS VALUES(4,'12가1239',6,1,1,1,2,1);--현대 코나   4인  3만원
INSERT INTO CAR_RELATIONS VALUES(5,'12가1230',1,1,1,1,1,2);--현대 G70  1~2인  3만원
INSERT INTO CAR_RELATIONS VALUES(6,'12가1231',2,1,1,4,1,3);--현대 G80  2인 10만원
INSERT INTO CAR_RELATIONS VALUES(7,'12가1232',7,1,1,2,2,2);--기아 K5   4인  5만원
INSERT INTO CAR_RELATIONS VALUES(8,'12가1233',8,1,1,2,2,4);--기아 쏘렌토    4인 5만원
INSERT INTO CAR_RELATIONS VALUES(9,'12가1244',9,1,1,2,1,1);--쌍용 티볼리  4인 5만원


/*************************************************************회원관리*****************************************************************/
--시도이름
SELECT * FROM BASEADRESSE;
CREATE SEQUENCE SEQ_BASEADRESSE START WITH 1 INCREMENT BY 1 NOCACHE;
DROP SEQUENCE SEQ_BASEADRESSE;
INSERT INTO BASEADRESSE VALUES (SEQ_BASEADRESSE.NEXTVAL,'서울');
INSERT INTO BASEADRESSE VALUES (SEQ_BASEADRESSE.NEXTVAL,'경기');
INSERT INTO BASEADRESSE VALUES (SEQ_BASEADRESSE.NEXTVAL,'인천');
INSERT INTO BASEADRESSE VALUES (SEQ_BASEADRESSE.NEXTVAL,'강원');
INSERT INTO BASEADRESSE VALUES (SEQ_BASEADRESSE.NEXTVAL,'충북');
INSERT INTO BASEADRESSE VALUES (SEQ_BASEADRESSE.NEXTVAL,'충남');
INSERT INTO BASEADRESSE VALUES (SEQ_BASEADRESSE.NEXTVAL,'세종');
INSERT INTO BASEADRESSE VALUES (SEQ_BASEADRESSE.NEXTVAL,'대전');
INSERT INTO BASEADRESSE VALUES (SEQ_BASEADRESSE.NEXTVAL,'경북');
INSERT INTO BASEADRESSE VALUES (SEQ_BASEADRESSE.NEXTVAL,'대구');
INSERT INTO BASEADRESSE VALUES (SEQ_BASEADRESSE.NEXTVAL,'경남');
INSERT INTO BASEADRESSE VALUES (SEQ_BASEADRESSE.NEXTVAL,'전북');
INSERT INTO BASEADRESSE VALUES (SEQ_BASEADRESSE.NEXTVAL,'전남');
INSERT INTO BASEADRESSE VALUES (SEQ_BASEADRESSE.NEXTVAL,'광주');
INSERT INTO BASEADRESSE VALUES (SEQ_BASEADRESSE.NEXTVAL,'부산');
INSERT INTO BASEADRESSE VALUES (SEQ_BASEADRESSE.NEXTVAL,'울산');
INSERT INTO BASEADRESSE VALUES (SEQ_BASEADRESSE.NEXTVAL,'제주');

--구군이름
SELECT * FROM BASEADRESSE2;
DELETE BASEADRESSE2;
CREATE SEQUENCE SEQ_BASEADRESSE2 START WITH 1 INCREMENT BY 1 NOCACHE;
DROP SEQUENCE SEQ_BASEADRESSE2;
INSERT INTO BASEADRESSE2 VALUES (SEQ_BASEADRESSE2.NEXTVAL,1,'종로구');
INSERT INTO BASEADRESSE2 VALUES (SEQ_BASEADRESSE2.NEXTVAL,1,'중구');
INSERT INTO BASEADRESSE2 VALUES (SEQ_BASEADRESSE2.NEXTVAL,1,'용산구');
INSERT INTO BASEADRESSE2 VALUES (SEQ_BASEADRESSE2.NEXTVAL,1,'성동구');
INSERT INTO BASEADRESSE2 VALUES (SEQ_BASEADRESSE2.NEXTVAL,1,'광진구');
INSERT INTO BASEADRESSE2 VALUES (SEQ_BASEADRESSE2.NEXTVAL,1,'동대문구');
INSERT INTO BASEADRESSE2 VALUES (SEQ_BASEADRESSE2.NEXTVAL,1,'중랑구');
INSERT INTO BASEADRESSE2 VALUES (SEQ_BASEADRESSE2.NEXTVAL,1,'성북구');
INSERT INTO BASEADRESSE2 VALUES (SEQ_BASEADRESSE2.NEXTVAL,1,'강북구');
INSERT INTO BASEADRESSE2 VALUES (SEQ_BASEADRESSE2.NEXTVAL,1,'도봉구');
INSERT INTO BASEADRESSE2 VALUES (SEQ_BASEADRESSE2.NEXTVAL,1,'노원구');
INSERT INTO BASEADRESSE2 VALUES (SEQ_BASEADRESSE2.NEXTVAL,1,'은평구');
INSERT INTO BASEADRESSE2 VALUES (SEQ_BASEADRESSE2.NEXTVAL,1,'서대문구');
INSERT INTO BASEADRESSE2 VALUES (SEQ_BASEADRESSE2.NEXTVAL,1,'마포구');
INSERT INTO BASEADRESSE2 VALUES (SEQ_BASEADRESSE2.NEXTVAL,1,'양천구');
INSERT INTO BASEADRESSE2 VALUES (SEQ_BASEADRESSE2.NEXTVAL,1,'강서구');
INSERT INTO BASEADRESSE2 VALUES (SEQ_BASEADRESSE2.NEXTVAL,1,'구로구');
INSERT INTO BASEADRESSE2 VALUES (SEQ_BASEADRESSE2.NEXTVAL,1,'금천구');
INSERT INTO BASEADRESSE2 VALUES (SEQ_BASEADRESSE2.NEXTVAL,1,'영등포구');
INSERT INTO BASEADRESSE2 VALUES (SEQ_BASEADRESSE2.NEXTVAL,1,'동작구');
INSERT INTO BASEADRESSE2 VALUES (SEQ_BASEADRESSE2.NEXTVAL,1,'관악구');
INSERT INTO BASEADRESSE2 VALUES (SEQ_BASEADRESSE2.NEXTVAL,1,'서초구');
INSERT INTO BASEADRESSE2 VALUES (SEQ_BASEADRESSE2.NEXTVAL,1,'강남구');
INSERT INTO BASEADRESSE2 VALUES (SEQ_BASEADRESSE2.NEXTVAL,1,'송파구');

--성별
SELECT * FROM SEX;
INSERT INTO SEX VALUES(1,'남');
INSERT INTO SEX VALUES(2,'여');

--국적
SELECT * FROM NATIONALITY;
DELETE NATIONALITY;
DROP SEQUENCE SEQ_NATIONALITY;
CREATE SEQUENCE SEQ_NATIONALITY START WITH 1 INCREMENT BY 1 NOCACHE;
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'룩셈부르크');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'스위스');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'노르웨이');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'아일랜드');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'카타르');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'아이슬란드');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'싱가포르');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'미국');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'덴마크');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'호주');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'네덜란드');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'스웨덴');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'오스트리아');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'핀란드');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'산마리노');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'독일');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'캐나다');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'벨기에');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'프랑스');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'영국');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'이스라엘');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'뉴질랜드');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'일본');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'아랍 에미리트');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'바하마');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'이탈리아');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'푸에르토리코몰타');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'대한민국');
INSERT INTO NATIONALITY VALUES(SEQ_NATIONALITY.NEXTVAL,'스페인');

--통신사
SELECT * FROM AGENCY;
INSERT INTO AGENCY VALUES (1,'SKT');
INSERT INTO AGENCY VALUES (2,'KT');
INSERT INTO AGENCY VALUES (3,'LG');
SELECT * FROM CUSTOMER_RELATIONS;
--회원관리
SELECT * FROM CUSTOMER_RELATIONS;
CREATE SEQUENCE SEQ_NATIONALITY START WITH 1 INCREMENT BY 1 NOCACHE;
DROP SEQUENCE SEQ_NATIONALITY;
DELETE CUSTOMER_RELATIONS;
INSERT INTO CUSTOMER_RELATIONS VALUES (SEQ_NATIONALITY.NEXTVAL,1,1,28,1,'윤우섭','19960216','서울숲포레','010-1234-5678','ZSDM@NAVER.COM','1234567','123124','123411',NULL);
INSERT INTO CUSTOMER_RELATIONS VALUES (SEQ_NATIONALITY.NEXTVAL,1,1,28,1,'관리자','19960216','시그니엘','010-1234-1234','yysdntjq@naver.com','1234','123123','1234123',1);
SELECT * FROM CAR_RELATIONS WHERE CRCODE=1;
SELECT * FROM CUSTOMER_RELATIONS;
SELECT * FROM CUSTOMER_RELATIONS WHERE EMAIL='yysdntjq@naver.com' AND PASSWORD='1234';
SELECT * FROM CUSTOMER_RELATIONS WHERE ADMIN='1';
update customer_relations set admin = 0 where uname='윤우섭';
commit;
-----------------------------------------------------조인-------------------------------------------------------------
SELECT
A.AREA,
B.CITY
FROM AREA A
INNER JOIN BASEADRESSE B ON A.AREA = B.CITY; -- 지역코드에있는 지역과 시도에있는 시도이름과 조인

/* SELECT FUD.F_CODE, FUD.F_DATE, FUD.F_NAME, FUD.F_SAVENAME, FUD.F_TITLE
FROM FILEUPDOWN FUD, F_THEMECODE TC
WHERE FUD.T_CODE = TC.T_CODE
ORDER BY FUD.F_CODE DESC; */

--자동차사진 업로드 쿼리조인 (차량)
SELECT CARCODE, CARNAME , IMG , CARMODEL , CARCOM
FROM CAR
INNER JOIN CARMODEL ON CAR.CARMOCODE = CARMODEL.CARMOCODE
INNER JOIN CARCOM ON CAR.CARCOMCODE = CARCOM.CARCOMCODE
ORDER BY CARCODE ASC;

--차량정보 업로드 조인(차량정보)
SELECT LICENSEPLATE , passenger,rent,fuel,condition,distance,carname,img
FROM CAR_RELATIONS
INNER JOIN CAR ON CAR_RELATIONS.CARCODE = CAR.CARCODE
INNER JOIN PASSENGER ON CAR_RELATIONS.PASSENGERCODE = PASSENGER.PASSENGERCODE
INNER JOIN RENT ON CAR_RELATIONS.RCODE = RENT.RCODE
INNER JOIN FUEL ON CAR_RELATIONS.FCODE = FUEL.FCODE
INNER JOIN CONDITION ON CAR_RELATIONS.CDCODE = CONDITION.CDCODE
INNER JOIN DISTANCE ON CAR_RELATIONS.DTCODE = DISTANCE.DTCODE;

SELECT * FROM CAR;
SELECT * FROM CARMODEL;
SELECT * FROM CARCOM;

COMMIT;

SELECT * FROM RENT_RELATIONS;

/*INSERT INTO RENT_RELATIONS VALUES(1234);*/

/*SELECT RSDATE, PR.SPREMIUM RNDATE, RTDATE ,PAY, PAYDAY FROM RENT_RELATIONS RR, PREMIUM PR WHERE RRCODE =1234;*/
/*select * from RENT_RELATIONS where ctrcode = 000;*/


-- 예약날짜 예약지역 대여날짜 대여지역
SELECT * FROM RENT_RELATIONS;


-- 예약날짜 예약지역 대여날짜 대여지역
SELECT TO_CHAR(rsdate, 'YYYY-MM-DD') AS registDate FROM RENT_RELATIONS;

ALTER TABLE rent_relations modify (rtdate date);
SELECT * FROM RENT_RELATIONS WHERE RRCODE=5;

-- 차량 코드를 받아서 최근 RRCODE를 받아오기
CREATE OR REPLACE FUNCTION RRCODE_OUT
(P_CRCODE IN CAR_RELATIONS.CRCODE%TYPE)
RETURN NUMBER
IS
ORCODE NUMBER;
BEGIN
 SELECT MAX(RRCODE) INTO ORCODE FROM RENT_RELATIONS WHERE CRCODE=P_CRCODE;
 RETURN ORCODE;
END;

SELECT * FROM RENT_RELATIONS WHERE RRCODE=RRCODE_OUT(1);

/*CREATE SEQUENCE SEQ_NATIONALITY START WITH 1 INCREMENT BY 1 NOCACHE;
INSERT INTO RENT_RELATIONS VALUES*/
----결제창
--차량명, 자기부담금, 1일 대여료, 최종 결제 금액
/* 
CREATE VIEW V_CAR AS SELECT * FROM
(SELECT CARCODE, CBNAME, CKNAME, CYNAME, CNNAME, CDNAME, CARAMOUNT, CARCOUNT
FROM CAR CAR, CARBRAND CB, CARKIND CK, CARYEAR CY, CARNAME CN, CARDETAIL CD
WHERE CB.CBCODE=CN.CBCODE AND CK.CKCODE=CN.CKCODE AND CN.CNCODE=CAR.CNCODE
AND CD.CDCODE=CAR.CDCODE AND CY.CYCODE=CAR.CYCODE); 
*/
--차량명, 자기부담금, 보험로, 1일 대여료, 최종 결제 금액
CREATE VIEW P_CAR AS
SELECT carname, spremium, premium, rent, payday
FROM car car,premium pm,rent rt,RENT_RELATIONS rr,car_relations cr
WHERE car.carcode=cr.carcode AND pm.pmcode=rr.PMCODE AND cr.crcode=rr.crcode
AND rt.rcode=cr.rcode ;

SELECT * FROM P_CAR;
DROP VIEW P_CAR;
commit;
INSERT INTO RENT_RELATIONS(RSDATE,AREA,RENTPLACES,RNDATE,RTDATE,RETURNPLACES) VALUES (SYSDATE,'서울','강남','TO_CHAR(YYYY/MM/DD)',SYSDATE,'압구정'); 

--날짜 계산 example    현재시간 - 예약한 시간 
SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMMDD')) - TO_DATE('20200315') FROM DUAL;
-- 현재 시간,예약한 날짜 - 반납한 날짜 
SELECT TO_DATE('2020-04-19')+1 - TO_DATE('2020-04-18') FROM RENT_RELATIONS;

SELECT TRUNC(TO_DATE('2020-04-19'),'DD')+1 - TRUNC(TO_DATE('2020-04-18'),'DD') FROM RENT_RELATIONS;

SELECT TRUNC*(3) FROM RENT_RELATIONS;

SELECT TO_DATE(('2020-04-19')+1 - TO_DATE('2020-04-18'))* RENT(1) FROM RENT_RELATIONS;

-- 예약
-- 결제금액
SELECT A.RTDATE, A.RNDATE, TO_CHAR((TO_CHAR(A.RTDATE, 'YYYYMMDD') - TO_CHAR(A.RNDATE, 'YYYYMMDD') + 1) * B.RENT, 'FM999,999,999') PMONEY
, B.RENT, B.CARNAME
  FROM RENT_RELATIONS A
    , (SELECT *
         FROM CAR_RELATIONS A
            , RENT B
            , CAR C
        WHERE A.RCODE = B.RCODE
          AND A.CARCODE = C.CARCODE
      ) B
 WHERE A.CRCODE = B.CRCODE;
 

--  최종결제금액
SELECT RRCODE, MONEY FROM (SELECT A.RRCODE,A.RTDATE, A.RNDATE, TO_CHAR(((TO_CHAR(A.RTDATE, 'YYYYMMDD') - TO_CHAR(A.RNDATE, 'YYYYMMDD') + 1)
* B.RENT) + C.PREMIUM, 'FM999,999,999')MONEY, B.RENT, B.CARNAME
     , C.PREMIUM
  FROM RENT_RELATIONS A
    , (SELECT *
         FROM CAR_RELATIONS A
            , RENT B
            , CAR C
        WHERE A.RCODE = B.RCODE
          AND A.CARCODE = C.CARCODE
      ) B
    , PREMIUM C
 WHERE A.CRCODE = B.CRCODE
   AND A.PMCODE = C.PMCODE) WHERE RRCODE = 2;

COMMIT;
--------------------------------------------------------------------------------------------------------------------------------------
SELECT SUBSTR(PREMIUM, 1, LENGTH(PREMIUM)-1) FROM PREMIUM;

UPDATE PREMIUM SET PREMIUM = SUBSTR(PREMIUM, 1, LENGTH(PREMIUM)-1)



UPDATE RENT SET RENT = REPLACE(RENT, ',', '');
SELECT * FROM RENT_RELATIONS;




SELECT * FROM P_CAR;

-- 대여 view
CREATE VIEW R_T AS
SELECT RENTPLACES, AREA
FROM RENTPLACES RP, AREA A
WHERE A.ACODE = RP.ACODE;

SELECT * FROM R_T;
-- 반납 view
CREATE VIEW R_R AS
SELECT RETURNPLACES, AREA
FROM RETURNPLACES RP, AREA AT
WHERE AT.AOCDE = RP.ACODE;
commit;
SELECT * FROM R_R;

--차량 정보 VIEW
CREATE VIEW C_R AS
SELECT LICENSEPLATE, CARNAME, CARMODEL,IMG, CARCOM, CONDITION, FUEL, RENT, PASSENGER, DISTANCE, CRCODE 
FROM CAR_RELATIONS CR, CAR CA, CARMODEL CM, CARCOM CO, PASSENGER PG, RENT RT, FUEL FL, CONDITION CN, DISTANCE DE
WHERE CM.CARMOCODE = CA.CARMOCODE AND CO.CARCOMCODE = CA.CARCOMCODE AND CA.CARCODE = CR.CARCODE AND DE.DTCODE = CR.DTCODE AND CN.CDCODE = CR.CDCODE 
AND FL.FCODE = CR.FCODE AND RT.RCODE = CR.RCODE AND PG.PASSENGERCODE = CR.PASSENGERCODE;

SELECT * FROM CAR;
DROP VIEW C_R;
SELECT * FROM C_R ORDER BY CRCODE ASC; --번호판, 차명, 차종,차이미지, 회사, 옵션, 연료, 렌트, 인원수, 총거리주행계, 코드
commit;

SELECT * FROM RENT;

SELECT * FROM CAR_RELATIONS;

--예약 정보 VIEW
CREATE VIEW R_S AS
SELECT RSDATE, RNDATE, RTDATE, PAY, PAYDAY, RENTPLACES, RETURNPLACES,PAYLIST,PCONDITION,SPREMIUM,PREMIUM,AREA
FROM RENT_RELATIONS RR, RENTPLACES RP, RETURNPLACES EP, PAYLIST PL, PAYCONDITION PC, PREMIUM PM, AREA AA
WHERE RP.RENCODE = RR.RENCODE AND EP.RETCODE = RR.RETCODE AND PL.PLCODE = RR.PLCODE AND PC.PCCODE = RR.PCCODE AND PM.PMCODE = RR.PMCODE AND AA.ACODE = RP.ACODE;

SELECT * FROM R_S;

--예약관리목록view
CREATE VIEW F_F AS
SELECT UNAME,EMAIL,PHONE,CARMODEL,RENTPLACES,RETURNPLACES,RSDATE,PCONDITION
FROM CUSTOMER_RELATIONS QW, CARMODEL ER, RENTPLACES TY, RETURNPLACES UI, RENT_RELATIONS OP, PAYCONDITION SD, CAR_RELATIONS DF, CAR FG
WHERE QW.CTRCODE = OP.CTRCODE AND ER.CARMOCODE = FG.CARMOCODE AND FG.CARCODE = DF.CARCODE AND TY.RENCODE = OP.RENCODE AND UI.RETCODE = OP.RETCODE AND SD.PCCODE = OP.PCCODE;

SELECT DISTINCT * FROM F_F;


-- 예약관리
CREATE VIEW G_G AS
SELECT UNAME,EMAIL,PHONE,CARNAME,RENTPLACES,RETURNPLACES,RSDATE,PCONDITION,RRCODE
FROM RENT_RELATIONS
INNER JOIN CUSTOMER_RELATIONS ON RENT_RELATIONS.CTRCODE = CUSTOMER_RELATIONS.CTRCODE
INNER JOIN CAR_RELATIONS ON RENT_RELATIONS.CRCODE = CAR_RELATIONS.CRCODE
INNER JOIN RENTPLACES ON RENT_RELATIONS.RENCODE = RENTPLACES.RENCODE
INNER JOIN RETURNPLACES ON RENT_RELATIONS.RETCODE = RETURNPLACES.RETCODE
INNER JOIN PAYCONDITION ON RENT_RELATIONS.PCCODE = PAYCONDITION.PCCODE
INNER JOIN CAR ON CAR_RELATIONS.CARCODE = CAR.CARCODE
ORDER BY RRCODE ASC; 

DROP VIEW G_G;
SELECT * FROM G_G;
COMMIT;

UPDATE RENT_RELATIONS SET PCCODE = 2 WHERE RRCODE = 1;
DELETE FROM RENT_RELATIONS WHERE RRCODE = ;

SELECT * FROM RENT_RELATIONS;
SELECT * FROM RENT_RELATIONS ORDER BY RRCODE ASC; --예약정보
DELETE FROM RENT_RELATIONS;
commit;
SELECT * FROM PAYLIST;
SELECT * FROM CAR_RELATIONS; --차량정보
SELECT * FROM P_CAR;  -- 차량INSERT된값
SELECT * FROM R_T ORDER BY RENCODE ASC; --대여장소
SELECT * FROM R_R ORDER BY RETCODE ASC; --반납장소
SELECT * FROM AREA; -- 지역
SELECT * FROM C_R ORDER BY CRCODE ASC;--차량정보
SELECT * FROM PREMIUM; -- 부담금/보험료

SELECT * FROM C_R WHERE CRCODE = 2;
SELECT * FROM RENTPLACES WHERE RENCODE=7;
SELECT * FROM CUSTOMER_RELATIONS;

SELECT pccode,pcondition from paycondition;



-- 최신 데이터 조회 ( 마이페이지 )------------------------------------------------------------------------------------------------------
CREATE VIEW Y_W AS
SELECT UNAME,CARCOM,CARNAME,LICENSEPLATE,DISTANCE,RENTPLACES,RNDATE,RETURNPLACES,RTDATE,PAYDAY,PAYLIST,RRCODE,IMG
FROM RENT_RELATIONS ZX, CUSTOMER_RELATIONS XC, CAR CV,CARCOM VB,CAR_RELATIONS BN,DISTANCE NM,RENTPLACES MA,RETURNPLACES SD,PAYLIST DF 
WHERE XC.CTRCODE = ZX.CTRCODE AND VB.CARCOMCODE = CV.CARCOMCODE AND CV.CARCODE = BN.CARCODE AND BN.CRCODE = ZX.CRCODE AND NM.DTCODE = BN.DTCODE
AND MA.RENCODE = ZX.RENCODE AND SD.RETCODE = ZX.RETCODE AND DF.PLCODE = ZX.PLCODE
ORDER BY RRCODE ASC;

DROP VIEW Y_W;
SELECT * FROM Y_W ORDER BY RRCODE ASC;

SELECT * FROM Y_W WHERE RRCODE = (SELECT MAX(RRCODE)AS RRCODE FROM Y_W);
COMMIT;
----------------------------------------------------------------------------------------------------------------------------------------------------------