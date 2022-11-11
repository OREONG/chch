select * from tabs;

drop table like_list cascade constraint;

--member table create
create table member(
   id varchar2(20)   primary key,      --아이디
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




-- book --

	-- book 테이블 생성

DROP TABLE book;


CREATE TABLE book (
	book_no	NUMBER(10) PRIMARY KEY,			--책번호
	book_title VARCHAR2(100) NOT NULL,		--제목
	book_image VARCHAR2(100) NOT NULL,		--이미지
	book_imagedetail VARCHAR2(100) NOT NULL,--상세정보이미지
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


insert into book values((SELECT NVL(MAX(book_no), 0) + 1 FROM book),
 '수면 아래', 'newBook1.jpg', 'newBookDetail1.jpg', '이주란', '문학동네', 10, 13500, '2022-08-12', sysdate,
to_clob('<h3>한국문학의 독보적 감수성<br>
젊은작가상, 김준성문학상 수상 작가 이주란 첫 장편소설</h3>
<h3>극적인 장면 없이 고루 팽팽하고, 대단한 플롯 없이 완벽하며, 시 없이 시로 가득하고, 청승 없이 슬픔의 끝점을 보여준다._박연준(시인) </h3><br>
일상적 풍경에서 강렬한 감정의 파동을 만들어내는 독보적인 감수성으로 많은 독자들의 사랑을 받아온 이주란 소설가가 장편소설을 내놓았다. 
김준성문학상을 수상한 첫 소설집 『모두 다른 아버지』부터 젊은작가상 수상작(「넌 쉽게 말했지만」), 
김유정문학상 후보작(「한 사람을 위한 마음」) 등이 수록된 두번째 소설집 『한 사람을 위한 마음』까지, 
조용한 위트와 무심한 온기, 말과 말 사이의 여백으로 정서를 전달하는 독창적인 작품세계를 구축해온 이주란 작가가 쓴 첫 장편소설이다.<br><br>') 
|| to_clob('2021년 [주간 문학동네] 연재를 통해 독자들에 먼저 선보인 뒤 세심한 퇴고 과정을 거쳐 출간된 『수면 아래』는 
어린 시절부터 평생을 함께해오다 결혼한 두 사람이 아이를 잃는 커다란 상실을 겪은 뒤 다시 삶을 회복해나가는 과정을 그린 작품이다. 
두 사람은 감당할 수 없는 아픔에 이혼을 택했지만, 완전히 이별하지는 못한 채 가까운 곳에서 일상을 나누며 살아간다. 
서로를 아끼는 마음을 가지고 있지만 고통스러운 기억을 공유한 두 사람이 새로운 관계를 만들어나가며 일상을 통해 세상을 받아들이는 과정은 
잔잔하지만 널리 퍼지는 수중의 파동처럼 깊은 감동을 자아낸다.'),
'문학', 'n');

insert into book values((SELECT NVL(MAX(book_no), 0) + 1 FROM book), 
'덕다이브', 'newBook2.jpg', 'newBookDetail2.jpg', '이현석', '창비', 10, 16000, '2022-08-10', sysdate,
to_clob('<h3>“묵묵하게 헤엄쳐 그를 구하고, 스스로를 구할 것이다.<br>
설령 또 실패한다고 하더라도 몇번이고 다시.”<br>
젊은작가상 수상 작가 이현석 첫 장편소설<br>
올여름 가장 뜨겁고도 시원한 서핑 소설!</h3><br>')
|| to_clob('동시대의 윤리와 사회문제를 치열하게 담아내면서도 엄청난 흡인력을 선사하는 작품들로 젊은작가상을 수상하는 등 
단연 주목받는 작가 이현석의 첫 장편소설 『덕다이브』가 출간되었다. 창비의 젊은 경장편 시리즈 소설Q의 열네번째 작품이다. 
코로나19가 소문으로만 들려올 무렵 발리의 한인 서핑캠프를 배경으로 하는 이번 소설은, 세차게 부서지는 파도처럼 강렬하고 온몸을 감싸는 물결처럼 섬세하다. 
마치 서핑보드에 올라선 것처럼 느끼게 하는 생생한 장면들을 따라 독자들은 바다의 정점에서 파도를 가르게 되고, 
때로는 제 몸의 몇배는 되는 파도에 휘감겨 소금물을 마시게 된다.<br><br>') 
|| to_clob('발리의 아름다운 풍경을 선명히 묘사하는 이번 작품은 동시에 혹독한 현실 역시 세밀하게 그려낸다. 
서핑과 함께 소설에서 주요 소재로 다루어지는 의료계 일터괴롭힘 문제는, 실제 의사이기도 한 작가의 서술을 통해 그 무게감을 더한다.
작가노트에서도 언급되듯, 약간의 어긋남으로도 쉽게 괴롭힘의 대상으로 만들어버리는 자본의 논리와 자기착취를 당연시하는 현실 앞에 
타인의 고통을 목도하고도 고개를 돌릴 수밖에 없는 괴로움에 대해 그려낸다. 소설은 어쩔 수 없었다는 식의 어설픈 포장이나 위로를 건네지 않는다. 
설령 늦었더라도, 이미 지나간 일이라고 할지라도 끝내 과거와 다시 마주하도록 한다. 
“너무 늦지 않기를 바라는 마음”으로 물살을 거슬러 과거를 향해 헤엄치는 주인공의 모습을 통해 
지금 이 시대에 가장 필요한 용기와 윤리에 대해 말한다.'),
'문학', 'n');
 insert into book values((SELECT NVL(MAX(book_no), 0) + 1 FROM book),
 '고양이 여관 미아키스', 'newBook3.jpg', 'newBookDetail3.jpg', '후루우치 가즈에', '하빌리스', 10, 14000, '2022-08-17', sysdate,
to_clob('<h3>“손님, 방이 준비되었습니다.”<br>
아름다운 주인과 근사한 요리가 있는 곳, 여관 미아키스<br>
그곳에 머문 손님들은 어김없이 서늘한 악몽을 겪는다!</h3><br>')
|| to_clob('아름다운 주인과 미스터리한 종업원, 근사한 아일랜드 요리가 있는 곳 여관 미아키스. 
유럽 왕후 귀족이 살 법한 고풍스러운 저택에 각기 다른 절망을 가진 이들이 홀린 듯 이끌린다. 
지도에도 나오지 않는 이곳 여관에서는 절망이 클수록, 젊고 체격이 좋을수록 환영받는다. 
하지만 미아키스 여관에 머문 대가는 만만치 않은데…. 
사람들을 홀리는 미아키스 직원들의 정체와 그들의 목적은 과연 무엇일까?<br><br>') 
|| to_clob('『고양이 여관 미아키스』는 일본 현지에서 18만 부 이상 판매된 야식 카페 시리즈 [마캉 마랑] 작가가 선보이는 다크 판타지다. 
마성의 고양이가 활약하는 달콤하고도 살벌한 이야기. 이 책을 읽고 나면 우리 곁에 있는 태평스러운 고양이들이 조금 다르게 보일 수도 있다. 
지금까지 보지 못했던 이 특별한 판타지는 올여름, 독자들에게 서늘한 감동을 선사할 것이다.'),
'문학', 'n');



	-- book 데이터 입력은 별도 sql파일

	-- book 데이터 확인

SELECT * FROM book;


-- used --

	-- used 테이블 생성

DROP TABLE used;

CREATE TABLE used (
	used_no	NUMBER(10) PRIMARY KEY,			--중고거래번호
	book_no	NUMBER(10) NOT NULL,			--책번호
	used_subject VARCHAR2(100) NOT NULL,	--제목
	used_content VARCHAR2(2000) NOT NULL,	--내용
	used_image VARCHAR2(100) NOT NULL,		--이미지
	used_price NUMBER(10) NOT NULL,			--가격
	used_status CHAR(1) DEFAULT 'n',		--판매상태
	used_del CHAR(1) DEFAULT 'n',			--삭제여부
	used_reg_date DATE NOT NULL,			--등록일시
	id VARCHAR2(20) NOT NULL,				--판매자 아이디
	CONSTRAINT used_book_no_fk FOREIGN KEY (book_no) REFERENCES book(book_no),
	CONSTRAINT used_id_fk FOREIGN KEY (id) REFERENCES member(id)
);


insert into used values((SELECT NVL(MAX(used_no), 0) + 1 FROM used),
 1,'**책 팝니다 책 상태 좋아요', '거의 새상품 입니다 연락 많이 주세요^^', 
'usedBook.jpg', 15000, 'n', 'n',sysdate, 'k1');



	-- used 데이터 확인

SELECT * FROM used;



-- review

	-- review 테이블 생성

DROP TABLE review;


CREATE TABLE review (
	review_no		NUMBER(10) primary key,		--리뷰번호
	star_rate		NUMBER(2) NOT NULL,			--별점
	review_content	VARCHAR2(1000) NOT NULL,	--내용
	review_reg_date	DATE NOT NULL,				--기입일시
	review_del		CHAR(1) NOT NULL,			--삭제여부
	id varchar2(50) NOT NULL,				--이메일
	book_no			NUMBER NOT NULL,			--책번호
	CONSTRAINT review_book_no_fk FOREIGN KEY (book_no) REFERENCES book(book_no),
	CONSTRAINT review_id_fk FOREIGN KEY (id) REFERENCES member(id)
);

	-- review 데이터 확인

SELECT * FROM review;



-- report

	-- report 테이블 생성

DROP TABLE report;

CREATE TABLE report(
	report_no NUMBER(10) PRIMARY KEY,			--독후감번호
	report_class VARCHAR2(50) NOT NULL,			--분류
	report_name	VARCHAR2(50) NOT NULL,			--책제목
	report_author VARCHAR2(50) NOT NULL,		--지은이
	report_image_name VARCHAR2(50) NOT NULL,	--이미지
	email VARCHAR2(12) NOT NULL,					--아이디
	report_date DATE  NOT NULL,					--작성일시
	report_title VARCHAR2(500)  NOT NULL,		--독후감제목
	report_content VARCHAR2(4000) NOT NULL,		--내용
	del CHAR(1) DEFAULT 'N',					--삭제여부
	CONSTRAINT report_id_fk FOREIGN KEY (id) REFERENCES member(id)
);

	-- report 데이터 입력

insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), 'IT', '조코딩의 프로그래밍 입문', '조동근(조코딩)', 'programming.jpg', 'test1', sysdate, '프로그래밍 재밌어~', '재밌어 재밌어 재밌어 재밌어 재밌어 재밌어 재밌어 재밌어 재밌어 재밌어 재밌어 재밌어 재밌어 재밌어 재밌어 재밌어 재밌어 재밌어 재밌어 재밌어 재밌어 재밌어 재밌어 재밌어', 'n');
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), '문학', '청산별곡', '김성복', 'poem.jpg', 'test1', sysdate, '얄리얄리', '살어리 살어리랏다 쳥산(靑山)애 살어리랏다 멀위랑 다래랑 먹고 쳥산(靑山)애 살어리랏다 얄리얄리 얄랑셩 얄라리 얄라', 'n');
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), '과학', '직감하는 양자역학', '마쓰우라 소', 'quantum.jpg', 'test1', sysdate, '양자역학 어려워', '양자역학은 분자, 원자, 전자, 소립자 등 미시적인 계의 현상을 다루는 즉, 작은 크기를 갖는 계의 현상을 연구하는 물리학의 분야이다.', 'n');
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), '경제', '깨진 유리창 법칙 ', '마이클 레빈', 'glass.jpg', 'test1', sysdate, '고등학생때 배웠던 것', '깨진 유리창 하나를 방치해 두면, 그 지점을 중심으로 범죄가 확산되기 시작한다는 이론으로, 사소한 무질서를 방치하면 큰 문제로 이어질 가능성이 높다는 의미', 'n');
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), 'IT', '모두의 깃&깃허브', '강민철', 'git.jpg', 'test1', sysdate, '깃 너무 어렵다', '그치만 깃을 안쓰는게 더 어렵다.. 다음 프로젝트 부터는 꼭 깃 써야지!!!', 'n');
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), '문학', '나미야 잡화점의 기적 ', '히가시노 게이고', 'namiya.jpg', 'test1', sysdate, '이제 난 나미야', '정말 남이야(남~이야)', 'n');
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), '과학', '미움받는 식물들', '존 카디너', 'plants.jpg', 'test1', sysdate, '미운 식물은 없다', '없어없어 없어없어 없어없어 없어없어 없어없어 없어없어없어없어 없어없어 없어없어없어없어없어없어 ', 'n');
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), '경제', '트레이더 콜린 씨의 일일', '콜린 랭커스터', 'callin.jpg', 'test1', sysdate, '콜린씨는 무엇을 할까', '알려줘요 알려줘요 알려줘요 알려줘요 알려줘요 알려줘요 알려줘요 알려줘요 알려줘요 알려줘요 알려줘요 알려줘요 알려줘요 알려줘요 알려줘요 알려줘요알려줘요 알려줘요알려줘요 알려줘요', 'n');

	-- report 데이터 확인

