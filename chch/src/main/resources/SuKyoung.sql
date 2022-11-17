select * from tabs;

drop table like_list cascade constraint;

--member table create
create table member(
   id varchar2(20)   primary key,      --���̵�
   email varchar2(50) not null,      --�̸���
   password varchar2(100) not null,   --��й�ȣ(��ȣȭ)
   fileName varchar2(200),            --����
   name varchar2(30),               --�̸�
   birth date,                     --�������
   gender varchar2(6),               --����(����, ����)
   phone char(11),                  --�޴���ȭ(01011112222)
   reg_date date,                  --������
   del char(1) default 'n'            --Ż�𿩺�
);




-- book --

	-- book ���̺� ����

DROP TABLE book;


CREATE TABLE book (
	book_no	NUMBER(10) PRIMARY KEY,			--å��ȣ
	book_title VARCHAR2(100) NOT NULL,		--����
	book_image VARCHAR2(100) NOT NULL,		--�̹���
	book_imagedetail VARCHAR2(100) NOT NULL,--�������̹���
	book_author VARCHAR2(50) NOT NULL,		--������
	book_publisher VARCHAR2(50) NOT NULL,	--���ǻ�
	book_count NUMBER(10) NOT NULL,			--���
	book_price NUMBER(10) NOT NULL,			--����
	book_publish_date DATE NOT NULL,		--������
	book_reg_date DATE NOT NULL,			--�����
	book_content CLOB NOT NULL,				--����
	book_kind VARCHAR2(30) NOT NULL,		--�з�
	book_del CHAR(1) DEFAULT 'n'			--��������
);


