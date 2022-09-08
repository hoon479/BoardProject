-- 테이블 삭제
DROP TABLE STUDENT;
DROP TABLE DEPARTMENT;
DROP TABLE PROFESSOR;

-- 교수 테이블
CREATE TABLE PROFESSOR(
    PROFNO   NUMBER(4)          NOT NULL, 
    PNAME     VARCHAR2(10 BYTE),
    USERID   VARCHAR2(10 BYTE),
    POSITION VARCHAR2(20 BYTE),
    SAL      NUMBER(10),
    HIREDATE DATE,
    COMM     NUMBER(2)
);

ALTER TABLE PROFESSOR 
    ADD CONSTRAINT PK_PROFESSOR PRIMARY KEY(PROFNO);

INSERT INTO PROFESSOR VALUES(9901, '김도훈', 'capool', '교수', 500, TO_DATE('24-01-1982','DD-MM-YYYY'), 20);
INSERT INTO PROFESSOR VALUES(9902, '이재우', 'sweat3', '조교수', 320, TO_DATE('12-04-1995','DD-MM-YYYY'), NULL);
INSERT INTO PROFESSOR VALUES(9903, '성연희', 'pascal', '조교수', 360, TO_DATE('17-05-1993','DD-MM-YYYY'), 15);
INSERT INTO PROFESSOR VALUES(9904, '염일웅', 'blue77', '전임강사', 240, TO_DATE('02-12-1998','DD-MM-YYYY'), NULL);
INSERT INTO PROFESSOR VALUES(9905, '권혁일', 'reload', '교수', 450, TO_DATE('08-01-1986','DD-MM-YYYY'), 25);
INSERT INTO PROFESSOR VALUES(9906, '이만식', 'pocari', '부교수', 420, TO_DATE('13-09-1988','DD-MM-YYYY'), NULL);
INSERT INTO PROFESSOR VALUES(9907, '전은지', 'totoro', '전임강사', 210, TO_DATE('01-06-2001','DD-MM-YYYY'), NULL);
INSERT INTO PROFESSOR VALUES(9908, '남은혁', 'bird13', '부교수', 400, TO_DATE('18-11-1990','DD-MM-YYYY'), 17);
COMMIT;

-- 학과 테이블
CREATE TABLE DEPARTMENT(
    DEPTNO  NUMBER(4)          NOT NULL,
    DNAME   VARCHAR2(30 BYTE),
    PROFNO  NUMBER(4),
    LOC     VARCHAR2(10 BYTE)
);

ALTER TABLE DEPARTMENT 
    ADD CONSTRAINT PK_DEPARTMENT PRIMARY KEY(DEPTNO);

ALTER TABLE DEPARTMENT
    ADD CONSTRAINT FK_DEPARTMENT_PROFESSOR FOREIGN KEY(PROFNO)
        REFERENCES PROFESSOR(PROFNO);

INSERT INTO DEPARTMENT VALUES(101, '컴퓨터공학과', 9901, '1호관');
INSERT INTO DEPARTMENT VALUES(102, '멀티미디어학과', 9902, '2호관');
INSERT INTO DEPARTMENT VALUES(201, '전자공학과', 9903, '3호관');
INSERT INTO DEPARTMENT VALUES(202, '기계공학과', 9904, '4호관');
INSERT INTO DEPARTMENT VALUES(100, '정보미디어학과', 9905, '5호관');
INSERT INTO DEPARTMENT VALUES(200, '메카트로닉스학과', 9906, '6호관');
INSERT INTO DEPARTMENT VALUES(300, '빅데이터학과', 9907, '7호관');
INSERT INTO DEPARTMENT VALUES(400, '응용소프트웨어학과', 9908, '8호관');
COMMIT;

-- 학생 테이블
CREATE TABLE STUDENT(
    STUDNO    NUMBER(5)          NOT NULL,
    SNAME      VARCHAR2(20 BYTE),
    USERID    VARCHAR2(10 BYTE),
    GRADE     VARCHAR2(1 BYTE),
    IDNUM     VARCHAR2(13 BYTE),
    BIRTHDATE DATE,
    TEL       VARCHAR2(13 BYTE),
    HEIGHT    NUMBER(5,2),
    WEIGHT    NUMBER(5,2),
    DEPTNO    NUMBER(4)
);

