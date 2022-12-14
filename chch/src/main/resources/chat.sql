select * from tabs;

-- chat

DROP TABLE chat;

CREATE TABLE chat (
	chat_no NUMBER(10) PRIMARY KEY,					--메세지번호
	room_no NUMBER(10) NOT NULL,					--대화방번호
	sender VARCHAR2 (200) NOT NULL,					--발신자
	chat_content VARCHAR2 (200) NOT NULL,			--내용
	send_time DATE NOT NULL						--발신일시
);



SELECT * FROM chat;

SELECT * FROM member;


INSERT INTO chat values (1, 1, 'a', '안녕하세요~', sysdate);
INSERT INTO chat values (2, 1, 'b', '반갑습니다!!', sysdate);
INSERT INTO chat values (3, 1, 'a', '날씨가 참 좋네요~', sysdate);
INSERT INTO chat values (4, 1, 'b', '..??', sysdate);
INSERT INTO chat values (5, 1, 'a', '아, 아닙니다!! 책좀 사고싶은데요..~~!!', sysdate);
INSERT INTO chat values (6, 1, 'b', '네 올려놓은 가격에 팔고 있습니다', sysdate, '', 'n');
INSERT INTO chat values (7, 1, 'a', '조금 비싸서 그런데 조금만 깎아주실 수 있나요?', sysdate);
INSERT INTO chat values (8, 1, 'b', '네고는 받지 않습니다..', sysdate);
INSERT INTO chat values (9, 1, 'a', '아...', sysdate);
INSERT INTO chat values (10, 1, 'b', '음.. 집앞까지 오시면 차비는 빼드릴게요..', sysdate);
INSERT INTO chat values (11, 1, 'a', '감사합니다!!!!! 시간은 언제가 괜찮으신가요?', sysdate);
INSERT INTO chat values (12, 1, 'b', '평일 오후 8시 이후면 다 좋습니다', sysdate);
INSERT INTO chat values (13, 1, 'a', '혹시 주말에는 시간이 안되시나요?', sysdate);
INSERT INTO chat values (14, 1, 'b', '앗 주말은 시간이 조금 애매해요', sysdate);
INSERT INTO chat values (15, 1, 'b', '토요일 낮시간 밖에 안됩니다..', sysdate);
INSERT INTO chat values (16, 1, 'a', '이번주 토요일 1시정도에 거래 가능하실까요?', sysdate);
INSERT INTO chat values (17, 1, 'a', '꼭 좀 부탁드립니다!!!', sysdate);
INSERT INTO chat values (18, 1, 'b', '네 그럼 그때 오세요!', sysdate);
INSERT INTO chat values (19, 1, 'a', '감사합니다!! 당일 출발할 때 쯤 연락 한번 더 드리겠습니다', sysdate);
INSERT INTO chat values (20, 1, 'b', '네 알겠습니다~', sysdate);
INSERT INTO chat values (21, 1, 'a', '그럼 이만..', sysdate);
INSERT INTO chat values (22, 1, 'b', '넵 토요일에 뵙겠습니다', sysdate);
INSERT INTO chat values (23, 2, 'c', '안녕하세요!!!', sysdate);
INSERT INTO chat values (24, 2, 'c', '책 사고싶습니다~~~', sysdate);
INSERT INTO chat values (25, 2, 'a', '안녕하세요~~', sysdate);
INSERT INTO chat values (26, 2, 'c', '아직 팔고 계신거죠?', sysdate);
INSERT INTO chat values (27, 3, 'a', '안녕하세요~~', sysdate);
INSERT INTO chat values (28, 3, 'b', '하이하이', sysdate);
INSERT INTO chat values (29, 3, 'c', '방가방가', sysdate);

ALTER TABLE chat DROP COLUMN read_time;
ALTER TABLE chat DROP COLUMN read_chk;

SELECT * FROM chat;

-- room

DROP TABLE room;

CREATE TABLE room (
	room_no NUMBER(10),
	id VARCHAR2(100),
	room_name VARCHAR2(100),
	join_date DATE,
	check_time DATE,
	leave CHAR(1),
	unread NUMBER(10) DEFAULT 0,
	usued_no NUMBER(10),
	CONSTRAINT room_pk PRIMARY KEY(room_no, id)
);

ALTER TABLE room ADD unread NUMBER(10) DEFAULT 0;

ALTER TABLE room MODIFY leave INVISIBLE;
ALTER TABLE room MODIFY leave VISIBLE;

SELECT * from room;

INSERT INTO room VALUES (1, 'a', '', sysdate, sysdate, 'n', 0);
INSERT INTO room VALUES (1, 'b', '', sysdate, sysdate, 'n', 0);
INSERT INTO room VALUES (2, 'a', '', sysdate, sysdate, 'n', 0);
INSERT INTO room VALUES (2, 'c', '', sysdate, sysdate, 'n', 0);
INSERT INTO room VALUES (3, 'a', '', sysdate, sysdate, 'n', 0);
INSERT INTO room VALUES (3, 'b', '', sysdate, sysdate, 'n', 0);
INSERT INTO room VALUES (3, 'c', '', sysdate, sysdate, 'n', 0);


SELECT * FROM chat;


-- community

DROP TABLE community;

