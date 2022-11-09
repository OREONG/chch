--나도 작가되기 데이터
insert into author values((SELECT NVL(MAX(author_no), 0) + 1 FROM author), 
'짱 쎈 드래곤'
,'기타' 
,'여러븐 재가 드디어 글을 씀니다~ 만이 봐주새요~ 내용은 최강의 드래곤인 투명드래곤이 차원이동해서.... ㅎㅎㅎ 궁금하면 보샘~'
,'test1'
,'n'
,sysdate
,0);
insert into author values((SELECT NVL(MAX(author_no), 0) + 1 FROM author), 
'밥 맛있게 먹는 법'
,'로판' 
,'밥을 맛있게 먹는 법은 무엇일까요?? 이 작품에서 확인해 보세요!밥을 맛있게 먹는 법은 무엇일까요?? 이 작품에서 확인해 보세요!밥을 맛있게 먹는 법은 무엇일까요?? 이 작품에서 확인해 보세요!'
,'test1'
,'n'
,sysdate
,0);
insert into author values((SELECT NVL(MAX(author_no), 0) + 1 FROM author), 
'넌 정말 미스터리미스터리 예'
,'미스터리' 
,'알다가도 모르는 넌! 헤이 미스터리미스테리 걸 미스테리 미스테리 예 알다가도 모르는 넌! 헤이 미스터리미스테리 걸 미스테리 미스테리 예 알다가도 모르는 넌! 헤이 미스터리미스테리 걸 미스테리 미스테리 예'
,'test2'
,'n'
,sysdate
,0);

insert into author_work values(
(SELECT NVL(MAX(author_work_no), 0) + 1 FROM author_work)
,'짱쎈 드래곤 1화 : 드래곤의 등장'
,'"크아아아아"

드래곤중에서도 최강의 투명드래곤이 울부짓었다
투명드래곤은 졸라짱쎄서 드래곤중에서 최강이엇다
신이나 마족도 이겼따 다덤벼도 이겼따 투명드래곤은
새상에서 하나였다 어쨌든 걔가 울부짓었다

"으악 제기랄 도망가자"

발록들이 도망갔다 투명드래곤이 짱이었따
그래서 발록들은 도망간 것이다

꼐속'
,'잘 부탁 함니다'
,0
,sysdate
,1
,'test1'
,0
);
insert into author_work values(
(SELECT NVL(MAX(author_work_no), 0) + 1 FROM author_work)
,'짱쎈 드래곤 2화 : 심심한 투명 드래곤'
,'투명드래곤은 심심햇다
그래서 신을죽이기로 햇다
그래서 신들은 비상이걸렸따

"씨발 투명드래곤이 쳐들어온대"

"그래 싸우자"

하지만 투명드래곤은 투명드래곤이라서 투명했따
그래서 안보여서 신들은결국 다 죽고말았따
투명드래곤은 이새계가심심해서 다른새계로
가기로하였따

꼐속'
,''
,0
,sysdate
,1
,'test1'
,0
);
insert into author_work values(
(SELECT NVL(MAX(author_work_no), 0) + 1 FROM author_work)
,'짱쎈 드래곤 3화 : 투명드래곤의 강력한 브레쓰'
,'위이이이이이이이잉
투명드레곤은 차원이동을햇다
그러자 현실새계가 나왓다

"오 조은데 심심한데 다주겨야지"

투명드래곤이 브레스를했다 그러자 아니 브레스도
안하고그냥 손에서빔을 쐈다
그거 한방에미국이 다날라갔따
졸라짱쎈 투명드래곤이었다
사람들은투명드래곤이 투명해서 누가한지도 몰랐다
투명드래곤은 또 심심해져서결국...

꼐속'
,'흐흐담편기대하샘'
,0
,sysdate
,1
,'test1'
,0
);
insert into author_work values(
(SELECT NVL(MAX(author_work_no), 0) + 1 FROM author_work)
,'공지'
,'오늘은여기까지 애요~~~
뱌뱌~~~ 낼또쓸께요~~~
아 글구여 저 첨인디 왜캐 욕만하세여...
좀 봐주샘 첨이에여~~~
글구 내글은누가출판안해가나~~~
책으로 나왔음종갰는데ㅠㅠㅠ

내일꼐속'
,''
,0
,sysdate
,1
,'test1'
,0
);
insert into author_work values(
(SELECT NVL(MAX(author_work_no), 0) + 1 FROM author_work)
,'짱쎈 드래곤 4화 : 투명 드래곤은 역시 짱 쎄다'
,'그때엿다

"본부나와라 오바 투명드래곤을쏘겟다"

쓩쓩쓩쓩쓩

전투기가날라와서 투명드래곤을 미사일쌌다
근대 투명드래곤은 투명해서 안보여서 그래서 안맞앗다
한두대쯤맞았는데 그건투명드래곤 간지럽히기도 안됬다

"푸하하 코딱지만도 못한것드라 잘가라 케케"

투명드래곤이 해서 전투기들은 0.001초만애 존나몰살당했따
진짜 짱이였다

꼐속'
,''
,0
,sysdate
,1
,'test1'
,0
);
insert into author_work values(
(SELECT NVL(MAX(author_work_no), 0) + 1 FROM author_work)
,'짱쎈 드래곤 6화 : 투명 드래곤은 육삼빌딩보다 커다랗다'
,'63빌딩이 잇었다 아니 100층도 넘는빌딩이 있엇다
근대 그빌딩보다 투명드래곤이더 컷다

"하하하하하하"

투명드래곤이 그 빌딩을한대치자 전부무너졌다 빌딩이 무너졌다
그래서 투명드래곤은심심해서 그거풀려고 사람들한테말했다

"이제부터 나 사람으로 변해서살테니까 날알아서모셔라"

사람들은 당근 오케이했고 투명드래곤은사람으로 변했다
짠~ 다음부터는 투명드래곤이 사람으로변해서부터 시작하는
스토리가 전개댑니다 기대하시라 짠

꼐속'
,''
,0
,sysdate
,1
,'test1'
,0
);

