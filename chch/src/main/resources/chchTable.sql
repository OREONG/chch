SELECT * FROM tabs
SELECT * FROM member;
SELECT * FROM book
SELECT * FROM cart

DROP TABLE member;


--member table create
create table member(
   id varchar2(30)   primary key,      --아이디
   email varchar2(50) not null,      --이메일
   password varchar2(100) not null,   --비밀번호(암호화)
   fileName varchar2(200),            --사진
   name varchar2(30),               --이름
   birth date,                     --생년월일
   gender varchar2(6),               --성별(남성, 여성)
   phone char(11),                  --휴대전화(01011112222)
   reg_date date,                  --가입일
   del char(1) default 'n'            --탈퇴여부
);

select * from member;


--book table create
CREATE TABLE book (
	book_no	NUMBER(10) PRIMARY KEY,			--책번호
	book_title VARCHAR2(100) NOT NULL,		--제목
	book_image VARCHAR2(100) NOT NULL,		--이미지
	book_imagedetail VARCHAR2(100),--상세정보이미지
	book_author VARCHAR2(50) NOT NULL,		--지은이
	book_publisher VARCHAR2(50) NOT NULL,	--출판사
	book_count NUMBER(10) NOT NULL,			--재고
	book_price NUMBER(10) NOT NULL,			--가격
	book_publish_date DATE NOT NULL,		--출판일
	book_reg_date DATE NOT NULL,			--등록일
	book_content CLOB NOT NULL,				--내용
	book_kind VARCHAR2(30) NOT NULL,		--분류
	book_del CHAR(1) DEFAULT 'n'			--삭제여부
);

SELECT * FROM book;


select count(*) from book;



CREATE TABLE inquiry(
	inquiry_no NUMBER(10) PRIMARY KEY,			--문의번호
	id VARCHAR2(20) NOT NULL,					--아이디
	category_no NUMBER(10) NOT NULL,			--카테고리번호
	inquiry_subject VARCHAR2(500) NOT NULL,		--문의제목
	inquiry_content VARCHAR2(4000) NOT NULL,	--문의내용
	reg_time DATE NOT NULL,						--문의시간
	reply CHAR(1) DEFAULT 'n',					--답변여부
	reply_content VARCHAR2(4000),				--답변내용
	reply_time DATE--,							--답변시간
	--CONSTRAINT inquiry_id_fk FOREIGN KEY (id) REFERENCES member(id)
);

INSERT INTO inquiry VALUES (1, 'a', 2, '모바일에서 접속불가', '모바일에서 접속이 되지 않습니다. 해결해주세요!!', sysdate, 'n', '', '');





ALTER TABLE room ADD join_date DATE;

ALTER TABLE room MODIFY leave VISIBLE;

SELECT * FROM room;

SELECT * FROM community;

DELETE FROM room WHERE room_no = 4;

SELECT * FROM community c, room r WHERE c.room_no=r.room_no AND id='a' ORDER BY community_no DESC;

SELECT COUNT(*) FROM room WHERE room_no=3;


SELECT * FROM community c, room r WHERE c.room_no=r.room_no ORDER BY community_no DESC;

SELECT count(*) FROM room WHERE room_no=3 and id='c';

INSERT INTO room VALUES (#{room_no}, #{id}, #{room_name}, 'n');
-- 

SELECT r.room_name FROM room r, community c WHERE r.room_no = c.room_no AND c.host_id=r.id AND r.room_no=9;


SELECT * FROM chat;


SELECT rownum, a.* FROM (SELECT * FROM chat WHERE room_no=9 ORDER BY chat_no DESC) a WHERE rownum <= 20 ORDER BY chat_no ASC;

SELECT * FROM community;

SELECT * FROM community c, room r WHERE c.room_no=r.room_no AND c.host_id=r.id ORDER BY community_no DESC;

DELETE FROM room WHERE room_no=10;

DELETE FROM community WHERE community_no=6;

SELECT rownum, a.* FROM (SELECT * FROM chat WHERE room_no=#{room_no} ORDER BY chat_no DESC) a WHERE rownum <= 20 ORDER BY chat_no ASC

SELECT sender, room_no, MAX(chat_content) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS chat_content, MAX(send_time) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS send_time
			FROM chat
			WHERE sender='c'
			GROUP BY sender, room_no
			ORDER BY send_time DESC;

SELECT MAX(sender) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS sender, c.room_no, MAX(chat_content) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS chat_content, MAX(send_time) KEEP(DENSE_RANK FIRST ORDER BY send_time DESC) AS send_time
			FROM chat c, room r
			WHERE c.room_no = r.room_no AND r.id='c'
			GROUP BY c.room_no
			ORDER BY send_time DESC;

SELECT * FROM tabs;

SELECT * FROM inquiry;



SELECT * FROM member;