SELECT * FROM report;



-- message

	-- message 테이블 생성

DROP TABLE message;

CREATE TABLE message (
	msg_no NUMBER(10) PRIMARY KEY,					--메세지번호
	used_no NUMBER(10) NOT NULL,					--중고거래번호
	sender VARCHAR2 (200 byte) NOT NULL,			--발신자
	receiver VARCHAR2 (200 byte) NOT NULL,			--수신자
	msg_content VARCHAR2 (200 byte) NOT NULL,		--내용
	send_time DATE NOT NULL,						--발신일시
	read_time DATE,									--확인일시
	read_chk CHAR(1) default 'n',					--확인여부
	CONSTRAINT message_sender_fk FOREIGN KEY (sender) REFERENCES member(id),
	CONSTRAINT message_receiver_fk FOREIGN KEY (receiver) REFERENCES member(id),
	CONSTRAINT message_used_no_fk FOREIGN KEY (used_no) REFERENCES used(used_no)
);

	-- message 데이터 확인

SELECT * FROM message;



-- like

	-- like 테이블 생성

DROP TABLE like_list;

CREATE TABLE like_list (
	like_no	NUMBER(10) PRIMARY KEY,		--찜번호
	book_no	NUMBER(10),					--책번호
	id	VARCHAR2(20) NOT NULL,			--아이디
	used_no NUMBER(10),					--중고거래번호
	CONSTRAINT like_book_no_fk FOREIGN KEY (book_no) REFERENCES book(book_no),
	CONSTRAINT like_id_fk FOREIGN KEY (id) REFERENCES member(id),
	CONSTRAINT like_used_no_fk FOREIGN KEY (used_no) REFERENCES used(used_no)
);