ALTER TABLE STUDENT
    ADD CONSTRAINT PK_STUDENT PRIMARY KEY(STUDNO);

ALTER TABLE STUDENT
    ADD CONSTRAINT FK_STUDENT_DEPARTMENT FOREIGN KEY(DEPTNO)
        REFERENCES DEPARTMENT(DEPTNO);

INSERT INTO STUDENT VALUES(10101, '전인하', 'jun123', '4', '7907021369824', TO_DATE('02-01-1979','DD-MM-YYYY'), '051)781-2158', 176, 72, 101);
INSERT INTO STUDENT VALUES(20101, '이동훈', 'dals', '1', '8312101128467', TO_DATE('10-12-1983','DD-MM-YYYY'), '055)426-1752', 172, 64, 201);
INSERT INTO STUDENT VALUES(10102, '박미경', 'ansel', '1', '8405162123648', TO_DATE('16-05-1984','DD-MM-YYYY'), '055)261-8947', 168, 52, 101);
INSERT INTO STUDENT VALUES(10103, '김영균', 'mandu', '3', '8103211063421', TO_DATE('11-01-1981','DD-MM-YYYY'), '051)824-9637', 170, 88 ,101);
INSERT INTO STUDENT VALUES(20102, '박동진', 'ping', '1', '8511241639826', TO_DATE('24-11-1985','DD-MM-YYYY'), '051)742-6384', 182, 70, 201);
INSERT INTO STUDENT VALUES(10201, '김진영', 'simply', '2', '8206062186327', TO_DATE('06-06-1982','DD-MM-YYYY'), '055)419-6328', 164, 48, 102);
INSERT INTO STUDENT VALUES(10104, '지은경', 'gomodo', '2', '8004122298371', TO_DATE('12-04-1980','DD-MM-YYYY'), '055)418-9627', 161, 42, 101);
INSERT INTO STUDENT VALUES(10202, '오유석', 'yousuk', '4', '7709121128379', TO_DATE('12-10-1977','DD-MM-YYYY'), '051)724-9618', 177, 92, 102);
INSERT INTO STUDENT VALUES(10203, '하나리', 'hansol', '1', '8501092378641', TO_DATE('18-12-1984','DD-MM-YYYY'), '055)296-3784', 160, 68, 102);
INSERT INTO STUDENT VALUES(10105, '임유진', 'youjin12', '2', '8301212196482', TO_DATE('21-01-1983','DD-MM-YYYY'), '02)312-9838', 171, 54, 101);
INSERT INTO STUDENT VALUES(10106, '서재진', 'seolly', '1', '8511291186273', TO_DATE('29-11-1985','DD-MM-YYYY'), '051)239-4861', 186, 72, 101);
INSERT INTO STUDENT VALUES(10204, '윤진욱', 'samba7', '3', '7904021358671', TO_DATE('02-04-1979','DD-MM-YYYY'), '053)487-2698', 171, 70, 102);
INSERT INTO STUDENT VALUES(10107, '이광훈', 'huriky', '4', '8109131276431', TO_DATE('13-10-1981','DD-MM-YYYY'), '055)736-4981', 175, 92, 101);
INSERT INTO STUDENT VALUES(20103, '김진경', 'lovely', '2', '8302282169387', TO_DATE('28-02-1983','DD-MM-YYYY'), '052)175-3941', 166, 51, 201);
INSERT INTO STUDENT VALUES(20104, '조명훈', 'rader214', '1', '8412141254963', TO_DATE('16-09-1984','DD-MM-YYYY'), '02)785-6984', 184, 62, 201);
INSERT INTO STUDENT VALUES(10108, '류민정', 'cleansky', '2', '8108192157498', TO_DATE('19-08-1981','DD-MM-YYYY'), '055)248-3679', 162, 72, 101);
COMMIT;

SET SERVEROUTPUT ON;

-- 11.
-- 다음 설명을 읽고 올바른 사용자 함수를 작업하시오.
--    1) 학생의 아이디(USERID)를 전달하면 해당 아이디를 가진 학생의 학번(STUDNO)을 반환하는 GET_STUDENT() 사용자 함수를 작성하시오. (8점)
--    2) 아이디가 'jun123'인 학생의 학번을 조회하는 쿼리문을 작성하시오. (2점)
-- 결과 이미지는 웹 화면을 참고하시오.
-- 학번
-- 10101