insert into book values((SELECT NVL(MAX(book_no), 0) + 1 FROM book),
 '���� �Ʒ�', 'newBook1.jpg', 'newBookDetail1.jpg', '���ֶ�', '���е���', 10, 13500, '2022-08-12', sysdate,
to_clob('<h3>�ѱ������� ������ ������<br>
�����۰���, ���ؼ����л� ���� �۰� ���ֶ� ù �����Ҽ�</h3>
<h3>������ ��� ���� ���� �����ϰ�, ����� �÷� ���� �Ϻ��ϸ�, �� ���� �÷� �����ϰ�, û�� ���� ������ ������ �����ش�._�ڿ���(����) </h3><br>
�ϻ��� ǳ�濡�� ������ ������ �ĵ��� ������ �������� ���������� ���� ���ڵ��� ����� �޾ƿ� ���ֶ� �Ҽ����� �����Ҽ��� �����Ҵ�. 
���ؼ����л��� ������ ù �Ҽ��� ����� �ٸ� �ƹ��������� �����۰��� ������(���� ���� ����������), 
���������л� �ĺ���(���� ����� ���� ������) ���� ���ϵ� �ι�° �Ҽ��� ���� ����� ���� ����������, 
������ ��Ʈ�� ������ �±�, ���� �� ������ �������� ������ �����ϴ� ��â���� ��ǰ���踦 �����ؿ� ���ֶ� �۰��� �� ù �����Ҽ��̴�.<br><br>') 
|| to_clob('2021�� [�ְ� ���е���] ���縦 ���� ���ڵ鿡 ���� ������ �� ������ ��� ������ ���� �Ⱓ�� ������ �Ʒ����� 
� �������� ����� �Բ��ؿ��� ��ȥ�� �� ����� ���̸� �Ҵ� Ŀ�ٶ� ����� ���� �� �ٽ� ���� ȸ���س����� ������ �׸� ��ǰ�̴�. 
�� ����� ������ �� ���� ���Ŀ� ��ȥ�� ��������, ������ �̺������� ���� ä ����� ������ �ϻ��� ������ ��ư���. 
���θ� �Ƴ��� ������ ������ ������ ���뽺���� ����� ������ �� ����� ���ο� ���踦 �������� �ϻ��� ���� ������ �޾Ƶ��̴� ������ 
���������� �θ� ������ ������ �ĵ�ó�� ���� ������ �ھƳ���.'),
'����', 'n');

insert into book values((SELECT NVL(MAX(book_no), 0) + 1 FROM book), 
'�����̺�', 'newBook2.jpg', 'newBookDetail2.jpg', '������', 'â��', 10, 16000, '2022-08-10', sysdate,
to_clob('<h3>�������ϰ� ����� �׸� ���ϰ�, �����θ� ���� ���̴�.<br>
���� �� �����Ѵٰ� �ϴ��� ����̰� �ٽ�.��<br>
�����۰��� ���� �۰� ������ ù �����Ҽ�<br>
�ÿ��� ���� �̰߰��� �ÿ��� ���� �Ҽ�!</h3><br>')
|| to_clob('���ô��� ������ ��ȸ������ ġ���ϰ� ��Ƴ��鼭�� ��û�� ���η��� �����ϴ� ��ǰ��� �����۰����� �����ϴ� �� 
�ܿ� �ָ�޴� �۰� �������� ù �����Ҽ� �������̺꡻�� �Ⱓ�Ǿ���. â���� ���� ������ �ø��� �Ҽ�Q�� ���׹�° ��ǰ�̴�. 
�ڷγ�19�� �ҹ����θ� ����� ���� �߸��� ���� ����ķ���� ������� �ϴ� �̹� �Ҽ���, ������ �μ����� �ĵ�ó�� �����ϰ� �¸��� ���δ� ����ó�� �����ϴ�. 
��ġ ���κ��忡 �ö� ��ó�� ������ �ϴ� ������ ������ ���� ���ڵ��� �ٴ��� �������� �ĵ��� ������ �ǰ�, 
���δ� �� ���� ���� �Ǵ� �ĵ��� �ְ��� �ұݹ��� ���ð� �ȴ�.<br><br>') 
|| to_clob('�߸��� �Ƹ��ٿ� ǳ���� ������ �����ϴ� �̹� ��ǰ�� ���ÿ� Ȥ���� ���� ���� �����ϰ� �׷�����. 
���ΰ� �Բ� �Ҽ����� �ֿ� ����� �ٷ������ �Ƿ�� ���ͱ����� ������, ���� �ǻ��̱⵵ �� �۰��� ������ ���� �� ���԰��� ���Ѵ�.
�۰���Ʈ������ ��޵ǵ�, �ణ�� ��߳����ε� ���� �������� ������� ���������� �ں��� ������ �ڱ����븦 �翬���ϴ� ���� �տ� 
Ÿ���� ������ ���ϰ��� ������ ���� ���ۿ� ���� ���ο� ���� �׷�����. �Ҽ��� ��¿ �� �����ٴ� ���� ��� �����̳� ���θ� �ǳ��� �ʴ´�. 
���� �ʾ�����, �̹� ������ ���̶�� ������ ���� ���ſ� �ٽ� �����ϵ��� �Ѵ�. 
���ʹ� ���� �ʱ⸦ �ٶ�� ���������� ������ �Ž��� ���Ÿ� ���� ���ġ�� ���ΰ��� ����� ���� 
���� �� �ô뿡 ���� �ʿ��� ���� ������ ���� ���Ѵ�.'),
'����', 'n');
 insert into book values((SELECT NVL(MAX(book_no), 0) + 1 FROM book),
 '������ ���� �̾�Ű��', 'newBook3.jpg', 'newBookDetail3.jpg', '�ķ��ġ ���', '�Ϻ�����', 10, 14000, '2022-08-17', sysdate,
to_clob('<h3>���մ�, ���� �غ�Ǿ����ϴ�.��<br>
�Ƹ��ٿ� ���ΰ� �ٻ��� �丮�� �ִ� ��, ���� �̾�Ű��<br>
�װ��� �ӹ� �մԵ��� ������ ������ �Ǹ��� �޴´�!</h3><br>')
|| to_clob('�Ƹ��ٿ� ���ΰ� �̽��͸��� ������, �ٻ��� ���Ϸ��� �丮�� �ִ� �� ���� �̾�Ű��. 
���� ���� ������ �� ���� ��ǳ������ ���ÿ� ���� �ٸ� ������ ���� �̵��� Ȧ�� �� �̲�����. 
�������� ������ �ʴ� �̰� ���������� ������ Ŭ����, ���� ü���� �������� ȯ���޴´�. 
������ �̾�Ű�� ������ �ӹ� �밡�� ����ġ ��������. 
������� Ȧ���� �̾�Ű�� �������� ��ü�� �׵��� ������ ���� �����ϱ�?<br><br>') 
|| to_clob('�������� ���� �̾�Ű������ �Ϻ� �������� 18�� �� �̻� �Ǹŵ� �߽� ī�� �ø��� [��Ĳ ����] �۰��� �����̴� ��ũ ��Ÿ����. 
������ �����̰� Ȱ���ϴ� �����ϰ��� ����� �̾߱�. �� å�� �а� ���� �츮 �翡 �ִ� ���򽺷��� �����̵��� ���� �ٸ��� ���� ���� �ִ�. 
���ݱ��� ���� ���ߴ� �� Ư���� ��Ÿ���� �ÿ���, ���ڵ鿡�� ������ ������ ������ ���̴�.'),
'����', 'n');



	-- book ������ �Է��� ���� sql����

	-- book ������ Ȯ��

SELECT * FROM book;


-- used --

	-- used ���̺� ����

DROP TABLE used;

CREATE TABLE used (
	used_no	NUMBER(10) PRIMARY KEY,			--�߰��ŷ���ȣ
	book_no	NUMBER(10) NOT NULL,			--å��ȣ
	used_subject VARCHAR2(100) NOT NULL,	--����
	used_content VARCHAR2(2000) NOT NULL,	--����
	used_image VARCHAR2(100) NOT NULL,		--�̹���
	used_price NUMBER(10) NOT NULL,			--����
	used_status CHAR(1) DEFAULT 'n',		--�ǸŻ���
	used_del CHAR(1) DEFAULT 'n',			--��������
	used_reg_date DATE NOT NULL,			--����Ͻ�
	id VARCHAR2(20) NOT NULL,				--�Ǹ��� ���̵�
	CONSTRAINT used_book_no_fk FOREIGN KEY (book_no) REFERENCES book(book_no),
	CONSTRAINT used_id_fk FOREIGN KEY (id) REFERENCES member(id)
);


insert into used values((SELECT NVL(MAX(used_no), 0) + 1 FROM used),
 1,'**å �˴ϴ� å ���� ���ƿ�', '���� ����ǰ �Դϴ� ���� ���� �ּ���^^', 
'usedBook.jpg', 15000, 'n', 'n',sysdate, 'k1');



	-- used ������ Ȯ��

SELECT * FROM used;



-- review

	-- review ���̺� ����

DROP TABLE review;


CREATE TABLE review (
	review_no		NUMBER(10) primary key,		--�����ȣ
	star_rate		NUMBER(2) NOT NULL,			--����
	review_content	VARCHAR2(1000) NOT NULL,	--����
	review_reg_date	DATE NOT NULL,				--�����Ͻ�
	review_del		CHAR(1) NOT NULL,			--��������
	id varchar2(50) NOT NULL,				--�̸���
	book_no			NUMBER NOT NULL,			--å��ȣ
	CONSTRAINT review_book_no_fk FOREIGN KEY (book_no) REFERENCES book(book_no),
	CONSTRAINT review_id_fk FOREIGN KEY (id) REFERENCES member(id)
);

	-- review ������ Ȯ��

SELECT * FROM review;



-- report

	-- report ���̺� ����

DROP TABLE report;

CREATE TABLE report(
	report_no NUMBER(10) PRIMARY KEY,			--���İ���ȣ
	report_class VARCHAR2(50) NOT NULL,			--�з�
	report_name	VARCHAR2(50) NOT NULL,			--å����
	report_author VARCHAR2(50) NOT NULL,		--������
	report_image_name VARCHAR2(50) NOT NULL,	--�̹���
	email VARCHAR2(12) NOT NULL,					--���̵�
	report_date DATE  NOT NULL,					--�ۼ��Ͻ�
	report_title VARCHAR2(500)  NOT NULL,		--���İ�����
	report_content VARCHAR2(4000) NOT NULL,		--����
	del CHAR(1) DEFAULT 'N',					--��������
	CONSTRAINT report_id_fk FOREIGN KEY (id) REFERENCES member(id)
);

	-- report ������ �Է�

insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), 'IT', '���ڵ��� ���α׷��� �Թ�', '������(���ڵ�)', 'programming.jpg', 'test1', sysdate, '���α׷��� ��վ�~', '��վ� ��վ� ��վ� ��վ� ��վ� ��վ� ��վ� ��վ� ��վ� ��վ� ��վ� ��վ� ��վ� ��վ� ��վ� ��վ� ��վ� ��վ� ��վ� ��վ� ��վ� ��վ� ��վ� ��վ�', 'n');
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), '����', 'û�꺰��', '�輺��', 'poem.jpg', 'test1', sysdate, '�⸮�⸮', '�� ������ ����(��ߣ)�� ������ ������ �ٷ��� �԰� ����(��ߣ)�� ������ �⸮�⸮ ����� ��� ���', 'n');
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), '����', '�����ϴ� ���ڿ���', '������� ��', 'quantum.jpg', 'test1', sysdate, '���ڿ��� �����', '���ڿ����� ����, ����, ����, �Ҹ��� �� �̽����� ���� ������ �ٷ�� ��, ���� ũ�⸦ ���� ���� ������ �����ϴ� �������� �о��̴�.', 'n');
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), '����', '���� ����â ��Ģ ', '����Ŭ ����', 'glass.jpg', 'test1', sysdate, '�����л��� ����� ��', '���� ����â �ϳ��� ��ġ�� �θ�, �� ������ �߽����� ���˰� Ȯ��Ǳ� �����Ѵٴ� �̷�����, ����� �������� ��ġ�ϸ� ū ������ �̾��� ���ɼ��� ���ٴ� �ǹ�', 'n');
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), 'IT', '����� ��&�����', '����ö', 'git.jpg', 'test1', sysdate, '�� �ʹ� ��ƴ�', '��ġ�� ���� �Ⱦ��°� �� ��ƴ�.. ���� ������Ʈ ���ʹ� �� �� �����!!!', 'n');
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), '����', '���̾� ��ȭ���� ���� ', '�����ó� ���̰�', 'namiya.jpg', 'test1', sysdate, '���� �� ���̾�', '���� ���̾�(��~�̾�)', 'n');
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), '����', '�̿�޴� �Ĺ���', '�� ī���', 'plants.jpg', 'test1', sysdate, '�̿� �Ĺ��� ����', '������� ������� ������� ������� ������� ������������� ������� ������������������� ', 'n');
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), '����', 'Ʈ���̴� �ݸ� ���� ����', '�ݸ� ��Ŀ����', 'callin.jpg', 'test1', sysdate, '�ݸ����� ������ �ұ�', '�˷���� �˷���� �˷���� �˷���� �˷���� �˷���� �˷���� �˷���� �˷���� �˷���� �˷���� �˷���� �˷���� �˷���� �˷���� �˷����˷���� �˷����˷���� �˷����', 'n');

	-- report ������ Ȯ��

SELECT * FROM report;



-- message

	-- message ���̺� ����

DROP TABLE message;

CREATE TABLE message (
	msg_no NUMBER(10) PRIMARY KEY,					--�޼�����ȣ
	used_no NUMBER(10) NOT NULL,					--�߰��ŷ���ȣ
	sender VARCHAR2 (200 byte) NOT NULL,			--�߽���
	receiver VARCHAR2 (200 byte) NOT NULL,			--������
	msg_content VARCHAR2 (200 byte) NOT NULL,		--����
	send_time DATE NOT NULL,						--�߽��Ͻ�
	read_time DATE,									--Ȯ���Ͻ�
	read_chk CHAR(1) default 'n',					--Ȯ�ο���
	CONSTRAINT message_sender_fk FOREIGN KEY (sender) REFERENCES member(id),
	CONSTRAINT message_receiver_fk FOREIGN KEY (receiver) REFERENCES member(id),
	CONSTRAINT message_used_no_fk FOREIGN KEY (used_no) REFERENCES used(used_no)
);

	-- message ������ Ȯ��

SELECT * FROM message;



-- like

	-- like ���̺� ����

DROP TABLE like_list;

CREATE TABLE like_list (
	like_no	NUMBER(10) PRIMARY KEY,		--���ȣ
	book_no	NUMBER(10),					--å��ȣ
	id	VARCHAR2(20) NOT NULL,			--���̵�
	used_no NUMBER(10),					--�߰��ŷ���ȣ
	CONSTRAINT like_book_no_fk FOREIGN KEY (book_no) REFERENCES book(book_no),
	CONSTRAINT like_id_fk FOREIGN KEY (id) REFERENCES member(id),
	CONSTRAINT like_used_no_fk FOREIGN KEY (used_no) REFERENCES used(used_no)
);