--중고책 찜 추가
insert into like_list values((SELECT NVL(MAX(like_no), 0) + 1 FROM like_list), 
1, 'k1', 1);

--새책 찜 추가
insert into like_list values ((select nvl(max(like_no), 0) + 1 from like_list), 2, 'k1', '');



--새책 찜목록 조회
 select * from like_list l left outer join book b on(l.book_no= b.book_no) where id='k1' and used_no is null

--중고 찜목록 조회
select * from like_list l left outer join (select * from used u left outer join book b on(u.book_no= b.book_no)) a  on(l.used_no= a.used_no)
		where l.id='k1'and a.used_no is not null


--찜목록 삭제
delete from like_list where like_no = 4 and id ='k1'


	-- like 데이터 확인

SELECT * FROM like_list;


select * from like_list where id ='k1';




-- delivery

	-- delivery 테이블 생성

DROP TABLE delivery;

CREATE TABLE delivery (
	delivery_no NUMBER(10) PRIMARY KEY,					--배송번호
	delivery_kind VARCHAR2(30),							--배송방법
	delivery_address VARCHAR2(50) NOT NULL, 			--배송주소
	delivery_address_detail VARCHAR2(50) NOT NULL,		--배송상세주소
	delivery_tel CHAR(13),								--배송전화번호
	delivery_recieve VARCHAR2(30)						--배송받는위치
);

