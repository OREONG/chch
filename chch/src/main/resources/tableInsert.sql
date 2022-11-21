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
--author table create
create table author(
   author_no number(10) primary key,         --작가되기 번호
   author_subject varchar2(200) not null,      --작품 제목
   author_class varchar2(100) not null,      --작품 분류
   author_introduce varchar2(4000) not null,   --작품 소개
   id varchar2(20)   NOT NULL,               --아이디
   del CHAR(1) default 'n',               --삭제여부
   reg_date date not null,                  --등록일
   like_count number(10) default 0,         --관심 합계
   
   foreign key(id) references member(id)
);
--author_work table create
create table author_work(
   author_work_no number(10) primary key,         --작가되기 컨텐츠 번호
   author_work_subject varchar2(200) not null,      --작가되기 컨텐츠 제목      
   author_work_content varchar2(4000) not null,   --작가되기 컨텐츠 내용      
   author_work_comment   varchar2(1000),            --작가되기 컨텐츠 작가의 말         
   author_work_count number default 0,            --조회수   
   author_work_date date not null,               --작품 등록 날짜   
   author_no number(10) not null,               --작가되기 번호
   id varchar2(20)   NOT NULL,                  --아이디
   like_count number(10) default 0,            --관심 합계
   
   foreign key(author_no) references author(author_no),
   foreign key(id) references member(id)
);
--book table create
CREATE TABLE book (
   book_no   NUMBER(10) PRIMARY KEY,         --책번호
   book_title VARCHAR2(100) NOT NULL,      --제목
   book_image VARCHAR2(100) NOT NULL,      --이미지
   book_imagedetail VARCHAR2(100),         --상세이미지
   book_author VARCHAR2(50) NOT NULL,      --지은이
   book_publisher VARCHAR2(50) NOT NULL,   --출판사
   book_count NUMBER(10) NOT NULL,         --재고
   book_price NUMBER(10) NOT NULL,         --가격
   book_publish_date DATE NOT NULL,      --출판일
   book_reg_date DATE NOT NULL,         --등록일
   book_content CLOB NOT NULL,            --내용
   book_kind VARCHAR2(30) NOT NULL,      --분류
   book_del CHAR(1) DEFAULT 'n'         --삭제여부
);
--report table create
CREATE TABLE report(
   report_no number(10) primary key,       --감상문 번호   
   id varchar2(20) not null,             --아이디 
   report_date   date not null,            --감상문 날짜   
   report_title varchar2(500) not null,    --감상문 제목      
   report_content varchar2(4000) not null, --감상문 내용      
   expose char(1) default 'n',            --공개 여부
   del char(1) default 'n',             --삭제여부 
   book_no number(10) not null,         --책 번호
   
   foreign key(id) references member(id),    
   foreign key(book_no) references book(book_no)
);
--like_table table create
create table like_table(
   like_no   number(10) primary key, --찜번호
   book_no   number(10),          --책번호 fk
   id varchar2(20) not null,       --아이디fk
   used_no number(10),          --중고거래번호fk
   author_no number(10),          --작가되기 번호fk
   author_work_no number(10),       --작가되기 컨텐츠 번호fk
   review_no number(10),         --댓글 번호fk
   del char(1) default 'n',
   
   foreign key(book_no) references book(book_no),
   foreign key(id) references member(id),
   foreign key(used_no) references used(used_no),
   foreign key(author_no) references author(author_no),
   foreign key(author_work_no) references author_work(author_work_no),
   foreign key(review_no) references review(review_no)
);
--review table create
create table review(
   review_no number(10) primary key,      --댓글번호PK
   star_rate number(2),         --별점      
   review_content varchar2(1000) not null,   --내용      
   review_reg_date   date not null,         --기입일시
   review_del char(1) default 'n',         --삭제여부
   id varchar2(20)   not null,            --아이디FK
   book_no   number(10),                  --책번호FK
   author_work_no number(10),            --글 번호FK
   review_like_count number(10),
   
   foreign key(id) references member(id),
   foreign key(book_no) references book(book_no),
   foreign key(author_work_no) references author_work(author_work_no)
);

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
	id VARCHAR2(20) NOT NULL,				--이메일
	CONSTRAINT used_book_no_fk FOREIGN KEY (book_no) REFERENCES book(book_no),
	CONSTRAINT used_id_fk FOREIGN KEY (id) REFERENCES member(id)
);

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
