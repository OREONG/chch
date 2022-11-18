create sequence coupon_no start with 1 increment by 1;
create sequence delivery_no start with 1 increment by 1;
create sequence cart_no start with 1 increment by 1;
create sequence money_no start with 1 increment by 1;
create sequence deal_no start with 1 increment by 1;

select * from user_sequences;

select * from tabs;

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

CREATE TABLE used (
   used_no   NUMBER(10) PRIMARY KEY,         --중고거래번호
   book_no   NUMBER(10) NOT NULL,         --책번호
   used_subject VARCHAR2(100) NOT NULL,   --제목
   used_content VARCHAR2(2000) NOT NULL,   --내용
   used_image VARCHAR2(100) NOT NULL,      --이미지
   used_price NUMBER(10) NOT NULL,         --가격
   used_status CHAR(1) DEFAULT 'n',      --구매상태
   used_del CHAR(1) DEFAULT 'n',         --삭제여부
   used_reg_date DATE NOT NULL,         --등록일시
   id VARCHAR2(20) NOT NULL,            --이메일
   CONSTRAINT used_book_no_fk FOREIGN KEY (book_no) REFERENCES book(book_no),
   CONSTRAINT used_id_fk FOREIGN KEY (id) REFERENCES member(id)
);

select * from BOOK order by book_no;
select * from DEAL;
drop table money;



INSERT INTO money (money_no, id, total_money, total_mileage)VALUES (1, 'gustjwkd37', 40000, 3000);
INSERT INTO money (money_no, id, total_money, total_mileage)VALUES (2, '88bhs', 70000, 1000);

insert into used values ('1', '3', '반가워요', '쌉니다 싸요', '거의 모든 IT의 역사.jpg', '8900', 'n', 'n', sysdate, 'gustjwkd37');

INSERT INTO cart VALUES (1, 1, 'gustjwkd37', 3);
INSERT INTO cart VALUES (2, 3, 'gustjwkd37', 2);

insert into coupon values (42,'gustjwkd37', '생일쿠폰.png', '생일', '10000', 'n', 'n');
insert into coupon values (coupon_no.nextval,'gustjwkd37', '감사쿠폰.png', '감사', '30000', 'n', 'n');
insert into coupon values (coupon_no.nextval, 'gustjwkd37', '대빵쿠폰.png', '짱', '1000000', 'n', 'n');
insert into coupon values (coupon_no.nextval,'gustjwkd37', 'VIP.png', 'VIP', '50000', 'n', 'n');

insert into delivery values (delivery_no.nextval, 'gustjwkd37', '김철수', '010-6203-8888', '', '', '서울시 홍천읍 이리디', '21아3', '', '로젠택배', '부재 시, 경비실에 맡겨주세요', '2022-09-13', 'y', 'n');
insert into delivery values (delivery_no.nextval, 'gustjwkd37', '이하늘', '010-6203-8888', '', '', '서울시 강남구 역삼로', '2', '', '경동택배', '부재 시, 경비실에 맡겨주세요', '2022-09-30', 'n', 'n');