insert into delivery values((SELECT NVL(MAX(delivery_no), 0) + 1 FROM delivery),
 '택배', '서울시 강남구', '중앙정보처리 학원', '010-1111-2222','책상위');


	-- delivery 데이터 확인

SELECT * FROM trans;



-- deal

DROP TABLE deal;

CREATE TABLE deal (
	deal_no NUMBER(10) PRIMARY KEY,				--거래번호
	deal_group NUMBER(10) NOT NULL,				--거래그룹번호
	book_no NUMBER(10) NOT NULL,				--책번호
	purchase_id VARCHAR2(20) NOT NULL,			--구매자아이디
	used_no NUMBER(10),							--중고거래번호
	seller_id VARCHAR2(20),						--판매자아이디
	delivery_no NUMBER(10),						--배송번호
	deal_date DATE DEFAULT sysdate,				--거래일시
	deal_price NUMBER(10) NOT NULL,				--거래가격
	deal_count NUMBER(10) NOT NULL,				--수량
	purchase_list_del CHAR(1) DEFAULT 'n',		--판매목록노출여부
	sales_list_del CHAR(1) DEFAULT 'n',			--구매목록노출여부
	CONSTRAINT deal_book_no_fk FOREIGN KEY (book_no) REFERENCES book(book_no),
	CONSTRAINT deal_purchase_id_fk FOREIGN KEY (purchase_id) REFERENCES member(id),
	CONSTRAINT deal_used_no_fk FOREIGN KEY (used_no) REFERENCES used(used_no),
	CONSTRAINT deal_seller_id_fk FOREIGN KEY (seller_id) REFERENCES member(id),
	CONSTRAINT deal_delivery_no_fk FOREIGN KEY (delivery_no) REFERENCES delivery(delivery_no)
);

	-- deal 데이터 확인