CREATE TABLE community (
	community_no NUMBER(10) PRIMARY KEY,
	room_no NUMBER(10),
	host_id VARCHAR2(20),
	community_category VARCHAR2(100),
	community_subject VARCHAR2(100),
	community_content VARCHAR2(100),
	max_member NUMBER(2),
	community_gender VARCHAR2(6),
	min_age NUMBER(3),
	max_age NUMBER(3),
	community_location VARCHAR2(100),
	community_del CHAR(1)
	
)

SELECT * FROM community;


drop table inquiry CASCADE CONSTRAINTS;
CREATE TABLE inquiry(
	inquiry_no NUMBER(10) PRIMARY KEY,			--문의번호
	id VARCHAR2(20) NOT NULL,					--아이디
	category_no NUMBER(10) NOT NULL,			--카테고리번호
	inquiry_subject VARCHAR2(500) NOT NULL,		--문의제목
	inquiry_content VARCHAR2(4000) NOT NULL,	--문의내용
	reg_time DATE NOT NULL,						--문의시간
	reply CHAR(1) DEFAULT 'n',					--답변여부
	reply_content VARCHAR2(4000),				--답변내용
	reply_time DATE,							--답변시간
	reply_check CHAR(1) DEFAULT 'n',			--답변확인
	CONSTRAINT inquiry_id_fk FOREIGN KEY (id) REFERENCES member(id)
);



-- test

SELECT * FROM chat;
SELECT * FROM room;

SELECT * FROM chat WHERE room_no=1;

SELECT rownum, a.*, r.*
FROM (SELECT * FROM chat WHERE room_no=1 ORDER BY chat_no DESC) a, room r
WHERE  a.room_no=r.room_no AND a.send_time > r.join_date AND rownum <= 20 ORDER BY chat_no ASC;

SELECT * FROM chat WHERE room_no=1 ORDER BY chat_no DESC;

SELECT * FROM chat c, room r WHERE c.room_no=#{room_no} AND c.room_no=r.room_no ORDER BY chat_no DESC;

SELECT * FROM chat c, room r WHERE c.room_no=r.room_no AND c.room_no=1 AND c.sender=r.id ORDER BY chat_no DESC;

SELECT join_date FROM room WHERE id='a' AND room_no=1;


SELECT rownum, a.*
FROM (SELECT * FROM chat WHERE room_no=1 ORDER BY chat_no DESC) a
WHERE rownum <= 20 ORDER BY chat_no ASC


SELECT rownum, a.*
FROM (SELECT * FROM chat c, room r WHERE c.room_no=r.room_no AND c.room_no=1 AND c.sender=r.id ORDER BY chat_no DESC) a
WHERE  a.send_time > (SELECT join_date FROM room WHERE id='a' AND room_no=1) AND rownum <= 20 ORDER BY chat_no ASC;

SELECT * FROM chat c, room r WHERE c.room_no=r.room_no AND c.room_no=1 AND c.sender=r.id ORDER BY chat_no DESC;
SELECT join_date FROM room WHERE id='a' AND room_no=1;

SELECT c.*, id, room_name, join_date, leave FROM chat c, room r WHERE c.send_time > r.join_date AND c.room_no=r.room_no AND sender=id;

