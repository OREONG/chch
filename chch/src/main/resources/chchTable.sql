SELECT * FROM tabs
SELECT * FROM member;
SELECT * FROM book
SELECT * FROM cart
SELECT * FROM used

DROP TABLE member;


delete from used where used_no=1;


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


--현주

--작품 테이블
--author table create
create table author(
	author_no number(10) primary key,			--작가되기 번호
	author_subject varchar2(200) not null,		--작품 제목
	author_class varchar2(100) not null,		--작품 분류
	author_introduce varchar2(4000) not null,	--작품 소개
	id varchar2(20)	NOT NULL,					--아이디
	del CHAR(1) default 'n',					--삭제여부
	reg_date date not null,						--등록일
	like_count number(10) default 0,			--관심 합계
	
	foreign key(id) references member(id)
);

select * from author;
drop table author CASCADE CONSTRAINTS;
ALTER TABLE author ADD reg_date date;
ALTER TABLE author ADD like_count number(10);
update author set like_count=(select count(*) from like_table where author_no=1) where author_no=1;




--글 테이블
--author_work table create
create table author_work(
	author_work_no number(10) primary key,			--작가되기 컨텐츠 번호
	author_work_subject varchar2(200) not null,		--작가되기 컨텐츠 제목		
	author_work_content varchar2(4000) not null,	--작가되기 컨텐츠 내용		
	author_work_comment	varchar2(1000),				--작가되기 컨텐츠 작가의 말			
	author_work_count number default 0,				--조회수	
	author_work_date date not null,					--작품 등록 날짜	
	author_no number(10) not null,					--작가되기 번호
	id varchar2(20)	NOT NULL,						--아이디
	like_count number(10) default 0,				--관심 합계
	
	foreign key(author_no) references author(author_no),
	foreign key(id) references member(id)
);

select * from author_work;
DELETE FROM author_work WHERE author_work_no=;
ALTER TABLE member RENAME COLUMN del TO author_work_del;
ALTER TABLE author_work DROP COLUMN author_work_del;
ALTER TABLE author_work ADD like_count number(10);
ALTER TABLE author_work
ADD CONSTRAINT fk_id foreign KEY(id) references member(id);
drop table author_work CASCADE CONSTRAINTS;







--독후감 테이블
--report table create
CREATE TABLE report(
	report_no number(10) primary key, 		--감상문 번호	
	id varchar2(20) not null, 				--아이디 
	report_date	date not null,				--감상문 날짜	
	report_title varchar2(500) not null, 	--감상문 제목		
	report_content varchar2(4000) not null, --감상문 내용		
	expose char(1) default 'n',				--공개 여부
	del char(1) default 'n', 				--삭제여부 
	book_no number(10) not null,			--책 번호
	
	foreign key(id) references member(id), 	
	foreign key(book_no) references book(book_no)
);
update report set report_title='영화', report_content='ㅇㅇㅇ', expose='y' where report_no=2;
update report set del='y';
DELETE FROM report WHERE report_no = 1;
select * from report;
select * from report r left outer join book b ON r.book_no = b.book_no where r.del='n' order by report_date desc;

select * from author a left outer join author_work aw ON a.author_no = aw.author_no where a.author_no=5
drop table report CASCADE CONSTRAINTS;

select * from(select a.*, rowNum rn from(select * from report r left outer join book b ON r.book_no = b.book_no where r.del='n' order by report_date desc) a) where rn between 1 and 4


insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), 'test1', sysdate, '지구 끝의 온실이란 뭘까?', '모르겠다 책을 안 읽어 봤다 ㅎㅎ', 'y', 'n', 1);
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), 'test1', sysdate, '영화를 찍으며 뭘 생각했을까?', '배고프다 점심 뭐먹지 오늘 밤까왔는데 이따 수경이랑 먹어야겠다', 'y', 'n', 2);
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), 'test1', sysdate, '알고리즘..', '요즘 유튜브 알고리즘에 자꾸 나는 실패작이야 쇼츠가 뜬다 그만 떴으면 좋겠는데 보다보면 또 재밌다 깔깔', 'y', 'n', 3);
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), 'test1', sysdate, '데이터 분석', '책 표지 귀엽다 무슨 새지??', 'y', 'n', 4);
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), 'test1', sysdate, '파이썬', '파이썬도 열심히 해야지..', 'y', 'n', 5);


--좋아요, 관심, 찜 테이블
--like_table table create
create table like_table(
	like_no	number(10) primary key, --찜번호
	book_no	number(10), 			--책번호 fk
	id varchar2(20) not null, 		--아이디fk
	--used_no number(10), 			--중고거래번호fk
	author_no number(10), 			--작가되기 번호fk
	author_work_no number(10), 		--작가되기 컨텐츠 번호fk
	review_no number(10),			--댓글 번호fk
	del char(1) default 'n',
	
	foreign key(book_no) references book(book_no),
	foreign key(id) references member(id),
	foreign key(author_no) references author(author_no),
	foreign key(author_work_no) references author_work(author_work_no),
	foreign key(review_no) references review(review_no)
);

select * from like_table;
select * from like_table where review_no=1;
DELETE FROM like_table WHERE review_no = 2;
drop table like_table CASCADE CONSTRAINTS;
ALTER TABLE review ADD review_like_count number(10) default 0;
ALTER TABLE like_table ADD CONSTRAINT fk_review_no foreign KEY(review_no) references review(review_no);
ALTER TABLE like_table DROP COLUMN del;

--댓글 테이블
--review table create
create table review(
	review_no number(10) primary key,		--댓글번호PK
	star_rate number(2),			--별점		
	review_content varchar2(1000) not null,	--내용		
	review_reg_date	date not null,			--기입일시
	review_del char(1) default 'n',			--삭제여부
	id varchar2(20)	not null,				--아이디FK
	book_no	number(10),						--책번호FK
	author_work_no number(10),				--글 번호FK
	review_like_count number(10),
	
	foreign key(id) references member(id),
	foreign key(book_no) references book(book_no),
	foreign key(author_work_no) references author_work(author_work_no)
);

select * from review;