--�߰�å �� �߰�
insert into like_list values((SELECT NVL(MAX(like_no), 0) + 1 FROM like_list), 
1, 'k1', 1);

--��å �� �߰�
insert into like_list values ((select nvl(max(like_no), 0) + 1 from like_list), 2, 'k1', '');



--��å ���� ��ȸ
 select * from like_list l left outer join book b on(l.book_no= b.book_no) where id='k1' and used_no is null

--�߰� ���� ��ȸ
select * from like_list l left outer join (select * from used u left outer join book b on(u.book_no= b.book_no)) a  on(l.used_no= a.used_no)
		where l.id='k1'and a.used_no is not null


--���� ����
delete from like_list where like_no = 4 and id ='k1'


	-- like ������ Ȯ��

SELECT * FROM like_list;


select * from like_list where id ='k1';




-- delivery

	-- delivery ���̺� ����

DROP TABLE delivery;

CREATE TABLE delivery (
	delivery_no NUMBER(10) PRIMARY KEY,					--��۹�ȣ
	delivery_kind VARCHAR2(30),							--��۹��
	delivery_address VARCHAR2(50) NOT NULL, 			--����ּ�
	delivery_address_detail VARCHAR2(50) NOT NULL,		--��ۻ��ּ�
	delivery_tel CHAR(13),								--�����ȭ��ȣ
	delivery_recieve VARCHAR2(30)						--��۹޴���ġ
);

