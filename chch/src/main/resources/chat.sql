select * from tabs;

-- chat

DROP TABLE chat;

CREATE TABLE chat (
	chat_no NUMBER(10) PRIMARY KEY,					--메세지번호
	room_no NUMBER(10) NOT NULL,					--대화방번호
	sender VARCHAR2 (200) NOT NULL,					--발신자
	chat_content VARCHAR2 (200) NOT NULL,			--내용
	send_time DATE NOT NULL,						--발신일시
	read_time DATE,									--확인일시
	read_chk CHAR(1) default 'n'					--확인여부
);

SELECT * FROM chat;


INSERT INTO chat values (1, 1, 'a', '안녕하세요~', sysdate, '', 'n');
INSERT INTO chat values (2, 1, 'b', '반갑습니다!!', sysdate, '', 'n');
INSERT INTO chat values (3, 1, 'a', '날씨가 참 좋네요~', sysdate, '', 'n');
INSERT INTO chat values (4, 1, 'b', '..??', sysdate, '', 'n');
INSERT INTO chat values (5, 1, 'a', '아, 아닙니다!! 책좀 사고싶은데요..~~!!', sysdate, '', 'n');
INSERT INTO chat values (6, 1, 'b', '네 올려놓은 가격에 팔고 있습니다', sysdate, '', 'n');
INSERT INTO chat values (7, 1, 'a', '조금 비싸서 그런데 조금만 깎아주실 수 있나요?', sysdate, '', 'n');
INSERT INTO chat values (8, 1, 'b', '네고는 받지 않습니다..', sysdate, '', 'n');
INSERT INTO chat values (9, 1, 'a', '아...', sysdate, '', 'n');
INSERT INTO chat values (10, 1, 'b', '음.. 집앞까지 오시면 차비는 빼드릴게요..', sysdate, '', 'n');
INSERT INTO chat values (11, 1, 'a', '감사합니다!!!!! 시간은 언제가 괜찮으신가요?', sysdate, '', 'n');
INSERT INTO chat values (12, 1, 'b', '평일 오후 8시 이후면 다 좋습니다', sysdate, '', 'n');
INSERT INTO chat values (13, 1, 'a', '혹시 주말에는 시간이 안되시나요?', sysdate, '', 'n');
INSERT INTO chat values (14, 1, 'b', '앗 주말은 시간이 조금 애매해요', sysdate, '', 'n');
INSERT INTO chat values (15, 1, 'b', '토요일 낮시간 밖에 안됩니다..', sysdate, '', 'n');
INSERT INTO chat values (16, 1, 'a', '이번주 토요일 1시정도에 거래 가능하실까요?', sysdate, '', 'n');
INSERT INTO chat values (17, 1, 'a', '꼭 좀 부탁드립니다!!!', sysdate, '', 'n');
INSERT INTO chat values (18, 1, 'b', '네 그럼 그때 오세요!', sysdate, '', 'n');
INSERT INTO chat values (19, 1, 'a', '감사합니다!! 당일 출발할 때 쯤 연락 한번 더 드리겠습니다', sysdate, '', 'n');
INSERT INTO chat values (20, 1, 'b', '네 알겠습니다~', sysdate, '', 'n');
INSERT INTO chat values (21, 1, 'a', '그럼 이만..', sysdate, '', 'n');
INSERT INTO chat values (22, 1, 'b', '넵 토요일에 뵙겠습니다', sysdate, '', 'n');
INSERT INTO chat values (23, 2, 'c', '안녕하세요!!!', sysdate, '', 'n');
INSERT INTO chat values (24, 2, 'c', '책 사고싶습니다~~~', sysdate, '', 'n');
INSERT INTO chat values (25, 2, 'a', '안녕하세요~~', sysdate, '', 'n');
INSERT INTO chat values (26, 2, 'c', '아직 팔고 계신거죠?', sysdate, '', 'n');
INSERT INTO chat values (27, 3, 'a', '안녕하세요~~', sysdate, '', 'n');
INSERT INTO chat values (28, 3, 'b', '하이하이', sysdate, '', 'n');
INSERT INTO chat values (29, 3, 'c', '방가방가', sysdate, '', 'n');

 
-- room

DROP TABLE room;

CREATE TABLE room (
	room_no NUMBER(10),
	id VARCHAR2(100),
	room_name VARCHAR2(100),
	join_date DATE,
	leave CHAR(1),
	CONSTRAINT room_pk PRIMARY KEY(room_no, id)
);

INSERT INTO room VALUES (1, 'a', '', sysdate, 'n');
INSERT INTO room VALUES (1, 'b', '', sysdate, 'n');
INSERT INTO room VALUES (2, 'a', '', sysdate, 'n');
INSERT INTO room VALUES (2, 'c', '', sysdate, 'n');
INSERT INTO room VALUES (3, 'a', '', sysdate, 'n');
INSERT INTO room VALUES (3, 'b', '', sysdate, 'n');
INSERT INTO room VALUES (3, 'c', '', sysdate, 'n');


SELECT * FROM room;


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
	community_del CHAR(1)--,
	--CONSTRAINT community_room_fk FOREIGN KEY (room_no) REFERENCES room(room_no),
	--CONSTRAINT community_member_fk FOREIGN KEY (host_id) REFERENCES member(id)
)

SELECT * FROM community;






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