insert into deal values((SELECT NVL(MAX(deal_no), 0) + 1 FROM deal),
 1, 1, 'k1', 1, 'k2',1, sysdate,18000,3, 'n', 'n');

SELECT * FROM deal;
--구매목록 확인
select distinct deal_no,b.book_no,b.book_image,b.book_title,
		b.book_author,d.deal_count,d.deal_Date,u.used_subject,d.deal_price,d.used_no,d.book_no
		from deal d,book b,used u
	    where d.book_no = b.book_no 
		and d.purchase_id ='k1' and d.purchase_list_del ='n' 
		order by deal_date desc
--판매목록 확인
select d.deal_no,b.book_image,b.book_title,d.deal_price,d.deal_count,d.used_no,
		d.deal_date,b.book_author,u.used_subject
		from deal d,book b,used u
		where d.book_no = b.book_no and d.used_no = u.used_no
		and d.seller_id = 'k1' and d.used_no is not null and d.sales_list_del ='n'
		order by deal_date desc
--판매목록에서 삭제 눌렀을때 update시키기
update deal set sales_list_del ='n' where seller_id='k1' and deal_no=2;



-- cart

	-- cart 테이블 생성

DROP TABLE cart;

CREATE TABLE cart(
	cart_no NUMBER(10) PRIMARY KEY,		--카트번호
	book_no   NUMBER(10),				--책번호
	id   VARCHAR2(12) not null,		    --아이디
	cart_count   NUMBER(10) not null,   --수량
	CONSTRAINT cart_book_no_fk FOREIGN KEY (book_no) REFERENCES book(book_no),
	CONSTRAINT cart_id_fk FOREIGN KEY (id) REFERENCES member(id)
);

select * from cart;
update cart set cart_count=6 where cart_no = 1;


insert into cart values((SELECT NVL(MAX(cart_no), 0) + 1 FROM cart), #{book_no},#{id},#{cart_count})

insert into cart values((SELECT NVL(MAX(cart_no), 0) + 1 FROM cart), 2, 'k1', 4); 
delete from cart where cart_no = 1 and id= 'k1'



	-- cart 데이터 확인

SELECT * FROM cart;


select * from tabs;



-- inquiry

	-- inquiry 테이블 생성

DROP TABLE inquiry;

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
	CONSTRAINT inquiry_id_fk FOREIGN KEY (id) REFERENCES member(id)
);

	-- inquiry 데이터 확인

SELECT * FROM inquiry;







-- test



SELECT deal_no, d.used_no, b.book_no, book_image, book_title, book_author, deal_count, deal_Date, deal_price from deal d, book b, used u where d.book_no=b.book_no and d.book_no=u.book_no and purchase_id='test1';

SELECT deal_no, d.used_no, b.book_no, book_image, book_title, book_author, deal_count, deal_Date, deal_price from deal d, book b where d.book_no=b.book_no AND purchase_id='test1' AND d.used_no IS NULL;

SELECT deal_no, d.used_no, b.book_no, book_image, book_title, book_author, deal_count, deal_Date, deal_price from deal d, book b, used u where d.book_no=b.book_no and d.book_no=u.book_no and purchase_id='test1' UNION ALL
	SELECT deal_no, d.used_no, b.book_no, book_image, book_title, book_author, deal_count, deal_Date, deal_price from deal d, book b where d.book_no=b.book_no AND purchase_id='test1' AND d.used_no IS NULL;


select * from deal;

	
		



















select * from member;