insert into review values(
(SELECT NVL(MAX(review_no ), 0) + 1 FROM review)
,''
,'우리집에도 드래곤 있음 ㅋ'
,sysdate
,'n'
,'test2'
,''
,1
,0
);
insert into review values(
(SELECT NVL(MAX(review_no ), 0) + 1 FROM review)
,''
,'드래곤 짱 머싯다...ㅠ'
,sysdate
,'n'
,'test3'
,''
,1
,0
);
insert into review values(
(SELECT NVL(MAX(review_no ), 0) + 1 FROM review)
,''
,'이개 말이댐?'
,sysdate
,'n'
,'test2'
,''
,1
,0
);
--여기까지 넣어주세요


select * from author_work;
delete author_work where author_work_no=7;
--독후감 데이터
insert into book values(1, '지구 끝의 온실', 'book1.jpg', '김초엽', '자이언트북스', 10, 10000, sysdate, sysdate, '안녕', '문학', 'n');
insert into book values(2, '영화를 찍으며 생각한 것', 'book2.jpg', '고레에다 히로카즈', '바다출판사', 10, 10000, sysdate, sysdate, '안녕', '문학', 'n');
insert into book values(3, 'Do it! 알고리즘 코딩 테스트', 'book3.jpg', '김종관', '이지스퍼블리싱', 10, 10000, sysdate, sysdate, '안녕', 'IT', 'n');
insert into book values(4, 'SQL로 시작하는 데이터 분석', 'book4.jpg', '캐시 타니무라', '한빛미디어', 10, 10000, sysdate, sysdate, '안녕', '문학', 'n');
insert into book values(5, '파이써닉한 파이썬을 익히는 간결한 안내서', 'book5.jpg', '데이비드M, 비블리', '프로그래밍 인사이트', 10, 10000, sysdate, sysdate, '안녕', '문학', 'n');



--회원 테이블
--member table create
create table member(
	id varchar2(30)	primary key,		--아이디
	email varchar2(50) not null,		--이메일
	password varchar2(100) not null,	--비밀번호(암호화)
	fileName varchar2(200),				--사진
	name varchar2(30),					--이름
	birth date,							--생년월일
	gender varchar2(6),					--성별(남성, 여성)
	phone char(11),						--휴대전화(01011112222)
	reg_date date,						--가입일
	del char(1) default 'n'				--탈퇴여부
);

drop table member CASCADE CONSTRAINTS;
select * from member;
--값 하나 삭제
DELETE FROM member WHERE id='test10';
--컬럼 추가
ALTER TABLE member ADD gender varchar2(6);
--컬럼 데이터형 변경
ALTER TABLE member MODIFY id varchar2(30);
--컬럼 이름 변경
ALTER TABLE member RENAME COLUMN imageName TO fileName;
ALTER TABLE member MODIFY gender varchar2(6);
update member set del='n' where id='test1';
--컬럼 삭제
ALTER TABLE author DROP COLUMN author_image;


select to_char(reg_date, 'YYYY-MM-DD') from member;
select id, email, password, fileName, name, birth, gender, phone, to_char(reg_date, 'YYYY-MM-DD') birth2, del from member where id='test1';


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





--책 테이블
--book table create
CREATE TABLE book (
	book_no	NUMBER(10) PRIMARY KEY,			--책번호
	book_title VARCHAR2(100) NOT NULL,		--제목
	book_image VARCHAR2(100) NOT NULL,		--이미지
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

insert into book values(1, '지구 끝의 온실', 'book1.jpg', '김초엽', '자이언트북스', 10, 10000, sysdate, sysdate, '안녕', '문학', 'n');
insert into book values(2, '영화를 찍으며 생각한 것', 'book2.jpg', '고레에다 히로카즈', '바다출판사', 10, 10000, sysdate, sysdate, '안녕', '문학', 'n');
insert into book values(3, 'Do it! 알고리즘 코딩 테스트', 'book3.jpg', '김종관', '이지스퍼블리싱', 10, 10000, sysdate, sysdate, '안녕', 'IT', 'n');
insert into book values(4, 'SQL로 시작하는 데이터 분석', 'book4.jpg', '캐시 타니무라', '한빛미디어', 10, 10000, sysdate, sysdate, '안녕', '문학', 'n');
insert into book values(5, '파이써닉한 파이썬을 익히는 간결한 안내서', 'book5.jpg', '데이비드M, 비블리', '프로그래밍 인사이트', 10, 10000, sysdate, sysdate, '안녕', '문학', 'n');

select * from book;
drop table book CASCADE CONSTRAINTS;
delete from book where book_no=6;


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
drop table review CASCADE CONSTRAINTS;