SELECT rownum, chat_no, room_no, room_name, sender, chat_content, send_time, read_time, read_chk
FROM (SELECT c.*, id, room_name, join_date, leave FROM chat c, room r WHERE c.send_time > (SELECT join_date from room where id=#{id} AND room_no=#{room_no}) AND c.room_no=r.room_no AND sender=id  AND c.room_no=5 ORDER BY c.chat_no DESC) a
WHERE rownum <= 20 ORDER BY chat_no ASC;


SELECT TO_CHAR(sysdate, 'YYYYMMddHH24MISS') FROM dual;

SELECT sender, TO_CHAR(send_time, 'YYYYMMddHH24MISS') FROM chat;

SELECT c.*, id, room_name, join_date, leave FROM chat c, room r WHERE TO_CHAR(c.send_time, 'YYYYMMddHH24MISS') > TO_CHAR((SELECT join_date from room where id='c' AND room_no=5) , 'YYYYMMddHH24MISS') AND c.room_no=r.room_no AND sender=id  AND c.room_no=5 ORDER BY c.chat_no DESC

SELECT join_date from room where id='c' AND room_no=5;

(SELECT join_date from room where id='c' AND room_no=5)

SELECT c.*, id, room_name, join_date, leave FROM chat c, room r WHERE TO_CHAR(c.send_time, 'YYYYMMddHH24MISS') > TO_CHAR((SELECT join_date from room where id='c' AND room_no=5) , 'YYYYMMddHH24MISS') AND c.room_no=r.room_no AND sender=id  AND c.room_no=5 ORDER BY c.chat_no DESC

SELECT c.*, id, room_name, join_date, leave FROM chat c, room r WHERE c.send_time > (SELECT join_date from room where id=#{id} AND room_no=#{room_no}) AND c.room_no=r.room_no AND sender=id  AND c.room_no=5 ORDER BY c.chat_no DESC

SELECT c.*, id, room_name, join_date, leave FROM chat c, room r WHERE c.send_time > (SELECT join_date from room where id='c' AND room_no=5) AND c.room_no=r.room_no AND sender=id  AND c.room_no=5 ORDER BY c.chat_no DESC;

SELECT rownum, chat_no, room_no, room_name, sender, chat_content, send_time, read_time, read_chk
FROM (SELECT c.*, id, room_name, join_date, leave FROM chat c, room r WHERE c.send_time > (SELECT join_date from room where id=#{id} AND room_no=#{room_no}) AND c.room_no=r.room_no AND sender=id  AND c.room_no=#{room_no} ORDER BY c.chat_no DESC) a
WHERE rownum <= 20 ORDER BY chat_no ASC;

SELECT * FROM member;

SELECT * FROM (SELECT rowNum rn, a.* FROM (SELECT * FROM inquiry WHERE reply='n' ORDER BY inquiry_no DESC)a) WHERE rn BETWEEN 1 AND 10;

SELECT * from inquiry;

SELECT * FROM community;

DELETE FROM member WHERE id='b';

UPDATE member set email='test4@test4.com' WHERE id='test4';

SELECT * FROM room;

SELECT count(*) FROM room WHERE id='a' AND room_no=15; 

UPDATE room SET leave='n' WHERE room_no=14 AND id='a';

DELETE FROM community;

DELETE FROM room WHERE room_no in (4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14);
DELETE FROM chat WHERE room_no in (4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14);

SELECT * FROM community c, room r WHERE c.room_no=r.room_no AND c.host_id=r.id AND leave='n' ORDER BY community_no DESC;

SELECT * FROM room WHERE id = 'test2' and leave='n';

SELECT MAX(sender) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS sender, c.room_no, MAX(chat_content) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS chat_content, MAX(send_time) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS send_time
			FROM chat c, room r
			WHERE c.room_no = r.room_no AND r.id='test1' AND r.leave='n'
			GROUP BY c.room_no
			ORDER BY send_time DESC;

select * from chat WHERE room_no=5;


SELECT * FROM chat WHERE room_no=5;

SELECT MAX(sender) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS sender, c.room_no, MAX(chat_content) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS chat_content, MAX(send_time) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS send_time
			FROM chat c, room r
			WHERE c.room_no = r.room_no AND r.id='test1' AND r.leave='n' AND c.send_time > (SELECT r.join_date from chat c, room r where id='test1' AND c.room_no = r.room_no)
			GROUP BY c.room_no
			ORDER BY send_time DESC;

SELECT MAX(sender) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS sender, c.room_no, MAX(chat_content) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS chat_content, MAX(send_time) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS send_time
			FROM chat c, room r
			WHERE c.room_no = r.room_no AND r.id='test1' AND r.leave='n' AND c.send_time > (SELECT join_date from room where id='test1' AND room_no=5)
			GROUP BY c.room_no
			ORDER BY send_time DESC;

SELECT * from chat c, room r where id='a' AND c.room_no = r.room_no;


SELECT MAX(sender) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS sender, c.room_no, MAX(chat_content) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS chat_content, MAX(send_time) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS send_time
			FROM chat c, room r
			WHERE c.room_no = r.room_no AND r.id='test1' AND r.leave='n' AND c.send_time > (SELECT r.join_date from chat c, room r where id='test1' AND c.room_no = r.room_no)
			GROUP BY c.room_no
			ORDER BY send_time DESC;

SELECT room_no FROM room WHERE id='test1' AND leave='n';

SELECT send_time, r.room_no, room_name, chat_content FROM room r, chat c WHERE r.room_no = c.room_no AND r.room_no=5 AND id='test1' AND c.send_time > (SELECT join_date from room where id='test1' AND room_no=5);

SELECT MAX(sender) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS sender, c.room_no, MAX(chat_content) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS chat_content, MAX(send_time) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS send_time
			FROM chat c, room r
			WHERE c.room_no = r.room_no AND c.room_no=5 AND r.leave='n' AND c.send_time > (SELECT join_date from room where id='test1' AND room_no=5)
			GROUP BY c.room_no
			ORDER BY send_time DESC;

SELECT MAX(sender) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS sender, room_no, MAX(chat_content) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS chat_content, MAX(send_time) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS send_time
	from chat where room_no=5 GROUP BY room_no;




SELECT MAX(sender) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS sender, c.room_no, MAX(chat_content) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS chat_content, MAX(send_time) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS send_time
			FROM chat c, room r
			WHERE c.room_no = r.room_no AND r.id='test1' AND r.leave='n'
			GROUP BY c.room_no
			ORDER BY send_time DESC;

SELECT MAX(sender) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS sender, c.room_no, MAX(chat_content) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS chat_content, MAX(send_time) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS send_time
			FROM chat c, room r
			WHERE c.room_no = r.room_no AND c.room_no=5 AND r.leave='n' AND c.send_time > (SELECT join_date from room where id='test1' AND room_no=5)
			GROUP BY c.room_no
			ORDER BY send_time DESC;


SELECT room_name FROM room WHERE room_no=5 AND id='a';

SELECT MAX(sender) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS sender, c.room_no, MAX(chat_content) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS chat_content, MAX(send_time) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS send_time
			FROM chat c, room r
			WHERE c.room_no = r.room_no AND c.room_no=13 AND r.leave='n' AND c.send_time > (SELECT join_date from room where id='a' AND room_no=13)
			GROUP BY c.room_no
			ORDER BY send_time DESC;


SELECT room_no FROM room WHERE id='a' AND leave='n'

SELECT COUNT(*) FROM chat WHERE room_no=5;

SELECT * FROM community;


SELECT * FROM chat;

SELECT * FROM room;

SELECT rownum, chat_no, room_no, room_name, sender, chat_content, send_time, read_time, read_chk
			FROM (SELECT c.*, id, room_name, join_date, leave FROM chat c, room r WHERE c.send_time >
				(SELECT join_date from room where id='a' AND room_no=4)
				AND c.room_no=r.room_no AND r.room_no=4 AND id='a' ORDER BY c.chat_no DESC) a
			WHERE rownum <= 20 ORDER BY chat_no ASC;


SELECT join_date from room WHERE room_no=13;


SELECT * FROM room;


SELECT c.*, id, room_name, join_date, leave FROM chat c, room r
	WHERE c.send_time > (SELECT join_date from room where id='a' AND room_no=4)
	AND c.room_no=r.room_no AND r.room_no=4 AND id='a' ORDER BY c.chat_no DESC;

SELECT * FROM chat;

SELECT * FROM community;

DELETE FROM community;

DELETE FROM chat WHERE chat_no > 299;

SELECT COUNT(*) FROM chat WHERE room_no=5 AND sender='a' AND send_time > (SELECT join_date from room where id='a' AND room_no=5);

SELECT join_date from room where id='a' AND room_no=5;

SELECT * FROM room WHERE id='a' AND leave='n';

SELECT rownum, chat_no, room_no, room_name, sender, chat_content, send_time, read_time, read_chk
			FROM (SELECT c.*, id, room_name, join_date, leave FROM chat c, room r WHERE c.send_time >
				(SELECT join_date from room where id='a' AND room_no=5)
				AND c.room_no=r.room_no AND r.room_no=5 AND id='a' ORDER BY c.chat_no DESC) a
			WHERE rownum <= 20 ORDER BY chat_no ASC;


SELECT c.room_no, MAX(send_time) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS send_time
	FROM room r, chat c
	WHERE r.room_no=c.room_no AND id='a' AND leave='n'
	GROUP BY c.room_no
	ORDER BY send_time DESC;


SELECt * FROM room;

SELECT * FROM room r, chat c WHERE r.room_no=c.room_no AND id='test1';

SELECT c.room_no, MAX(send_time) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS send_time
			FROM chat c, room r
			WHERE c.room_no = r.room_no AND c.room_no=5 AND r.leave='n' AND c.send_time > (SELECT join_date FROM room WHERE id='test1' AND room_no=5)
			GROUP BY c.room_no
			ORDER BY send_time DESC;

SELECT c.* FROM chat c, room r WHERE c.room_no = r.room_no AND id='test1' AND sender != 'test1' AND r.room_no=5 AND c.send_time > (SELECT check_time FROM room WHERE id='test1' AND room_no=5);

(SELECT check_time FROM room WHERE id='a');
SELECT check_time FROM room WHERE id='a' AND room_no=5;

SELECT c.* FROM chat c, room r WHERE c.room_no = r.room_no AND id='a' AND r.room_no=5;


SELECT COUNT(*) FROM chat c, room r WHERE c.room_no = r.room_no AND id='test1' AND sender != 'test1' AND r.room_no=5 AND c.send_time > (SELECT check_time FROM room WHERE id='test1' AND room_no=5);

SELECT * FROM chat;

SELECT *
	 		FROM chat c, room r
	 		WHERE c.room_no = r.room_no AND id='b' AND sender!='b' AND r.room_no=4
	 			AND c.send_time > (SELECT check_time FROM room WHERE id='b' AND room_no=4);

SELECT COUNT(*)
	 		FROM chat c, room r
	 		WHERE c.room_no = r.room_no AND id='a' AND sender!='a' AND r.room_no=#{room_no}
	 			AND c.send_time > (SELECT check_time FROM room WHERE id=#{id} AND room_no=#{room_no});


SELECT * FROM deal;

SELECT * FROM book;

SELECT * FROM delivery;

SELECT * FROM used;

INSERT INTO used VALUES (1, 1, '수면 아래 팝니다!!', '싸게 팝니다 사가세요~~~!!', 'newBook1.jpg', 7000, 'n', 'n', sysdate, 'b');

INSERT INTO delivery VALUES (1, 'd1', 'adr1', 'subadr1', '01011112222', 'rec1');
INSERT INTO delivery VALUES (2, 'd1', 'adr2', 'subadr2', '01011113333', 'rec1');

INSERT INTO deal VALUES (1, 1, 1, 'a', '', '', 1, TO_DATE('2022-10-13', 'YYYY--MM-DD'), 13500, 1, 'n', 'n');
INSERT INTO deal VALUES (2, 2, 1, 'c', 1, 'b', '', TO_DATE('2022-11-01', 'YYYY--MM-DD'), 7000, 1, 'n', 'n');
INSERT INTO deal VALUES (3, 3, 13, 'a', '', '', 1, TO_DATE('2022-11-03', 'YYYY--MM-DD'), 18000, 1, 'n', 'n');
INSERT INTO deal VALUES (4, 4, 1, 'b', '', '', 2, TO_DATE('2022-11-09', 'YYYY--MM-DD'), 13500, 2, 'n', 'n');
INSERT INTO deal VALUES (5, 4, 2, 'b', '', '', 2, TO_DATE('2022-11-09', 'YYYY--MM-DD'), 16000, 1, 'n', 'n');
INSERT INTO deal VALUES (6, 5, 2, 'a', '', '', 1, TO_DATE('2022-11-10', 'YYYY--MM-DD'), 16000, 1, 'n', 'n');


DELETE FROM deal;
DELETE FROM delivery;


insert into delivery values (delivery_no.nextval, 'a', '김철수', '010-6203-8888', '', '', '서울시 홍천읍 이리디', '21아3', '', '로젠택배', '부재 시, 경비실에 맡겨주세요', '2022-09-13', 'y', 'n');
insert into delivery values (delivery_no.nextval, 'a', '이하늘', '010-6203-8888', '', '', '서울시 강남구 역삼로', '2', '', '경동택배', '부재 시, 경비실에 맡겨주세요', '2022-09-30', 'n', 'n');



-- 일별 전체 행 수 확인 (mybatis)
SELECT COUNT(DISTINCT TO_CHAR(deal_date, 'YYYYMMDD')) AS getTotal
FROM deal d, book b
WHERE deal_date >= TO_CHAR(#{dateFrom}, 'YYYYMMDD')
	AND deal_date < TO_CHAR(#{dateTo}+1, 'YYYYMMDD')
	AND d.book_no=b.book_no
	AND book_kind=#{book_kind}

-- 주별 전체 행 수 확인 (mybatis)
SELECT COUNT(DISTINCT TRUNC(deal_date, 'IW')) AS getTotal
FROM deal d, book b
WHERE deal_date >= TO_CHAR(#{dateFrom}, 'YYYYMMDD')
	AND deal_date < TO_CHAR(#{dateTo}+1, 'YYYYMMDD')
	AND d.book_no=b.book_no
	AND book_kind=#{book_kind}

-- 월별 전체 행 수 확인 (mybatis)
SELECT COUNT(DISTINCT TO_CHAR(deal_date, 'YYYYMM')) AS getTotal
FROM deal d, book b
WHERE deal_date >= TO_CHAR(#{dateFrom}, 'YYYYMMDD')
	AND deal_date < TO_CHAR(#{dateTo}+1, 'YYYYMMDD')
	AND d.book_no=b.book_no
	AND book_kind=#{book_kind}

-- 일별 KPI 조회 (mybatis)
SELECT *
FROM (SELECT rowNum rn, a.*
	FROM (SELECT TO_CHAR(deal_date, 'YYYYMMDD') AS s_date, SUM(deal_price * deal_count) AS total_sales
		FROM deal d, book b
		WHERE deal_date >= TO_CHAR(#{dateFrom}, 'YYYYMMDD')
			AND deal_date < TO_CHAR(#{dateTo}+1, 'YYYYMMDD')
			AND d.book_no=b.book_no
			AND book_kind=#{book_kind}
		GROUP BY TO_CHAR(deal_date, 'YYYYMMDD')
		ORDER BY TO_CHAR(deal_date, 'YYYYMMDD'))a)
WHERE rn BETWEEN #{startRow} and #{endRow}

-- 주별 KPI 조회 (mybatis)
SELECT *
FROM (SELECT rowNum rn, a.*
	FROM (SELECT TO_CHAR(TRUNC(deal_date, 'IW'), 'YYYYMMDD') AS s_date, TO_CHAR(TRUNC(deal_date, 'IW' + 6), 'YYYYMMDD') AS w_date, SUM(deal_price * deal_count) AS total_sales
			FROM deal d, book b
			WHERE deal_date >= TO_CHAR(#{dateFrom}, 'YYYYMMDD')
				AND deal_date < TO_CHAR(#{dateTo}+1, 'YYYYMMDD')
				AND d.book_no=b.book_no
				AND book_kind=#{book_kind}
			GROUP BY TRUNC(deal_date, 'IW'), TRUNC(deal_date, 'IW') + 6
			ORDER BY TRUNC(deal_date, 'IW'))a)
WHERE rn BETWEEN #{startRow} and #{endRow}

-- 월별 KPI 조회 (mybatis)
SELECT *
FROM (SELECT rowNum rn, a.* FROM
		(SELECT TO_CHAR(deal_date, 'YYYYMM') AS s_date, SUM(deal_price * deal_count) AS total_sales
		FROM deal d, book b
		WHERE deal_date >= TO_CHAR(#{dateFrom}, 'YYYYMMDD')
			AND deal_date < TO_CHAR(#{dateTo}+1, 'YYYYMMDD')
			AND d.book_no=b.book_no
			AND book_kind=#{book_kind}
		GROUP BY TO_CHAR(deal_date, 'YYYYMM')
		ORDER BY TO_CHAR(deal_date, 'YYYYMM'))a)
WHERE rn BETWEEN #{startRow} and #{endRow}


-- 판매순위 전체 행 수 확인
SELECT COUNT(DISTINCT b.book_no) AS getTotal
FROM deal d, book b
WHERE deal_date >= '20221001'
	AND deal_date < '20221114'
	AND d.book_no=b.book_no
	AND book_kind='문학';


-- 판매순위 전체 행 수 확인 (mybats)
SELECT COUNT(DISTINCT b.book_no) AS getTotal
FROM deal d, book b
WHERE deal_date >= TO_CHAR(#{dateFrom}, 'YYYYMMDD')
	AND deal_date < TO_CHAR(#{dateTo}+1, 'YYYYMMDD')
	AND d.book_no=b.book_no
	AND book_kind=#{book_kind}


-- 판매 순위
SELECT *
FROM (SELECT rowNum rn, a.*
	FROM (SELECT b.book_no, book_title, book_kind, book_author, book_publisher, book_publish_date, sum(deal_count) deal_count, sum(deal_price) deal_price
		FROM book b, deal d
		WHERE b.book_no=d.book_no
			AND used_no is null
			AND deal_date >= '20221001'
			AND deal_date < '20221114'
			AND book_kind='문학'
		GROUP BY b.book_no, book_title, book_kind, book_author, book_publisher, book_publish_date
		ORDER BY deal_count DESC)a)
WHERE rn BETWEEN 1 and 10;

-- 판매 순위 (mybats)
SELECT *
FROM (SELECT rowNum rn, a.*
	FROM (SELECT b.book_no, book_title, book_kind, book_author, book_publisher, book_publish_date, sum(deal_count) deal_count, sum(deal_price) deal_price
		FROM book b, deal d
		WHERE b.book_no=d.book_no
			AND used_no is null
			AND deal_date >= TO_CHAR(#{dateFrom}, 'YYYYMMDD')
			AND deal_date < TO_CHAR(#{dateTo}+1, 'YYYYMMDD')
			AND book_kind=#{book_kind}
		GROUP BY b.book_no, book_title, book_kind, book_author, book_publisher, book_publish_date
		ORDER BY deal_count DESC)a)
WHERE rn BETWEEN #{startRow} AND #{endRow}


-- 작품별 구매내역 행 수 확인

SELECT COUNT(deal_no) as salesHistoryTotal
FROM book b, deal d
WHERE b.book_no=d.book_no
	AND used_no is null
	AND b.book_no=1
	AND deal_date >= '20221001'
	AND deal_date < '20221114';

-- 작품별 구매내역 행 수 확인 (mybatis)

SELECT COUNT(deal_no) as salesHistoryTotal
FROM book b, deal d
WHERE b.book_no=d.book_no
	AND used_no is null
	AND b.book_no=#{book_no}
	AND deal_date >= TO_CHAR(#{dateFrom}, 'YYYYMMDD')
	AND deal_date < TO_CHAR(#{dateTo}+1, 'YYYYMMDD')

-- 작품별 구매내역
SELECT *
FROM (SELECT rowNum rn, a.* 
		FROM (SELECT purchase_id, b.book_no, book_title, deal_no, deal_date, deal_price, deal_count, book_kind
			FROM book b, deal d
			WHERE b.book_no=d.book_no
				AND used_no is null
				AND b.book_no=1
			ORDER BY deal_date DESC)a)
WHERE rn BETWEEN 1 AND 10;


-- 작품별 구매내역 (mybatis)
SELECT *
FROM (SELECT rowNum rn, a.* 
		FROM (SELECT purchase_id, b.book_no, book_title, deal_no, deal_date, deal_price, deal_count, book_kind
			FROM book b, deal d
			WHERE b.book_no=d.book_no
				AND used_no is null
				AND b.book_no=#{book_no}
			ORDER BY deal_date DESC)a)
WHERE rn BETWEEN #{startRow} AND #{endRow}



SELECT COUNT(*)
FROM chat c, room r
WHERE c.room_no = r.room_no AND id='a' AND sender!='a' AND r.room_no=6
	AND c.send_time > (SELECT check_time FROM room WHERE id='a' AND room_no=6);


-- 주별 KPI 조회 (mybatis)
SELECT *
FROM (SELECT rowNum rn, a.*
	FROM (SELECT TO_CHAR(TRUNC(deal_date, 'IW'), 'YYYYMMDD') AS s_date, TO_CHAR(TRUNC(deal_date, 'IW')+6, 'YYYYMMDD') AS W_date, SUM(deal_price * deal_count) AS total_sales
			FROM deal d, book b
			WHERE deal_date >= TO_CHAR(#{dateFrom}, 'YYYYMMDD')
				AND deal_date < TO_CHAR(#{dateTo}+1, 'YYYYMMDD')
				AND d.book_no=b.book_no
				AND book_kind='문학'
			GROUP BY TRUNC(deal_date, 'IW')
			ORDER BY TRUNC(deal_date, 'IW'))a)
WHERE rn BETWEEN 1 and 10


SELECT TO_CHAR(TRUNC(deal_date, 'IW'), 'YYYYMMDD') AS s_date, TO_CHAR(TRUNC(deal_date, 'IW')+6, 'YYYYMMDD') AS W_date, SUM(deal_price * deal_count) AS total_sales
FROM deal d, book b
WHERE deal_date >= '20221001'
	AND deal_date < '20221130'
	AND d.book_no=b.book_no
	AND book_kind='문학'
GROUP BY TRUNC(deal_date, 'IW'), TRUNC(deal_date, 'IW')+6
ORDER BY TRUNC(deal_date, 'IW');




SELECT *
			FROM (SELECT rowNum rn, a.*
				FROM (SELECT b.book_no, book_title, book_kind, book_author, book_publisher, book_publish_date, sum(deal_count) deal_count, sum(deal_price) deal_price
					FROM book b, deal d
					WHERE b.book_no=d.book_no
						AND used_no is null
						AND deal_date >= '20221001'
						AND deal_date < '20221115'
						--AND book_kind=#{book_kind}
					GROUP BY b.book_no, book_title, book_kind, book_author, book_publisher, book_publish_date
					ORDER BY deal_count DESC)a)
			WHERE rn BETWEEN 1 and 10


SELECT * FROM inquiry;

ALTER TABLE inquiry MODIFY reply_check CHAR(1) DEFAULT 'n';

SELECT COUNT(*) FROM inquiry WHERE reply_check='n' AND id='a';


UPDATE inquiry SET reply_check='n' WHERE inquiry_no=2;


SELECT * FROM TABS;

SELECT * FROM inquiry;

CREATE TABLE inquiry(
	inquiry_no NUMBER(10) PRIMARY KEY,			--문의번호
	id VARCHAR2(20) NOT NULL,					--아이디
	category_no NUMBER(10) NOT NULL,			--카테고리번호
	inquiry_subject VARCHAR2(500) NOT NULL,		--문의제목
	inquiry_content VARCHAR2(4000) NOT NULL,	--문의내용
	reg_time DATE NOT NULL,						--문의시간
	reply CHAR(1) DEFAULT 'n',					--답변여부
	reply_content VARCHAR2(4000),				--답변내용
	reply_time DATE,							--답변시간
	reply_check CHAR(1) DEFAULT 'n',			--답변확인
	CONSTRAINT inquiry_id_fk FOREIGN KEY (id) REFERENCES member(id)
);

CREATE TABLE chat (
	chat_no NUMBER(10) PRIMARY KEY,					--메세지번호
	room_no NUMBER(10) NOT NULL,					--대화방번호
	sender VARCHAR2 (200) NOT NULL,					--발신자
	chat_content VARCHAR2 (200) NOT NULL,			--내용
	send_time DATE NOT NULL,						--발신일시
	CONSTRAINT chat_id_fk FOREIGN KEY (sender) REFERENCES member(id),
	CONSTRAINT chat_room_no_fk FOREIGN KEY (room_no) REFERENCES room(room_no)
);

CREATE TABLE room (
	room_no NUMBER(10),
	id VARCHAR2(100),
	room_name VARCHAR2(100),
	join_date DATE,
	check_time DATE,
	leave CHAR(1),
	unread NUMBER(10) DEFAULT 0,
	lastsender VARCHAR2(100),
	CONSTRAINT room_pk PRIMARY KEY(room_no, id),
	CONSTRAINT room_id_fk FOREIGN KEY (id) REFERENCES member(id)
);

CREATE TABLE community (
	community_no NUMBER(10) PRIMARY KEY,
	room_no NUMBER(10),
	host_id VARCHAR2(20),
	community_category VARCHAR2(100),
	community_subject VARCHAR2(100),
	community_content VARCHAR2(100),
	max_member NUMBER(2),
	community_gender VARCHAR2(6),
	min_age NUMBER(3),
	max_age NUMBER(3),
	community_location VARCHAR2(100),
	community_del CHAR(1),
	CONSTRAINT community_room_fk FOREIGN KEY (room_no) REFERENCES room(room_no),
	CONSTRAINT community_member_fk FOREIGN KEY (host_id) REFERENCES member(id)
);

SELECT * FROM community;



SELECT * FROM inquiry;
UPDATE inquiry SET reply='n' WHERE inquiry_no=15;

SELECT * FROM room;


SELECT lastsender FROM room WHERE room_no=6 AND lastsender IS NOT NULL GROUP BY lastsender;
UPDATE room SET lastsender='b' WHERE room_no=6;

SELECT * FROM room WHERE id='a';

UPDATE room SET lastsender=' b' WHERE room_no=4;

SELECT community_no FROM community WHERE room_no=1;

SELECT COUNT(community_no) FROM community WHERE room_no=5;


SELECT * FROM deal;

create sequence coupon_no start with 1 increment by 1;
create sequence delivery_no start with 1 increment by 1;
create sequence cart_no start with 1 increment by 1;
create sequence money_no start with 1 increment by 1;
create sequence deal_no start with 1 increment by 1;

Create table coupon(
	coupon_no	    NUMBER(10) primary key, -- 쿠폰 번호
	id              VARCHAR2(20) NOT NULL,  -- 아이디
    coupon_image    VARCHAR2(100) NOT NULL, -- 쿠폰이미지
	coupon_kind	    VARCHAR2(50) NOT NULL,  -- 쿠폰 종류
	coupon_discount NUMBER(10) NOT NULL,    -- 할인율
	coupon_situation CHAR(1) DEFAULT 'n',   -- 쿠폰 사용 예정 상태 사용x=n, 사용예정=y
    del              CHAR(1) DEFAULT 'n',   -- 쿠폰 삭제 여부 삭제x=n, 삭제o=y
    FOREIGN key (id) REFERENCES member (id)
);

SELECT * FROM delivery;

DELETE delivery;

DROP TABLE delivery;

DELETE deal;

DROP TABLE deal;

SELECT * FROM tabs;

SELECT * FROM used;

SELECT * FROM deal;

DELETE used;

DROP TABLE 

create table delivery(
    delivery_no         	NUMBER(10) primary key, -- 배송 번호
    id                      VARCHAR2(20),   -- 아이디
    delivery_name		    VARCHAR2(30),   -- 수취인 이름
    delivery_phone		    CHAR(13),   -- 받을 전화번호
    delivery_phone_sub		CHAR(13),   -- 받을 예비 전화번호
    delivery_postcode       VARCHAR2(50),   -- 우편번호
    delivery_address		VARCHAR2(50),   -- 주소
    delivery_address_detail	VARCHAR2(50),   -- 상세 주소
    delivery_address_detail_extra	VARCHAR2(50),   -- 상세 여분 주소
    delivery_kind		    VARCHAR2(30),   -- 택배 종류
    delivery_request		VARCHAR2(50),   -- 배송 요청사항
    delivery_date		    VARCHAR2(30),   -- 원하는 배송날짜
    delivery_basic          CHAR(1) DEFAULT 'n',    -- 기본배송지 선택 기본배송지=y, 여분 배송지=n
    del                     CHAR(1) DEFAULT 'n',    -- 배송지 삭제 여부 n,y
    FOREIGN key (id) REFERENCES member (id)
);

SELECT * FROM cart;

CREATE TABLE cart(
	cart_no NUMBER(10) PRIMARY KEY,		--카트번호
	book_no   NUMBER(10),				--책번호
	id   VARCHAR2(12),					--아이디
	cart_count   NUMBER(10), 			--수량
	CONSTRAINT cart_book_no_fk FOREIGN KEY (book_no) REFERENCES book(book_no),
	CONSTRAINT cart_id_fk FOREIGN KEY (id) REFERENCES member(id)
);

CREATE TABLE money (
    money_no    NUMBER(10) PRIMARY KEY, -- 머니테이블번호
    id          VARCHAR(20),    -- 아이디
    total_money NUMBER(10) default '0', -- 총 보유금
    used_money  NUMBER(10) default '0', -- 사용한 보유금
    total_mileage   NUMBER(10) default '0', -- 총 마일리지
    used_mileage    NUMBER(10) default '0', -- 사용한 마일리지
    FOREIGN KEY (id) REFERENCES member(id)
);


CREATE TABLE deal (
    deal_no 	NUMBER	(10) primary key,   -- 매매번호(한건당)
    deal_group	NUMBER	(10),   -- 번호 (한회당)
    purchase_id VARCHAR2(20),   -- 구매 아이디
    seller_id	VARCHAR2(20),   -- 판매 아이디
    book_no 	NUMBER	(10),   -- 책 번호
    used_no 	NUMBER	(10),	-- 중고글번호
    delivery_no	NUMBER	(10),   -- 배송번호
    coupon_no   NUMBER  (10),   -- 쿠폰번호
    deal_date	DATE,   -- 매매 날짜
    total_price NUMBER  (10),   -- 총 매매금
    real_price  NUMBER  (10),   -- 실제 결제 금액
    book_price	NUMBER	(10),   -- 책 가격
    deal_count	NUMBER	(10),   -- 매매수량
    purchase_list_del	CHAR	(1) default 'n',    -- 구매목록 노출 여부
    sales_list_del	CHAR	(1) default 'n',    -- 판매목록 노출 여부
    deal_situation	CHAR	(1) default 'n',    -- 배송 상태 선택 배송전 n, 배송중 d, 배송후 f
    FOREIGN KEY (book_no) REFERENCES book(book_no),
    FOREIGN KEY (purchase_id) REFERENCES member(id),
    FOREIGN KEY (delivery_no) REFERENCES delivery(delivery_no)
);

SELECT * FROM coupon;
SELECT * FROM delivery;
SELECT * FROM cart;
SELECT * FROM money;
SELECT * FROM deal;
SELECT * FROM used;

SELECT * FROM book;

DELETE FROM book WHERE book_no=51;

SELECT * FROM tabs;

SELECT * FROM like_list;

DELETE book;

DELETE like_list;

SELECT * FROM like_list
SELECT * FROM cart;
SELECT * FROM review;
DELETE review;
DELETE used;
DELETE report;

SELECT * FROM used;


CREATE TABLE like_list (
   like_no   NUMBER(10) PRIMARY KEY,      --   ȣ
   book_no   NUMBER(10),               --å  ȣ
   id   VARCHAR2(20) NOT NULL,         --   ̵ 
   used_no NUMBER(10),               -- ߰  ŷ   ȣ
   CONSTRAINT like_book_no_fk FOREIGN KEY (book_no) REFERENCES book(book_no),
   CONSTRAINT like_id_fk FOREIGN KEY (id) REFERENCES member(id),
   CONSTRAINT like_used_no_fk FOREIGN KEY (used_no) REFERENCES used(used_no)
);


CREATE TABLE cart(
   cart_no NUMBER(10) PRIMARY KEY,      --īƮ  ȣ
   book_no   NUMBER(10),            --å  ȣ
   id   VARCHAR2(12) not null,          --   ̵ 
   cart_count   NUMBER(10) not null,   --    
   CONSTRAINT cart_book_no_fk FOREIGN KEY (book_no) REFERENCES book(book_no),
   CONSTRAINT cart_id_fk FOREIGN KEY (id) REFERENCES member(id)
);






SELECT * FROM used;

SELECT * FROM room;

ALTER TABLE room ADD used_no NUMBER(10);

SELECT COUNT(*) FROM room WHERE used_no = 2 AND id = 'a'; 