-- 1)
CREATE OR REPLACE FUNCTION GET_STUDENT(UID STUDENT.USERID%TYPE)
RETURN NUMBER
IS
   SNO STUDENT.STUDNO%TYPE;
BEGIN
    SELECT STUDNO
      INTO SNO
      FROM STUDENT
     WHERE USERID = UID;
     RETURN SNO;
END GET_STUDENT;

-- 2)
SELECT DISTINCT GET_STUDENT('jun123')AS 학번
  FROM STUDENT;

-- 12.
-- STUDENT 테이블의 행(Row) 단위로 삭제와 갱신이 발생한 이후 'STUD_TRIG 동작'이라는 서버메시지가 나타나도록 STUD_TRIG 트리거를 작성하시오. (10점)
CREATE OR REPLACE TRIGGER STUD_TRIG
   AFTER
   DELETE OR UPDATE
   ON STUDENT
   FOR EACH ROW
BEGIN
   DBMS_OUTPUT.PUT_LINE('STUD_TRIG 동작');
END STUD_TRIG;


-- 13. 
-- 학과번호를 전달하면 해당 학과에 소속된 학생, 교수, 학과를 모두 삭제하는 MY_PROC 프로시저를 작성하시오.
-- 예외가 발생할 경우를 대비해 예외코드와 예외메시지를 출력할 수 있도록 프로시저를 작성하시오.
-- 프로시저가 정상 동작하면 COMMIT, 예외가 발생하면 ROLLBACK 처리하시오.
--    1) 프로시저를 작성하시오. (8점)
--    2) 학과번호가 101인 학과를 대상으로 프로시저 실행 방법을 작성하시오. (2점)

-- PROFESSOR - DEPARTMENT - STUDENT
-- PROFNO(P) - PROFNO(F)              : 조인조건1
--             DEPTNO(P)  - DEPTNO(F) : 조인조건2
--                          STUDNO(P)

-- 생성순서 : PROFESSOR -> DEPARTMENT -> STUDENT
-- 삭제순서 : STUDENT -> DEPARTMENT -> PROFESSOR

-- DEPTNO에 연관된 모든 테이블의 데이터 지우기
-- 1. STUDENT 테이블에서 DEPTNO=101 정보 지우기
-- 2. DEPARTMENT 테이블에서 DEPTNO=101인 PROFNO 저장하기
-- 3. DEPARTMENT 테이블에서 DEPTNO=101인 정보 지우기
-- 4. PROFESSOR 테이블에서 2단계에서 저장한 PROFNO와 동일한 정보 지우기

-- 1) 정의
CREATE OR REPLACE PROCEDURE MY_PROC(DNO IN DEPARTMENT.DEPTNO%TYPE)
IS
   PNO PROFESSOR.PROFNO%TYPE;
BEGIN
    DELETE FROM STUDENT WHERE DEPTNO = DNO;
    SELECT PROFNO INTO PNO FROM DEPARTMENT WHERE DEPTNO = DNO;
    DELETE FROM DEPARTMENT WHERE DEPTNO = DNO;
    DELETE FROM PROFESSOR WHERE PROFNO = PNO;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END MY_PROC;


-- 2) 호출
EXECUTE MY_PROC(101);


-- 학생명, 학과명, 담당교수명 조회하기 (쿼리문제)
-- STUDENT    DEPARTMENT    PROFESSOR
-- DEPTNO     DEPTNO        DEPTNO

-- ANSI (JOIN)
SELECT S.SNAME
      ,P.PNAME
      ,D.DNAME
    FROM PROFESSOR P INNER JOIN DEPARTMENT D
      ON P.PROFNO = D.PROFNO INNER JOIN STUDENT S
      ON S.DEPTNO = D.DEPTNO;


-- ORACLE (콤마)
SELECT S.SNAME
      ,P.PNAME
      ,D.DNAME
    FROM STUDENT S, DEPARTMENT D, PROFESSOR P
    WHERE D.PROFNO = P.PROFNO
      AND S.DEPTNO = D.DEPTNO;

