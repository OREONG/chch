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
select * from member;

drop table member cascade constraint;

select* from tabs;

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
SELECT * FROM used;

drop table used cascade constraint;

insert into used values((SELECT NVL(MAX(used_no), 0) + 1 FROM used), 1, '돈의 심리학', '팝니다', ' ', 10000, 'n', 'n', sysdate, '2');


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
SELECT * FROM review;


select * from (select a.*, rowNum rn from (select * from review)a)
		where rn between 1 and 25 and book_no=11 and review_del='n'
		order by review_reg_date desc;

drop table review cascade constraint;

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
select * from book;

drop table book cascade constraint;

insert into book values((SELECT NVL(MAX(book_no), 0) + 1 FROM book), '수면 아래', 'newBook1.jpg', ' ', '이주란', '문학동네', 10, 13500, '2022-08-12', sysdate,
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

insert into book values((SELECT NVL(MAX(book_no), 0) + 1 FROM book), '덕다이브', 'newBook2.jpg', ' ', '이현석', '창비', 10, 16000, '2022-08-10', sysdate,
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
insert into book values((SELECT NVL(MAX(book_no), 0) + 1 FROM book), '고양이 여관 미아키스', 'newBook3.jpg', ' ', '후루우치 가즈에', '하빌리스', 10, 14000, '2022-08-17', sysdate,
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
insert into book values((SELECT NVL(MAX(book_no), 0) + 1 FROM book), '북샵', 'newBook4.jpg', 'newBookDetail4.jpg', '피넬로피 피츠제럴드', '북포레스트', 10, 15000, '2022-08-22', sysdate,
to_clob('<h3>맨부커상, 전미비평가협회상, 골든펜 어워드 수상 작가!<br>
「타임스」의 ‘1945년 이후 가장 위대한 영국 작가 50인’에 선정된<br>
피넬로피 피츠제럴드의 베스트셀러 『북샵』 국내 출간!<br>
<br>
‘요즘 시대에 보기 드문 지성과 천부적인 재능을 지닌 뛰어난 작가’_줄리언 반스(맨부커상 수상 작가)</h3><br>')
|| to_clob('1916년 영국에서 태어난 피넬로피 피츠제럴드가 소설가로 데뷔한 것은 1977년 61세 때의 일이다. 
늦은 나이에 출간한 첫 작품 『황금 아이 Golden Child』는 큰 주목을 받지 못했지만 피츠제럴드는 이에 실망하지 않고 
이듬해 1978년 『북샵』을 세상에 내놓았다. 이 작품도 처음에는 별다른 관심을 받지 못했지만 점차 평론가들의 이목을 끌었고 
마침내 영국 최고의 권위 있는 문학상인 맨부커상 후보에 올랐다. 이로써 피넬로피 피츠제럴드는 영국 문단과 독자들에게 알려지게 되었는데, 
1979년에는 『오프쇼어 Offshore』로 맨부커상을 수상하면서 당대 최고의 영어권 소설가로 부상했다. 
1997년에는 전미비평가협회상을, 1999년에는 평생에 걸쳐 문학 발전에 공헌한 점을 인정받아 영국 펜클럽에서 골든펜 어워드를 받았다. 
2008년에는 「타임스」의 ‘1945년 이후 가장 위대한 영국 작가 50인’에 선정되기도 했다.<br><br>') 
|| to_clob('이번 북포레스트에서 출간된 『북샵』은 영국의 작은 바닷가 마을 하드버러에 서점을 열려고 하는 주인공 플로렌스의 이야기를 그리고 있다. 
피츠제럴드는 41세 때인 1957년 가족과 함께 이사해 거주한 잉글랜드 서퍽주 사우스월드의 바닷가 마을을 모델로 이 소설을 썼다. 
거기에서 실제로 서점도 운영했는데, 독자들은 대성하기까지 많은 부침을 겪어야 했던 작가의 삶을 주인공 플로렌스를 통해 조금이나마 엿볼 수 있을 것이다. 
작가는 평범하게 살아가는 주인공의 절망과 실패를 통해 우리가 살아가면서 실제 겪게 되는 인생의 단면을 날카로우면서도 섬세하게 펼쳐 보이며 약하지만 
용기 있는 이들을 위한 정성스럽고도 위대한 문학 작품을 탄생시켰다.'),
'문학', 'n');
insert into book values((SELECT NVL(MAX(book_no), 0) + 1 FROM book), '궤변 말하기 대회', 'newBook5.jpg', 'newBookDetail5.jpg', '김동식', '요다', 10, 13000, '2022-07-29', sysdate,
to_clob('데뷔작 『회색 인간』으로 한국 문단에 큰 충격을 주었던 김동식 작가가 처음 선보이는 연작소설. 
‘궤변 배틀’을 콘셉트로 한 TV 예능 프로그램에서 펼쳐지는 좌충우돌 에피소드를 담았다. 소설 속 TV 프로그램 [궤변 말하기 대회]에는 
매회 다양한 참가자들이 나와 자신만의 궤변을 늘어놓는다. 노후 대신 사후를 준비해야 한다, 전생은 미래에 존재한다, 인류 멸망을 꾀하는 
비밀 단체가 있다 등 말도 안 되는 궤변이지만, 그 속에 철학적이고 심오한 주제들이 튀어나와 우리의 통념을 흔든다. 
인간, 예술, 죽음, 환경 등 다양한 문제에 질문을 던지고 극한의 상상력을 보여 준다.'),
'문학', 'n');
insert into book values((SELECT NVL(MAX(book_no), 0) + 1 FROM book), '오너러블 스쿨보이 1', 'newBook6.jpg', 'newBookDetail6.jpg', '존 르카레', '열린책들', 10, 17800, '2022-07-20', sysdate,
to_clob('<h3>[사상 최고의 첩보 시리즈]라 불리는<br>
카를라 3부작의 두 번째 작품</h3><br><br>
스파이 소설의 대가이자 영국 문학계의 거인 존 르카레의 『오너러블 스쿨보이』가 열린책들에서 출간되었다. 『
오너러블 스쿨보이』는 작가의 분신과도 같은 인물인 스마일리와 러시아의 스파이 마스터 카를라의 대결을 그린 시리즈 [카를라 3부작]의 두 번째 작품으로, 
전작 『팅커, 테일러, 솔저, 스파이』 직후의 이야기를 그린다. 이야기는 영국과 중국, 동남아시아 전역을 배경으로 펼쳐지는데 소설 집필을 위해 
전쟁 지역을 직접 취재한 르카레의 생생한 묘사는 이 소설을 르포르타주와 같이 읽히게도 만든다. 
작가의 사회에 대한 날카로운 통찰력이 돋보이는 이 소설에서 작가는 집단의 부조리한 논리에 희생당하는 인물들을 섬세한 시선으로 그려 낸다.'),
'문학', 'n');
insert into book values((SELECT NVL(MAX(book_no), 0) + 1 FROM book), '하쿠다 사진관', 'newBook7.jpg', 'newBookDetail7.jpg', '허태연', '놀', 10, 15500, '2022-07-18', sysdate,
to_clob('삭막했던 도시의 일상에서 벗어나 제주로 여행을 떠난 주인공 제비. 
여행의 마지막 시간을 음미하던 제비는 별안간 둔탁한 무언가에 부딪힌다. 어이없는 사고로 휴대폰이 먹통이 된 제비는 내장된 비행기 표와 신용카드를 잃게 되고. 
허무한 오늘과 암담한 인생을 한탄하며 해안도로를 걷던 제비는 요상한 문어 석상이 놓여 있는 한 마을 입구에 다다른다. 
조용한 마을 한구석 벼랑 위의 이층집 〈하쿠다 사진관〉을 발견한 제비. 사진사에게 차비라도 빌려볼 요량으로 제비는 사진관의 문을 여는데……. 
그때까지만 해도 제비는 알지 못했다. 그곳에서 펼쳐질 수많은 이야기에 대해.'),
'문학', 'n');
insert into book values((SELECT NVL(MAX(book_no), 0) + 1 FROM book), '골목의 조', 'newBook8.jpg', 'newBookDetail8.jpg', '송섬', '사계절', 10, 15000, '2022-07-20', sysdate,
to_clob('<h3>제2회 박지리문학상 수상작
신인 작가 송섬의 첫 책</h3><hr>

“조, 골목에 있고 싶다면 얼마든지 있어도 돼.
그곳은 그러라고 있는 장소니까.”</h3><hr>

무슨 일이든 일어날 수 있으면서도 아무런 일도 일어나지 않는 곳.<br>
오직 고양이 두 마리와 두 사람만을 위해 존재하는, 처음이자 마지막 장소.<br>
그곳에 가야 하는 상황에 처했을 때 온전히 받아주는 곳.<br>
당신에게도 그런 장소가 있나요?<br><br>')
||to_clob('‘박지리문학상’은 2010년 스물다섯의 나이로 샛별같이 나타나 『합체』『맨홀』『다윈 영의 악의 기원』등 일곱 작품을 남기고 2016년에 세상을 떠난 
박지리 작가를 기리고, 그가 남긴 문학 세계를 이어가기 위해 만든 신인문학상 공모이다. 
인세와는 별도로 창작지원금 5백만 원에 독자 후원금 2백만 원이 주어지는 이 상의 두 번째 수상작 『골목의 조』가 출간되었다. 
『골목의 조』는 1995년생 송섬 작가의 첫 책으로 심사위원 이기호, 김성중 소설가와 윤경희 평론가가 수상작으로 선택한 작품이다.<br><br>')
||to_clob('
국비 지원 프로그램으로 배운 기술로 건축사 사무소에서 도면 긋는 일을 하며 사는 ‘나’는 어디에서도 딱히 존재감을 드러내거나 환영받는 스타일은 못 된다. 
하지만 나의 반지하 집에는 버려진 고양이 두 마리와 변변찮은 술집을 운영하는 조, 그리고 어느 날 벽에서 돋아난 아저씨 유령까지 함께 살게 된다. 
어머니의 부재와 아버지의 자살로 유년기의 상처를 안고 사는 스물네 살 반지하 생활자에게 찾아온 무해한 존재들, 
이들과 함께 인생의 절기를 보내며 관계 맺고 이별하는 과정을 통해 ‘나’는 스스로의 공백을 채워나가며 삶에 대한 담담한 용기를 얻는다.'),
'문학', 'n');
insert into book values((SELECT NVL(MAX(book_no), 0) + 1 FROM book), '비올레트, 묘지지기', 'newBook9.jpg', 'newBookDetail9.jpg', '발레리 페랭', '엘리', 10, 18500, '2022-07-18', sysdate,
to_clob('‘묘지’를 ‘정원’으로 가꿔나가는 비올레트의 인생 이야기. 묘지에 묻힌 사람들의 드라마와 비올레트의 인생 드라마가 중첩되며 전개된다. 
현재와 과거를 오가며 점차 눈물겨운 삶의 비밀들이 밝혀지지만, 그럼에도 비올레트를 살게 하는 사람들이 매우 다정하게 묘사된다. 
시적이고 고요한 문장들, 동시에 시끌벅적한 사건들, 겹겹이 쌓인 비밀들, 더해서 미스터리와 서스펜스까지. 
단숨에 읽히지만, 생의 모든 계절이 펼쳐진다. 상실-슬픔-고통에 관한 이야기인 동시에 만남-회복-소생에 관한 이야기. 
버텨낸 삶에 대한 위로와 살아나갈 용기에 대한 이야기. 느긋하게 시작되다가 중반 이후 휘몰아치는 전개가 놀라운 소설. 
프랑스에서만 100만 부 이상 판매되었고, 현재 영화화가 진행 중이다. 박연준 시인 감동 추천!'),
'문학', 'n');
insert into book values((SELECT NVL(MAX(book_no), 0) + 1 FROM book), '여기는 커스터드, 특별한 도시락을 팝니다', 'newBook10.jpg', 'newBookDetail10.jpg', '가토 겐', '필름', 10, 15000, '2022-07-15', sysdate,
to_clob('<h3>인생에서 길을 잃을 때면 이곳으로 오세요</h3><br>
어긋난 관계로 생긴 자책감에서 벗어나지 못하고 공허한 나날을 보내던 세 사람 앞에 나타난 도시락 가게의 주인 히나타. 
난데없이 포인트 카드가 꽉 찼다며 경품을 건네준다. 처음에는 하찮은 내용물에 실망하지만 점차 과거의 기억들이 되살아난다. 
절교를 선언했던 하굣길, 엄마에게 화를 냈던 겨울날, 길고양이를 두고 도망쳤던 공원. 작은 인연 하나가 전부였던 시절이다. 
사소한 엇갈림에 모든 것이 끝났다고 생각했고 더 이상 되돌리기에는 이미 늦었다고 여겼다. 과연 히나타의 선물은 ‘후회’를 ‘기적’으로 만들어줄 수 있을까?'),
'문학', 'n');

insert into book values((SELECT NVL(MAX(book_no), 0) + 1 FROM book), '너의 초록으로, 다시', 'newBook11.jpg', 'newBookDetail11.jpg', '나태주, 한서형', '더블북', 10, 17800, '2022-07-07', sysdate,
to_clob('<h3>나태주 시인의 시에 향을 입힌 국내 최초 향기시집</h3><br>
한국인이 가장 사랑하는 풀꽃 시인 나태주 시인의 시에 향기작가 한서형이 9가지 천연 에션셜 오일로 창조한 ‘나태주 시인의 향’을 입힌 국내 최초 향기시집이다. 
시각에 호소하는 단행본이나 전자책이 주류를 이루는 출판 콘텐츠 영역에서, 청각을 이용하는 오디오북이 출판 지평의 확대를 가져오기는 했으나, 
시집에 시인의 향기를 입혀 시각과 후각을 동시에 자극하는 형태의 콘텐츠가 출간되는 것은 이번이 처음이다. 
코로나 19로 인해 지쳐 있는 독자들을 위해 나태주 시인이 특별히 가려 뽑은 시들이 토닥토닥 등을 두드리며 힘내라고 용기를 주면서 새로운 시작을 응원한다. 
여기에 국내 1호 향기작가 한서형이 시집에 입힌 향은 마음에 평화를 주고 신념대로 나아가게 해주는 긍정적이며 생명력이 넘치는 에너지를 준다. 
시(詩)테라피 ‘향기시집’이라는 이름으로 출간되는 이번 시집은 독자들에게 휴식과 위안, 삶에 용기를 주는 시어(詩語)들을 
향기와 함께 느껴보는 새롭고 낯선 경험을 선사할 것으로 보인다.'),
'문학', 'n');
insert into book values((SELECT NVL(MAX(book_no), 0) + 1 FROM book), '다크 플레이스의 비밀', 'newBook12.jpg', 'newBookDetail12.jpg', '리사 주얼', '한스미디어', 10, 16700, '2022-07-08', sysdate,
to_clob('<h3>스릴러의 마에스트로가 펼치는 현대 스릴러의 정점</h3>
<h3>스릴러 역사에 현재진행형 전설을 세우는 작가의 화제작</h3><br>
[뉴욕 타임스] 베스트셀러 52주 연속 선정의 경이로운 대기록을 세운 작가, 리사 주얼의 최신작이자 최고작으로 극찬받는 『
다크 플레이스의 비밀』이 출간되었다. 리사 주얼은 1999년 발표한 첫 작품 『랄프의 파티』가 당해 가장 많이 팔린 데뷔소설이란 
기록을 세우며 화려하게 등장했다. 이후 2022년까지 18편의 소설을 꾸준히 발표했으며, 
그녀의 작품들은 통산 천만 부 이상의 판매고를 기록하고 29개 언어로 번역되었다. ')
||to_clob('
『다크 플레이스의 비밀』은 출간 직후 아마존 종합 베스트셀러 베스트 10, [뉴욕 타임스] 베스트셀러에 진입한 데 이어, 
리 차일드·할런 코벤 등 세계 유수의 스릴러 작가들에게 극찬을 받은 작품이다.<br><br>
영국의 한가하고 화사한 교외 지역에서 살게 된 미스터리 작가 소피가 우연찮게 마을의 미제 실종 사건에 뛰어든다. 
일 년 전 어린 미혼모 탈룰라는 데이트를 한다며 집을 나간 후 그대로 실종되었으며, 그녀의 마지막 행선지는 현재 사람 없이 버려진 고택 ‘다크 플레이스’다. 
그곳에서는 대체 무슨 일이 일어났던 걸까?<br><br>
『다크 플레이스의 비밀』은 도메스틱 스릴러로서 훌륭한 한편으로 다양한 장르를 자연스럽게 융합해 복합적인 재미를 선사한다. 
누구를 그리고 어떤 장르를 중심에 두고 깊이 있게 읽느냐에 따라 읽어낼 수 있는 이야기가 끊임없이 확장될 수 있는 소설로, 
독자들은 의미와 더불어 읽을수록 새로운 재미를 찾아낼 수 있을 것이다.'),
'문학', 'n');

insert into book values((SELECT NVL(MAX(book_no), 0) + 1 FROM book), 
'우리는 어디서 살아야 하는가', 
'newBook13.jpg', 
'newBookDetail13.jpg', 
'김시덕', 
'포레스트북스', 
15, 
18000, 
'2022-07-20', 
sysdate,
to_clob('저자 김시덕은 도시의 개발 역사를 오랜 시간 추적해온 도시 답사가이자 문헌학자이다.
일주일에 서너 번씩 대중교통을 이용해 대한민국 방방곡곡을 답사하며 기록한 생생한 현장 정보와
식민지 시기 ‘토지구획 평면도’부터 가장 최근의 도시계획 자료에 이르기까지 문헌 자료를 정리하여 
지역의 현재 가치와 미래 가치를 살펴보는 것이 그의 주요 연구 과제이다.<br><br>
이 책은 그가 ‘대한민국에서 집을 사는 사람’을 위해 쓴 첫 번째 책으로, 그가 오랜 시간 수집한 
빅데이터를 바탕으로 ‘실거주하기 좋으면서도 미래의 투자 가치가 높은 곳’을 분석한다. 또한, 도시를 
직접 답사하고 기록한 학자로서의 사명감으로 집값이 떨어질까 봐 쉬쉬하며 감추고 있는 입지 조건의 실체와
실현 가능성 없이 정치 이슈로 이용되는 정책들, 터무니없는 기획부동산의 주장까지 소송당할 각오로 파헤쳤다. 
이 책은 살고 싶은 집을 찾는 이에게도, 사고 싶은 집을 찾는 이에게도 든든한 지침이 되어줄 것이다.'), '경제', 'n');

insert into book values((SELECT NVL(MAX(book_no), 0) + 1 FROM book), 
'부자의 그릇', 
'newBook14.jpg', 
'newBookDetail14.jpg', 
'이즈미 마사토', 
'다산북스', 
15, 
15000, 
'2020-12-14', 
sysdate,
to_clob('2015년 출간 이후, 수많은 독자로부터 꼭 읽어야 할 최고의 ‘부자학 입문서’로 꼽혀온 『부자의 그릇』이 양장 개정판으로
새롭게 출간됐다. 이 책은 김봉진 우아한형제들 의장, 청울림 유대열 대표, 하정우 배우 등이 강력 추천하고, 40곳이 넘는 유튜브 채널에서 
소개되며, 수많은 젊은 부자와 독자로부터 실제 삶에 적용할 수 있는 최고의 ‘부자학 입문서’로 꼽혀왔다. 대체 이 책에 어떤 비결이 숨어 
있기에, 이토록 꾸준히 사랑받으며 스테디셀러로 자리매김한 걸까?<br><br>
『부자의 그릇』은 일생을 ‘돈의 교양’을 알리는 데 바쳐온 일본 최고의 경제금융 교육 전문가 이즈미 마사토가 소설 형식으로
쓴 경제경영 교양서다. 한때 연 매출 12억의 주먹밥 가게 사장이었다가 도산해 3억 원의 빚을 지고 공원을 방황하던 한 젊은 
사업가가 수수께끼 노인을 만나 장장 7시간에 걸쳐 돈의 본질과 돈을 다루는 능력을 키우는 법을 배우는 과정을 다루고 있다.<br><br>
이 책은 부자가 되는 방법이 돈을 좇는 데 있지 않고 신용을 쌓는 일이라고 말한다. 남을 위해 돈을 쓰고, 다른 사람의 기대에 부응하며
, 약속을 철저히 지키는 일들이 어떻게 돈을 불러 모으는지, ‘돈과 신용의 원리’에 관해 누구나 쉽게 이해할 수 있도록 흥미로운 스토리
텔링을 통해 전달한다.<br><br>
돈에 대한 명쾌한 통찰을 담고 있어서, ‘연봉이 적어서, 빚이 있어서, 운이 나빠서, 불황이라서, 이율이 낮아서, 세상이 불공평해서’ 
돈이 모이지 않는다며 좌절한 이들에게 다시 도전할 수 있는 용기와 돈을 장악하는 힘을 불어넣어 준다.'), '경제', 'n');

insert into book values((SELECT NVL(MAX(book_no), 0) + 1 FROM book), 
'3년 후 부의 흐름이 보이는 경제지표 정독법', 
'newBook15.jpg', 
'newBookDetail15.jpg', 
'김영익', 
'한즈미디어', 
15, 
18500, 
'2022-08-25', 
sysdate,
to_clob('지난 2018년 발간 이후 오랜 시간 베스트셀러로 사랑 받아 온 대한민국 거시경제의 거장 김영익 교수의 《경제지표 정독법》이
최신 개정판으로 새롭게 선보인다. 우리 주위의 경제지표를 이용해 미래를 보는 법을 다룬 《경제지표 정독법》은 그간 비즈니스맨, 
기업의 리더, 투자자, 그리고 사회초년생과 취업준비생에 이르기까지 경제를 보다 심도 깊게 이해하고 이를 현실에 활용하고자 하는 
이들에게 큰 호응을 얻어왔다.<br><br>
특히 코로나 팬데믹 이후 얼어붙고 있는 세계 경제 위기를 명확하게 예측하고 경고해왔던 한국의 ‘닥터 둠’ 김영익 교수가 가장 애정하는 
책이라는 점에서 남다른 의미가 있다. 저자가 수십 년간 경제를 분석하고 미래를 예측하는 데 활용해온 가장 기본적인 데이터와 분석 방법이
오롯이 담겨 있기 때문이다.<br><br>
이번 《경제지표 정독법》 최신 개정판이 지니는 특별한 가치 중 하나는 코로나 팬데믹을 거치며 요동쳤던 주요 경제지표를 꼼꼼하게 반영하여
설명하고 있다는 것이다. 역사상 유례를 찾기 어려울 만큼 거대한 유동성이 공급되었던 지난 몇 년 동안의 수출입동향, GDP, 고용, 금리,
환율 등의 경제지표를 분석해 보는 것은 이루 말할 수 없는 소중한 의미를 지닌다. 앞으로 우리에게 다가올 미래의 씨앗을 살펴보는 것이기
때문이다. 경제지표 속에는 머지않아 다가올 부의 흐름이 담겨 있다. 《경제지표 정독법》을 통해서라면 그 흐름을 조금 더 쉽고
명확하게 발견할 수 있을 것이다.'), '경제', 'n');

insert into book values((SELECT NVL(MAX(book_no), 0) + 1 FROM book), 
'돈의 속성', 
'newBook16.jpg', 
'newBookDetail16.jpg', 
'김승호', 
'스노우폭스북스', 
15, 
17800, 
'2020-06-15', 
sysdate,
to_clob('초판 발행 후, 경제경영 필도서로 자리매김한 『돈의 속성』 200쇄 기념 개정증보판이다. 
200쇄에 맞춰 코로나19로 바뀐 경제상황과 돈에 관한 김승호 회장의 추가 메시지를 담았다.<br><br>
『돈의 속성』은 3년 전 어느 극장 하나를 빌려 대중에게 강의했던 내용을 기반으로 집필됐다. 강연은 방송을 통해 전파되며 유튜브와 
셀럽들에 의해 공유와 전파를 거듭했다. 그리고 이내 1,100만 명에게 전달되기에 이르렀다. 하지만 여러 사람을 통해 생산 및 재생산되는
과정에서 어떤 의미는 그 뜻이 정확히 전달되지 않았거나 의미가 왜곡되는 일이 있었다.<br><br>
몇 권을 저술한 저자지만 여전히 책 쓰기가 가장 어렵다는 그는 이런 상황에서 다시 한 번 펜을 잡기로 결정했다. 그것은 그의 내면에 깃든 
사람에 대한 애정 때문이었다. 모두에게 정말 필요하고 중요하지만 아무도 말하지 않는 진짜 돈 버는 방법, 진짜 돈을 벌어본 사람은 그 
누구도 방법을 공유하지 않기에 이 일이 저자 자신에게 주어진 것이라 받아들였다. 젊은 날의 자신의 모습이 투영되기에.<br><br>
어떤 횡재나 일명 대박주식 없이 말 그대로 맨손에서 만들어낸 종잣돈으로 돈 버는 방법을 알려준다. 부모에게 받은 유산은커녕, 30대
후반까지 낡은 자동차에 그날 판매할 과일을 싣고 다니던 어느 가난한 이민 가장이 이룬 진짜 부에 대한 모든 방법이 담겼다. 종잣돈 
천만 원을 만들고 그 돈을 1억 원, 10억 원, 100억 원, 수천억 원이 될 때까지 돈을 관리하며 터득한 ‘돈’이 가진 속성을 정리한 안내서다.
‘진짜 부자’가 된 실제 인물이 말해주는 ‘진짜 돈’만들기에 대한 책이다.'), '경제', 'n');

insert into book values((SELECT NVL(MAX(book_no), 0) + 1 FROM book), 
'부의 인문학', 
'newBook17.jpg', 
' ', 
'우석', 
'오픈마인드', 
15, 
17000, 
'2022-03-21', 
sysdate,
to_clob('지금까지 인문학을 ‘투자’라는 렌즈를 통해 바라본 책은 없었다. 인문학을 이토록 쉽고 재미있게, 투자의 눈을 뜨게 하는 
도구로 사용할 수 있다는 것만으로도 흥미롭다. 저자는 자기 안에서 소화된 인문학과 지금의 우리 현실을 씨실과 날실로 엮어가며 투자에 
대한 거대한 태피스트리를 엮어간다.<br><br>
1장은 우리가 왜 책을 읽어야 하는지, 철학이 우리의 생각과 삶의 모습을 어떻게 변화시키는지 일상의 언어로 설명하며 철학이 어떻게 
투자의 무기가 되는지 알려준다. 2장에서는 정치나 정책 안에서 경제와 경기가 움직이는 원리가 무엇인지, 그것이 우리의 삶을 어떻게 
변화시키는지 자세히 설명하며 사람들이 왜 ‘노예의 삶’을 선택하는지 이야기한다.<br><br>
3장에서는 부동산 가격이 움직이는 메커니즘을 통해 오늘 우리에게 필요한 현실적인 부동산 투자법은 무엇인지 제안하고, 4장에서는 천재 
경제학자들의 이론에서 도출해 낸 필승 주식 투자법을 소개해 개인 투자가들이 실수와 실패를 줄일 수 있도록 응원한다. 5장에서는 인문학을 
기반으로 돈의 흐름과 부의 작동원리를 읽는 법을 밝힘으로써 투자에 대한 고정관념과 오해를 깨치고 하고, 6장에서는 인간의 본성과 
자본주의의 원리를 간파하고 성공 투자의 청사진을 그릴 수 있게 이끌어준다.'), '경제', 'n');

insert into book values((SELECT NVL(MAX(book_no), 0) + 1 FROM book), 
'좋은 불평등', 
'newBook18.jpg', 
' ', 
'최병천', 
'메디치미디어', 
15, 
22000, 
'2022-09-01', 
sysdate,
to_clob('《좋은 불평등》은 ‘일반시민을 위한 한국경제 불평등 교과서’를 목표로 집필된 책이다. ‘시민을 위한 불평등 교과서’를 
목표로 하는 이유는 궁극적으로 대통령과 국회의원 등 정책 결정권자의 생각을 바꾸기 위해서다. 《좋은 불평등》 한 권을 읽게 되면,
자연스럽게 한국경제 불평등 30년의 역사, 불평등과 경제성장의 관계, 한국경제와 세계경제 및 중국경제의 변화가 한국 불평등에 어떤
영향을 미쳤는지, 한국의 노동 문제와 사회복지, 초고령화 문제까지를 포괄적으로 이해할 수 있다.<br><br>
《좋은 불평등》의 특징은 4가지다. 첫째, 우리가 그간 알고 있던 불평등에 관한 ‘통념을 전복하는’ 책이다. 그간 우리는 1997년 외환위기
이후 불평등이 시작됐고, 재벌, 신자유주의, 비정규직 때문에 불평등이 커졌고, 정치권의 정책적 요인 때문에 변동했고, 불평등은 경제성장에
해롭다고 알고 있었다. 《좋은 불평등》은 이러한 통념이 모두 사실이 아니거나, 거의 전부 사실이 아님을 논증하고 있다.<br>
둘째, 쉽고 입체적이다. 한국경제 불평등에 관해 그간 나온 책을 통틀어, 한국경제, 세계경제, 중국경제, 노동 문제와 사회복지 문제를 
포괄해서 설명하는 가장 입체적인 책이다. 셋째, 그래프와 데이터가 풍부하다. 110개의 그래프와 도표를 통해 꼼꼼하고 치밀하게 논증하고 있다.
‘기존의 통념 뒤집기’를 목표로 했기에 팩트가 단단해야 했다. 넷째, 정책의 관점에서 다루고 있다. 뜬구름 잡는 이야기가 없다. 정책 
일선에서 오랫동안 활동했던 저자의 특성이 고스란히 반영되어 있다.<br><br>
책은 총 6부, 16장으로 구성되어 있다. 1부는 불평등과 경제성장의 관계에 대한 고전적 논의와 한국 보수와 진보의 불평등 이론을 다룬다.
2부와 3부는 한국경제 불평등 30년 역사에서 발생한 3대 변곡점과 발생 원인을 추적한다. 4부와 5부는 최저임금 1만 원, 2018년과 
2019년의 소득주도성장론 정책 실험, 진보경제학이 왜 불평등 축소에 실패했는지를 추적한다. 한국의 불평등 확대는 1987년, 1992년,
1997년, 2001년 4개의 사건이 복합적으로 작용했음을 논증한다. 6부는 글로벌 자본주의의 지난 70년과 앞으로 30년을 전망하며 정책
대안을 다룬다. 경쟁력, 계층 사다리, 불평등 축소의 관점에서 살펴본다.'), '경제', 'n');

insert into book values((SELECT NVL(MAX(book_no), 0) + 1 FROM book), 
'변화하는 세계 질서', 
'newBook19.jpg', 
'newBookDetail19.jpg', 
'레이 달리오', 
'한빛비즈', 
15, 
38000, 
'2022-06-01', 
sysdate,
to_clob('《원칙 Principles: Life & Work》으로 전 세계의 사랑은 물론, 국내 독자들의 사랑을 한 몸에 받았던 레이 달리오가 새로운
책으로 돌아왔다. 《원칙》이 그의 인생과 회사 경영에 대한 원칙을 밝힌 책이라면, 이번 책에서는 지난 500년간 주요 국가들의 경제적, 정치적
, 역사적 패턴을 파악해 전 세계가 앞으로 어떻게 달라질지를 밝히고, 우리가 어떻게 대응해야 할지를 알려준다.<br><br>
그의 새로운 책《변화하는 세계 질서》는 끊임없이 변화하는 세계 질서에 대처하기 위한 레이 달리오만의 원칙들을 담았다. 최근 올라온
《변화하는 세계 질서》를 요약한 유튜브 영상은 조회수 1,219만 회를 넘기며 많은 독자들의 관심을 증명했다.'), '경제', 'n');

insert into book values((SELECT NVL(MAX(book_no), 0) + 1 FROM book), 
'돈의 심리학', 
'newBook20.jpg', 
'newBookDetail20.jpg', 
'모건 하우절', 
'인플루엔셜', 
15, 
19800, 
'2021-01-13', 
sysdate,
to_clob('월스트리트저널에서 10년 넘게 금융과 투자에 대한 글을 써온 칼럼니스트이자 콜라보레이티브 펀드 파트너로 활동중인 모건
하우절의 첫 책이다. 출간 즉시 아마존 투자 분야 1위를 차지했고 개인 투자자부터 전문 컨설턴트까지 극찬 세례를 받으며 명실상부 ‘2020 
아마존 최고의 금융도서’로 평가받는다.<br><br>
《돈의 심리학》은 총 20개 스토리로 구성되어 있다. ‘스토리텔링의 천재’ ‘소설가의 기술을 가진 금융 작가’라는 별명답게 모건 하우절이 
들려주는 20개의 투자 스토리는 대단히 매력적이다. 하나하나 실화와 실증에 바탕을 두되 이야기의 재미와 투자의 교훈을 빠짐없이 담아냈다.<br><br>
제2차 세계대전 당시 독일의 탱크 부대 이야기, 마이크로소프트 창업에 관한 빌 게이츠의 고백, LA에서 주차 대행 아르바이트를 하던 시절 
페라리에 얽힌 에피소드, 워런 버핏의 놀라운 수익률의 비밀까지 다양한 이야기를 흥미롭게 전개하여 읽는 이들을 단번에 사로잡는다.<br><br>
또한 그 끝에는 하나같이 감탄을 부르는 탁월한 통찰을 담고 있다. 부에 관한 문제는 결국 학력, 지능, 노력과 직접적 관련이 없으며 돈에
관한 인간의 편향, 심리, 다시 말해 ‘돈의 심리학’과 밀접한 관련이 있음을 깨닫게 한다.'), '경제', 'n');