insert into delivery values((SELECT NVL(MAX(delivery_no), 0) + 1 FROM delivery),
 '�ù�', '����� ������', '�߾�����ó�� �п�', '010-1111-2222','å����');


	-- delivery ������ Ȯ��

SELECT * FROM trans;



-- deal

DROP TABLE deal;

CREATE TABLE deal (
	deal_no NUMBER(10) PRIMARY KEY,				--�ŷ���ȣ
	deal_group NUMBER(10) NOT NULL,				--�ŷ��׷��ȣ
	book_no NUMBER(10) NOT NULL,				--å��ȣ
	purchase_id VARCHAR2(20) NOT NULL,			--�����ھ��̵�
	used_no NUMBER(10),							--�߰��ŷ���ȣ
	seller_id VARCHAR2(20),						--�Ǹ��ھ��̵�
	delivery_no NUMBER(10),						--��۹�ȣ
	deal_date DATE DEFAULT sysdate,				--�ŷ��Ͻ�
	deal_price NUMBER(10) NOT NULL,				--�ŷ�����
	deal_count NUMBER(10) NOT NULL,				--����
	purchase_list_del CHAR(1) DEFAULT 'n',		--�ǸŸ�ϳ��⿩��
	sales_list_del CHAR(1) DEFAULT 'n',			--���Ÿ�ϳ��⿩��
	CONSTRAINT deal_book_no_fk FOREIGN KEY (book_no) REFERENCES book(book_no),
	CONSTRAINT deal_purchase_id_fk FOREIGN KEY (purchase_id) REFERENCES member(id),
	CONSTRAINT deal_used_no_fk FOREIGN KEY (used_no) REFERENCES used(used_no),
	CONSTRAINT deal_seller_id_fk FOREIGN KEY (seller_id) REFERENCES member(id),
	CONSTRAINT deal_delivery_no_fk FOREIGN KEY (delivery_no) REFERENCES delivery(delivery_no)
);

	-- deal ������ Ȯ��
insert into deal values((SELECT NVL(MAX(deal_no), 0) + 1 FROM deal),
 1, 1, 'k1', 1, 'k2',1, sysdate,18000,3, 'n', 'n');

SELECT * FROM deal;
--���Ÿ�� Ȯ��
select distinct deal_no,b.book_no,b.book_image,b.book_title,
		b.book_author,d.deal_count,d.deal_Date,u.used_subject,d.deal_price,d.used_no,d.book_no
		from deal d,book b,used u
	    where d.book_no = b.book_no 
		and d.purchase_id ='k1' and d.purchase_list_del ='n' 
		order by deal_date desc
--�ǸŸ�� Ȯ��
select d.deal_no,b.book_image,b.book_title,d.deal_price,d.deal_count,d.used_no,
		d.deal_date,b.book_author,u.used_subject
		from deal d,book b,used u
		where d.book_no = b.book_no and d.used_no = u.used_no
		and d.seller_id = 'k1' and d.used_no is not null and d.sales_list_del ='n'
		order by deal_date desc
--�ǸŸ�Ͽ��� ���� �������� update��Ű��
update deal set sales_list_del ='n' where seller_id='k1' and deal_no=2;



-- cart

	-- cart ���̺� ����

DROP TABLE cart;

CREATE TABLE cart(
	cart_no NUMBER(10) PRIMARY KEY,		--īƮ��ȣ
	book_no   NUMBER(10),				--å��ȣ
	id   VARCHAR2(12) not null,		    --���̵�
	cart_count   NUMBER(10) not null,   --����
	CONSTRAINT cart_book_no_fk FOREIGN KEY (book_no) REFERENCES book(book_no),
	CONSTRAINT cart_id_fk FOREIGN KEY (id) REFERENCES member(id)
);

select * from cart;
update cart set cart_count=6 where cart_no = 1;


insert into cart values((SELECT NVL(MAX(cart_no), 0) + 1 FROM cart), #{book_no},#{id},#{cart_count})

insert into cart values((SELECT NVL(MAX(cart_no), 0) + 1 FROM cart), 2, 'k1', 4); 
delete from cart where cart_no = 1 and id= 'k1'



	-- cart ������ Ȯ��

SELECT * FROM cart;


select * from tabs;



-- inquiry

	-- inquiry ���̺� ����

DROP TABLE inquiry;

CREATE TABLE inquiry(
	inquiry_no NUMBER(10) PRIMARY KEY,			--���ǹ�ȣ
	id VARCHAR2(20) NOT NULL,					--���̵�
	category_no NUMBER(10) NOT NULL,			--ī�װ�����ȣ
	inquiry_subject VARCHAR2(500) NOT NULL,		--��������
	inquiry_content VARCHAR2(4000) NOT NULL,	--���ǳ���
	reg_time DATE NOT NULL,						--���ǽð�
	reply CHAR(1) DEFAULT 'n',					--�亯����
	reply_content VARCHAR2(4000),				--�亯����
	reply_time DATE,							--�亯�ð�
	CONSTRAINT inquiry_id_fk FOREIGN KEY (id) REFERENCES member(id)
);

	-- inquiry ������ Ȯ��

SELECT * FROM inquiry;







-- test



SELECT deal_no, d.used_no, b.book_no, book_image, book_title, book_author, deal_count, deal_Date, deal_price from deal d, book b, used u where d.book_no=b.book_no and d.book_no=u.book_no and purchase_id='test1';

SELECT deal_no, d.used_no, b.book_no, book_image, book_title, book_author, deal_count, deal_Date, deal_price from deal d, book b where d.book_no=b.book_no AND purchase_id='test1' AND d.used_no IS NULL;

SELECT deal_no, d.used_no, b.book_no, book_image, book_title, book_author, deal_count, deal_Date, deal_price from deal d, book b, used u where d.book_no=b.book_no and d.book_no=u.book_no and purchase_id='test1' UNION ALL
	SELECT deal_no, d.used_no, b.book_no, book_image, book_title, book_author, deal_count, deal_Date, deal_price from deal d, book b where d.book_no=b.book_no AND purchase_id='test1' AND d.used_no IS NULL;


select * from deal;

	
		



















select * from member;