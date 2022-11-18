SELECT * FROM author;

--나도 작가되기 데이터
insert into author values((SELECT NVL(MAX(author_no), 0) + 1 FROM author), 
'짱 쎈 드래곤'
,'자유장르' 
,'여러븐 재가 드디어 글을 씀니다~ 만이 봐주새요~ 내용은 최강의 드래곤인 투명드래곤이 차원이동해서.... ㅎㅎㅎ 궁금하면 보샘~'
,'test1'
,'n'
,sysdate
,0);
insert into author values((SELECT NVL(MAX(author_no), 0) + 1 FROM author), 
'[단편]무서운 이야기'
,'미스터리' 
,'이해하면 소름끼치는 짧은 무서운 이야기 모음..! 덜덜 ㅠㅠ'
,'test1'
,'n'
,sysdate
,0);
insert into author values((SELECT NVL(MAX(author_no), 0) + 1 FROM author), 
'사람이 살 수 없는 집'
,'미스터리' 
,'안녕하세요 저는 23살여자에요. 다름이아니라 제가 어릴때 겪은 일을 재미삼아 꺼내보려구요. 재미삼아 할이야기는 아닐수도있지만요...'
,'test2'
,'n'
,sysdate
,0);
insert into author values((SELECT NVL(MAX(author_no), 0) + 1 FROM author), 
'좋은 글 시리즈'
,'자유장르' 
,'행복의 한 쪽 문이 닫히면 다른 쪽 문이 열린다. 그러나 흔히 우리는 닫혀진 문을 오랫동안 보기 때문에 우리를 위해 열려 있는 문을 보지 못한다. -헬렌 켈러'
,'test2'
,'n'
,sysdate
,0);
insert into author values((SELECT NVL(MAX(author_no), 0) + 1 FROM author), 
'실버 트리'
,'로맨스' 
,'프랑스 카페왕조 필립 4세 시대, 침략자 술탄과 성지를 지키려는 성전기사단의 전쟁이 한창인 아크레.'
,'test3'
,'n'
,sysdate
,0);
insert into author values((SELECT NVL(MAX(author_no), 0) + 1 FROM author), 
'화산귀환[독점]'
,'무협' 
,'대 화산파 13대 제자. 천하삼대검수(天下三代劍手). 매화검존(梅花劍尊) 청명(靑明) 천하를 혼란에 빠뜨린 고금제일마 천마(天魔)의 목을 치고 십만대산의 정상에서 영면. 백 년의 시간을 뛰어넘어 아이의 몸으로 다시 살아나다. '
,'test2'
,'n'
,sysdate
,3);

insert into author values((SELECT NVL(MAX(author_no), 0) + 1 FROM author), 
'이세계 마법 공무원이 되었다'
,'판타지' 
,'마법사가 되고 싶었다.
그 간절함을 담아 전생에 모든 걸 바쳐 다시 태어난 세계는 인간은 물론 여러 이종족이 함께 살아가고 있는 곳이었다.
이종족간에 벌어지는 여러 갈등과 차별을 막고자 만들어진 특수 조직.
이종족의 평등과 공존을 위해 그의 마법이 움직이기 시작한다.'
,'test3'
,'n'
,sysdate
,2);
insert into author values((SELECT NVL(MAX(author_no), 0) + 1 FROM author), 
'모든걸 기억하는 천재무사'
,'무협' 
,'모든걸 기억하는 삼류무사 진소운 40년 전 마교가 재림하기 전으로 회귀하다.
과거로 돌아온 사실이, 딱히 날더러 세상을 구하라는 신호로는 보이진 않는다.

‘그랬다면 최소한 뭔가 특별한 능력을 주거나 장삼봉 조사의 영혼 같은 거라도 붙여줘야 했을 테니까?’'
,'test3'
,'n'
,sysdate
,1);
insert into author values((SELECT NVL(MAX(author_no), 0) + 1 FROM author), 
'얼어붙은 남주와 절친까지만 되려 했는데'
,'로판' 
,'소꿉친구인 남주를 짝사랑한 열대 나라의 공주에 빙의했다.

‘……오, 멋진데?!’

비록 차이기는 했지만 쿨하게 남주의 뒷배가 되어주는 멋진 여성이었다.

이거 괜찮은데!'
,'test3'
,'n'
,sysdate
,0);
insert into author values((SELECT NVL(MAX(author_no), 0) + 1 FROM author), 
'재벌집 막내아들'
,'판타지' 
,'『자금이라는 것은 주인인 내가 알지 머슴이 뭘 압니까』 정태수 한보그룹 회장이 국회청문회에서 무심코 한 말이다.
직장인, 샐러리맨이라고 부르지만, 사실은 머슴이다.'
,'test3'
,'n'
,sysdate
,0);
insert into author values((SELECT NVL(MAX(author_no), 0) + 1 FROM author), 
'플레이어가 과거를 숨김'
,'판타지' 
,'내 강함에는 비밀이 있다.

……절대 말할 수 없는 비밀이.'
,'test3'
,'n'
,sysdate
,0);
insert into author values((SELECT NVL(MAX(author_no), 0) + 1 FROM author), 
'완벽한 소유'
,'로맨스' 
,'“지금… 내 앞에서 어떤 새끼 아이를 찾아 달라는 거야!”
거친 숨을 몰아쉬며 서연은 재훈의 옷깃을 잡아 당겼다. 

“찾아주세요. 제발… 아이를 찾아줘요.”'
,'test3'
,'n'
,sysdate
,0);


--글 시리즈
--짱쎈 드래곤 시리즈
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
,'짱쎈 드래곤 5화 : 투명 드래곤은 육삼빌딩보다 커다랗다'
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

--무서운 이야기 시리즈
insert into author_work values(
(SELECT NVL(MAX(author_work_no), 0) + 1 FROM author_work)
,'1화 : 지하도'
,'한 여자가 야근을 마치고 집으로 돌아가는 길이었다.
언제나 다니던 지하도로 들어서는데, 앞에서 어떤 남자가 걸어오는 것이 보였다.
그 남자의 옷은 피투성이였고, 술에 취한 듯 비틀거렸다.
주변을 둘러보았으나, 지하도에는 여자와 그 남자 뿐이었다.
여자는 무서웠지만 그 곳을 지나지 않으면 집으로 갈 수 없기 때문에
스스로 "괜찮을거야"라고 타이르면서 그대로 지나가기로 했다.
남자와 엇갈리는 순간, 그는 여자를 쳐다보았으나 결국 아무 일도 일어나지 않았다.

그렇게 안심을 하고, 며칠 후 마을에서 일어난 연쇄살인사건의 범인이 체포되었다.
여자는 범인의 얼굴을 보고 경악했는데, 며칠 전 지하도에서 마주친 그 남자였기 때문이다.
그와 동시에, 자신은 왜 습격당하지 않은 것인지 하는 의문이 들었다.
여자는 궁금증을 참지 못하고 교도소에 가 범인과 대면했다.
​
"그 날 절 보지 않았나요?"
"기억납니다."
"왜 절 죽이려 하지 않았죠?"
"당신은 다른 남자와 같이 있었지 않나요?"'
,''
,0
,sysdate
,2
,'test1'
,0
);
insert into author_work values(
(SELECT NVL(MAX(author_work_no), 0) + 1 FROM author_work)
,'2화 : 신'
,'삐--------------- 삐-- 삐-- 삐-- 삐--

몬터가 심장박동을 다시 잡아내면서 눈물이 눈안에 가득참을 느꼈다.
의사들이 분주해짐과 동시에 딸은 몸을 일으켰다.
그리곤 기침을 내뱉으며 그 작은 폐에 담을 수 있는 모든 것을 쏟아냈다.

"아.. 아빠"

아이는 울먹거리며 아빠를 불렀다.
그녀의 작은 파란 눈이 날 찾음과 동시에 난 아이의 손을 움켜쥐었다.
"그래, 아빠 여기 있어. 괜찮니? 맙소사.. 거의 널 잃은줄 알았단다."

딸아이는 날 향해 웃었다.

"나 신을 만났어!! 아빠 나 신을 봤다고!!"

눈물이 내 뺨을 타고 흘러내렸다.

"멋지구나! 그가 뭐라고 했니?"

아이의 작은 눈썹이 찡그러졌다.

"모르겠어... 뭐라고 했는데 정신이 너무 없고 시끄럽고..."

나는 한걸음 물러섰다.
의사들은 아직 뒤에 서있었다.
그리고 그녀는 다시 울기 시작했다.

"아빠, 아냐!! 나도 해보려고 했단 말이야!!"

"아직 만나지 못했어."

나는 의사들을 바라보며얘기했다.

"다시 집어 넣어."
'
,''
,0
,sysdate
,2
,'test1'
,0
);
insert into author_work values(
(SELECT NVL(MAX(author_work_no), 0) + 1 FROM author_work)
,'3화 : 혼인신고'
,'옆 집에 80세 드신 갑부 영감님이 계셨다.
어느 날, 영감님이 젊고 아름다운 아가씨와 걷는 것을 보았다.

"손녀 분이세요?"라고 물으니 "아내야", "처입니다."라고 동시에 대답했다.

들어보니 최근 혼인신고를 했다고 한다.
나중에 영감님께 비결이 뭐냐고 슬며시 물어보니,

"뭐.. 20살 정도 나이를 속인 것 뿐이지 뭐.."하며 껄껄 웃으셨다.
'
,''
,0
,sysdate
,2
,'test1'
,0
);
insert into author_work values(
(SELECT NVL(MAX(author_work_no), 0) + 1 FROM author_work)
,'4화 : 문틈사이'
,'평소와 다름 없는 어느 안개 낀 날,
역시 평소와 다름 없이 소년은 잠자리에 들었다.
잠자리에 들고 나서 몇 시간 후, 머리가 깨질듯이 아파서 소년은 침대에서 바로 눈을 떴다.
그런데 정면에 바로 문이 보였다.
그 문틈사이로 충혈되어보이는 눈알이 소년을 정면으로 바라보고 있었다.
더 소름끼치는 것은, 그 소년을 바라보는 눈동자 밑에 아무 것도 없었다는 것이다.
충격과 소름에 휩싸인 소년은 극단적인 공포감을 느끼며 다시 잠을 청하였다.
다음날 아침, 소년의 엄마가 소년을 두드려 깨웠다.

다행히도 문틈사이의 눈동자는 보이지 않았다.

그런데  잠시 생각해보니 소름이 돋고 말았다.

왜일까요?? 댓글로 남겨주세요~

'
,''
,0
,sysdate
,2
,'test1'
,0
);
insert into author_work values(
(SELECT NVL(MAX(author_work_no), 0) + 1 FROM author_work)
,'5화 : 편의점'
,'한 남성이 차를 타고 여행길에 나섰다.
여행길에 너무 목이 말라 근처 편의점을 찾아보았지만, 시골이라서 편의점은 보이지 않았다.
가다보니 아주 작은 구멍가게 같은 곳이 눈에 띄었다.
근처에는 집과 마을이 별로 없는 상태라서 [장사가 잘 될까?]라는 의문과 함께 들어갔다.

마을 아이들 몇몇이 과자를 고르고 있었고, 옆에 음료수와 물을 파는 냉장고가 있었다.
[생각보다 장사가 잘 되네..]라고 생각하며 물병을 하나 집어들고 계산대로 갔다.

그런데 한 꼬마가 말하길, "아저씬 참 좋을 것 같아요..."

[내가 도시에서 온 것처럼 보여서 그런가?]라고 가벼운 생각으로 넘기고
계산대에 가자 주인 아주머니께서 놀란 표정으로,
"여긴 어떻게 온 거야!! 당장 나가!!"하며 소리쳤다.
나는 마지못해 구멍가게를 나서고 차를 타려는데, 아주머니와 그 뒤에 꼬마가 나왔다.
먼저 아주머니가 "당장 나가.. 해지기 전에 여길 떠나.."라고 했다.
무슨 말인지 잘 이해가 가지 않는다는 표정을 지으며 출발하려는데,

또 다시 꼬마가 말했다.

"아저씨는.. 좋겠다.. 아직.. 살아있어서.."
'
,''
,0
,sysdate
,2
,'test1'
,0
);
insert into author_work values(
(SELECT NVL(MAX(author_work_no), 0) + 1 FROM author_work)
,'6화 : 수업'
,'서울에 있는 한 학원.
다양한 연령, 다양한 직업을 가진 사람들이 앞으로의 취업을 준비하려고 모이는 곳이다.

오늘은 11월 14일 월요일. 차가운 바람이 부는 늦가을. 
학원이 개강하고 5개월이 끝나갈 즈음의 어느 날이다.

전날 과음을 한 탓에 몽롱하게 앉아있는데
갑자기 강사님의 목소리가 울려 퍼진다.



수업 안듣고 이거 보면 안돼요!!!
'
,''
,0
,sysdate
,2
,'test1'
,0
);

--사람이 살 수 없는 집
insert into author_work values(
(SELECT NVL(MAX(author_work_no), 0) + 1 FROM author_work)
,'사람이 살수없는 집 1'
,'안녕하세요 저는 23살여자에요
다름이아니라 제가 어릴때 겪은 일을 재미삼아 꺼내보려구요
재미삼아 할이야기는 아닐수도있지만요...흠...

글쓰게 된 것은 요즘 상영영화 컨저링
오늘 보고왔는데
보는내내 예전 어릴때 살던 집생각이 나서 많은생각을 했어요

어린시절 가족들과 제가 죽을고비를 수도없이 넘기며
겨우 탈출했던 집에대한 이야기 해드리려구요 확실히 재미는 아닌가요;;
뭐.. 지금은 전혀문제없고
주변사람들에겐 괴담하나 풀듯이 가볍게 많이도 이야기했으니..

그래도 그집에 대해 이렇게 글 쓰긴 처음이라 뒤죽박죽일수도 있는점 이해해주세요
나름대로 가족들과 기억을더듬어 열심히 정리하고있어요..ㅎㅎ

문제에 집터에는 지금 그냥 아스팔트 길이되었어요
뒤쪽에 철도가 놓이고 방음벽같은게 설치되면서 집터를 좀 침범했지만
집터의 대부분은 아스팔트길
그집이 없어진탓에 이사간후에 한번도 찾아가볼수없었지만 (찾아가고 싶지도않았구요)

그치만 지금도 생생히 기억나네요 집의구조같은거라던가 냄새도 어렴풋 기억나고..
집은 여관건물 맨위층에있었고 
엄청낡은집이었지만 오래전엔 고급스러웠을 법한 그런집이었어요

엄마말로는 이사올때부터 가구가 몇개 있었는데 
텔레비전 놓는 장식장이랑 거실탁자하나 작은방 침대랑 안방화장대
주인아줌마가 찜찜하면 버리라고 했지만
전부 나무고 고급스럽게 생겨서 그대로 두고 침대만 왠지 찜찜해서 버렸다고 하더라구요

제가 기억하는 그집첫인상은 하루종일 햇빛이 잘들지 않아서 벽지라던지 곰팡이가 많았구요
주택에다 바닥도 나무고 햇빛이 잘안들어 바닥이 썩은곳도있었고
집자체도 엄청낡았는데 벌레한마리 없었던것 그정도?

심지어 여름인데 모기도없었어요

처음엔 무섭다던지 그런건 못느꼈어요 그저 마냥 신나고
그전에 네가족이 한방에 잤었는데 그렇게 갖고싶던 오빠와 내가잘방 생긴것이 기쁘고
집이 이상하게 꼭 마음에 들었던거 같아요

그때 오빠가 12살이고 제가 10살이었는데
엄마아빠가 작은방에 원래있던 침대를 빼고 작은침대 나란히 두개를 넣어줬어요
1주일은 아무일도 없이 잘지나가고
이사간후 일주일뒤 오빠일기엔 수요일이라고 되있어요

새벽에 자다가 깼는데 이상한소리가 들렸어요 누가 손까락으로 벽을 딱 딱 치는소리같은게
불규칙하게 딱, 딱딱, 딱, 딱딱딱 딱, 딱, 딱
이런식으로 들렸어요

처음엔 오빠가 일어났나 싶어서 그냥 자려고 눈을 감고 스르르 잠들었을때
갑자기 얼굴이 너무시원한거에요
그때가 여름이었거든요
그집이 원래 시원한편이라 선풍기는 켜놓지않았고
도둑든다고 창문도 닫고자고있었거든요
얼굴에 바람이 부는것도아니고 얼굴으로 박하같은거로 세수한 기분이랄까..
나중엔 팔하고 허리까지 시원했는데
뭔가 갑갑한 느낌도 들엇던거같아요
'
,''
,0
,sysdate
,3
,'test1'
,0
);

insert into author_work values(
(SELECT NVL(MAX(author_work_no), 0) + 1 FROM author_work)
,'사람이 살수없는 집 1-1'
,'
그때, 누가 제어깨를 잡고 확끌어당겼어요
정신이 들면서 잠에서 확깼는데
저는 서있고 창문앞에서 아빠가 저를안고있더라구요
불도 다켜져있고 오빠는 방문앞에서 엄마뒤에 숨어있고
눈떴을때 왜그런 상황이었는지 궁금하지도 않고
그날 그냥 아빠가 그대로 안고 안방으로 가서 가족들 다같이 안방에서 잠이들었던거같아요

제가 겁먹을까봐 아무도 말안한거같았는데
후에 몇년지나고 오빠말로는 자다가 일어났는데 제가 창문앞에서서 창문을 손까락으로
딱딱 치고있었대요

왜그러냐 물어도 답이없어서 덥냐고 창문을 조금열어줬더니
제가 까치발을들고 창문밖에 얼굴만빼고
얼굴을 이리저리 이상한방향으로 돌리더래요
오빠가 너무놀라서 제팔을 잡아당겼는데 당겨지지않더래요
그래서 제얼굴을 보고 이야기하려고 옆에서 제얼굴을 보는데
제가 입이 귀에걸릴 만큼 활짝웃고있더래요 (좀과장되었지만..)

그게 예쁘게 활짝이아니라 말그대로 입이찢어져라
오빠가 소리도 못지르고 안방으로 달려가 아빠엄마를 깨우고 방에돌아왔을때는
제가 창문을 활짝열고 창틀에 아슬아슬하게 수건처럼 걸려있었다는거에요
아빠가 제어깨를 확젖혀서 안고
제가 그때 깼다는데 엄마아빠는 심한 몽유병이라고 생각했대요
오빠가 일기에 썼었는데 엄마아빠가 그런거 쓰는거아니라고 그래서 지웠다고..
그래서 그날짜 오빠 일기엔 다른내용 적혀있구요
그뒤로 저는 몽유병 증세가 나타난적은없었어요 

그리고 그일있고 한 1주일간은 그냥 집에서 갑자기 쿵 소리가 난다던가
물소리가난다던가 그런것밖엔 이상한점이없었고
우리가족은 그냥 집이 낡아서 그러려니하며 살고있었죠

그후 일주일 뒤부터 일이 연달아 터지기 시작했는데
그집 1년좀 안되게 살면서 겪은 온갖 나쁜일 (좋은일은 전혀없었음)
아무튼.. 오빠일기와 가족들 한테 물어보고 제기억도 더듬어서 정리하고있는데
엄마아빠는 뭐 좋은일이라고 글쓰냐고 달갑지않아하시네요
그래도 오빠가 이것저것 많이 이야기해주고
부모님몰래 오빠랑 제가 그당시 적어둔것도 있으니
내일부터 매일은 아니더라도 많이 올리도록할게요 

시간도 늦었고 저는 이만 자러가볼게요..
저도 고민하듯 올리는글 아니고 재미로 들어주셨으면 하니까

자작이니 거짓이니 비난없이 읽어주셨으면해요
'
,''
,0
,sysdate
,3
,'test1'
,0
);
--좋은 글 시리즈
insert into author_work values(
(SELECT NVL(MAX(author_work_no), 0) + 1 FROM author_work)
,'힘이되는 짧은글'
,'
희망은 볼 수 없는 것을 보고, 만져질 수 없는 것을 느끼고, 불가능한 것을 이룬다. 
-헬렌 켈러

당신은 살아있다. 행동하라 인생의 과제와 윤리적 책임은 그리 복잡하지 않았다.
완전한 문장이 아닌 몇 단어로도 표현 할수 있다. 보아라 들어라 선택하라 행동하라 처럼 
-바바라홀

인간의 죽음은 패배했을 때가 아니라 포기했을 때에 온다.
-닉슨(미국 37대 대통령)

신은 어딘가 하늘 아래 그대만이 할 수 있는 일을 마련해 놓았다.
-호러스 부쉬엘

위대한 업적을 이룬 것은 힘이 아니라 불굴의 노력이다.
-사무엘 존슨

실패란 성공이란 진로를 알려주는 나침반이다.
-데니스 윌트리

제 갈 길을 아는 사람에게 세상은 길을 비켜준다.
-챨스 킹슬리

행복은 결코 많고 큰데만 있는 것이 아니다
작은 것을 가지고도 고마워 하고 만족할 줄 안다면
그는 행복한 사람이다
여백과 공간의 아름다움은 단순함과 간소함에 있다 
-홀로사는 즐거움 에서  법정스님

인간은 재주가 없어서라기보다는 목적이 없어서 실패한다.
-월리암 A 빌리 선데이

겁장이는 천 번을 죽지만, 사나이는 한 번만 죽는다.
-셰익스피어

우리의 최대의 영광은 한번도 실패하지 않는 것이 아니라, 실패할 때마다 일어서는 데 있다.    
-공자
 
교육의 목적은 [일생을 통하여 공부하는 자세를 갖게 하는 것]이다.
-R.M.해틴즈

하느님을 변화시키기 위해서가 아니라, 자신을 변화시키기 위해서 기도를 한다.  
-키에르 케고르

내소망은 단순하게 사는 일이다
그리고 평범하게 사는 일이다
내 느낌과 의지대로 자연스럽게 살고 싶다
그 누구도 내 삶을 대신해서 살아줄 수없기 때문에
나는 나답게 살고 싶다 
-오두막 편지 (법정스님)
'
,''
,0
,sysdate
,4
,'test2'
,0
);
insert into author_work values(
(SELECT NVL(MAX(author_work_no), 0) + 1 FROM author_work)
,'추천 좋은글 명언 글귀 '
,'
제일 어려운 수학 문제는 우리가 신이나 이웃에게 받은 축복을 세어 보는 것이다.  
-십대들의 쪽지

사막이 아름다운 것은 어딘가에 샘이 숨겨져 있기 때문이다.
-생 텍쥐베리

큰일을 이루기 원한다면 우선 자기를 이겨라. 자신을 이기는 것이 가장 큰승리이다.
-드러먼트

하찮은 위치에서도 최선을 다하라. 말단에 있는 사람만큼 깊이 배우는 사람은 없다.
-S.D.오코너

너무 소심하고 까다롭게 자신의 행동을 고민하지 말라 모든 인생은 실험이다. 더 많이 실험할수록 더나아진다 
-랄프 왈도 에머슨

고통은 인간의 넋을 슬기롭게 하는 위대한 스승이다.
-에센 바흐
 
자신의 욕망을 극복하는 사람이 강한 적을 물리친 사람보다 위대하다.
-아리스토텔레스

하루에 3시간을 걸으면 7년 후에 지구를 한바퀴 돌 수 있다.
-사무엘 존슨

고난이 클수록 더 큰 영광이 다가온다.
-키케로

무소유란 아무것도 갖지 않는다는 것이 아니라
불필요한 것을 갖지 않는다는 뜻이다
우리가 선택한 맑은 가난은 부보다 훨씬 값지고 고귀한 것이다 
-산에는 꽃이 피네 (법정스님 )
'
,''
,0
,sysdate
,4
,'test2'
,0
);
--로맨스
insert into author_work values(
(SELECT NVL(MAX(author_work_no), 0) + 1 FROM author_work)
,'실버트리 : 1화 '
,'
프랑스 카페왕조 필립 4세 시대,
침략자 술탄과 성지를 지키려는 성전기사단의 전쟁이 한창인 아크레.

전쟁의 위협을 피해 세공방의 레아 가족도 배를 타고 떠나기로 한 날,
출산이 임박한 엄마를 돌봐야 하는 아빠 대신 성전기사단 단장님이 맡긴 검을 돌려주러
레아는 전쟁의 한복판으로 나가야 했다.
그러나 검을 등에 단단히 메고 덜덜 떨며 도착한 곳에서 단장님의 죽음을 목도하고,
위험에 처한 순간, 어릴 적부터 꿈꾸던 아름다운 기사, 발타를 만난다.

하지만 그런 감상에 빠져 있을 때가 아니었다.
검은 주인을 잃었고, 성전기사단의 분위기도 어딘가 이상했다.

“혼자 가시기엔 위험합니다. 데려다 드리겠습니다.”
“정말 고맙습니다, 발타 님. 이 은혜를 어떻게 갚아야 할지…….”

그렇게 발타와 함께 세공방으로 돌아온 레아가 목격한 것은 참혹한 살해 현장이었다.
살아 있는 것은 네 살배기 라셸르뿐, 그리고 여동생이 전한 충격적 소식은…….

‘그것을 본 사람들은 전부 입을 막는 수밖에 없습니다!
하느님을 위한 사명이 먼저 아니겠습니까.’

그것? 단장님이 맡겼던 그 검 때문이라고?
성전기사단이…… 그 검 때문에 부모님을 살해했다고?

‘두 분을 묻어 드려도 될까요.’

레아의 피가 빠르게 식었다.
지금 자신을 세공방에 데려다주고 밖에서 부모의 시신을 수습하고 있는,
발타 역시 성전기사단이었으니까.

성전기사단의 성 유물을 둘러싼 음모와 신에 대한 거대한 진실.
그 시작의 날이었다.
'
,''
,0
,sysdate
,5
,'test2'
,0
);

--화산 귀환
insert into author_work values(
(SELECT NVL(MAX(author_work_no), 0) + 1 FROM author_work)
,'1화 서(序), 이게 뭐가 어떻게 돌아가는 상황이야? '
,'
대 화산파 13대 제자. 천하삼대검수(天下三代劍手). 매화검존(梅花劍尊) 청명(靑明)
천하를 혼란에 빠뜨린 고금제일마 천마(天魔)의 목을 치고 십만대산의 정상에서 영면. 백 년의 시간을 뛰어넘어 아이의 몸으로 다시 살아나다. 

그런데...... 뭐? 화산이 망해? 이게 뭔 개소리야!?
망했으면 살려야 하는 게 인지상정.

"망해? 내가 있는데? 누구 맘대로!"

언제고 매화는 지기 마련.
하지만 시린 겨울이 지나고 봄이 오면 매화는 다시 만산에 흐드러지게 피어난다.

"그런데 화산이 다시 살기 전에 내가 먼저 뒈지겠다! 망해도 적당히 망해야지, 이놈들아!"

쫄딱 망해버린 화산파를 살리기 위한 매화검존 청명의 고군분투가 시작된다.
'
,''
,0
,sysdate
,6
,'test2'
,0
);


--댓글 insert
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



select * from author_work;
delete author_work where author_work_no=7;
--독후감 데이터
insert into book values(1, '지구 끝의 온실', 'book1.jpg', '김초엽', '자이언트북스', 10, 10000, sysdate, sysdate, '안녕', '문학', 'n');
insert into book values(2, '영화를 찍으며 생각한 것', 'book2.jpg', '고레에다 히로카즈', '바다출판사', 10, 10000, sysdate, sysdate, '안녕', '문학', 'n');
insert into book values(3, 'Do it! 알고리즘 코딩 테스트', 'book3.jpg', '김종관', '이지스퍼블리싱', 10, 10000, sysdate, sysdate, '안녕', 'IT', 'n');
insert into book values(4, 'SQL로 시작하는 데이터 분석', 'book4.jpg', '캐시 타니무라', '한빛미디어', 10, 10000, sysdate, sysdate, '안녕', '문학', 'n');
insert into book values(5, '파이써닉한 파이썬을 익히는 간결한 안내서', 'book5.jpg', '데이비드M, 비블리', '프로그래밍 인사이트', 10, 10000, sysdate, sysdate, '안녕', '문학', 'n');

--여기까지 넣어주세요



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


<<<<<<< HEAD
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), 'test1', sysdate, '지구 끝의 온실이란 뭘까?', '모르겠다 책을 안 읽어 봤다 ㅎㅎ', 'y', 'n', 11);
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), 'test1', sysdate, '영화를 찍으며 뭘 생각했을까?', '배고프다 점심 뭐먹지 오늘 밤까왔는데 이따 수경이랑 먹어야겠다', 'y', 'n', 11);
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), 'test1', sysdate, '알고리즘..', '요즘 유튜브 알고리즘에 자꾸 나는 실패작이야 쇼츠가 뜬다 그만 떴으면 좋겠는데 보다보면 또 재밌다 깔깔', 'y', 'n', 11);
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), 'test1', sysdate, '데이터 분석', '책 표지 귀엽다 무슨 새지??', 'y', 'n', 11);
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), 'test1', sysdate, '파이썬',
'파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..
파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..
파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..
파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..
파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..파이썬도 열심히 해야지..'
, 'y', 'n', 11);
=======
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), 'test1', sysdate, '지구 끝의 온실이란 뭘까?', '모르겠다 책을 안 읽어 봤다 ㅎㅎ', 'y', 'n', 1);
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), 'test1', sysdate, '영화를 찍으며 뭘 생각했을까?', '배고프다 점심 뭐먹지 오늘 밤까왔는데 이따 수경이랑 먹어야겠다', 'y', 'n', 2);
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), 'test1', sysdate, '알고리즘..', '요즘 유튜브 알고리즘에 자꾸 나는 실패작이야 쇼츠가 뜬다 그만 떴으면 좋겠는데 보다보면 또 재밌다 깔깔', 'y', 'n', 3);
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), 'test1', sysdate, '데이터 분석', '책 표지 귀엽다 무슨 새지??', 'y', 'n', 4);
insert into report values((SELECT NVL(MAX(report_no), 0) + 1 FROM report), 'test1', sysdate, '파이썬', '파이썬도 열심히 해야지..', 'y', 'n', 5);

CREATE TABLE used (
	used_no	NUMBER(10) PRIMARY KEY,			--중고거래번호
	book_no	NUMBER(10) NOT NULL,			--책번호
	used_subject VARCHAR2(100) NOT NULL,	--제목
	used_content VARCHAR2(2000) NOT NULL,	--내용
	used_image VARCHAR2(100) NOT NULL,		--이미지
	used_price NUMBER(10) NOT NULL,			--가격
	used_status CHAR(1) DEFAULT 'n',			--판매상태
	used_del CHAR(1) DEFAULT 'n',				--삭제여부
	used_reg_date DATE NOT NULL,			--등록일시
	id VARCHAR2(20) NOT NULL,				--판매자 아이디
	CONSTRAINT used_book_no_fk FOREIGN KEY (book_no) REFERENCES book(book_no),
	CONSTRAINT used_id_fk FOREIGN KEY (id) REFERENCES member(id)
);
>>>>>>> origin/SungBeen

--좋아요, 관심, 찜 테이블
--like_table table create
create table like_table(
	like_no	number(10) primary key, --찜번호
	book_no	number(10), 			--책번호 fk
	id varchar2(20) not null, 		--아이디fk
	used_no number(10), 			--중고거래번호fk
	author_no number(10), 			--작가되기 번호fk
	author_work_no number(10), 		--작가되기 컨텐츠 번호fk
	review_no number(10),			--댓글 번호fk
	del char(1) default 'n',
	
	foreign key(book_no) references book(book_no),
	foreign key(id) references member(id),
	foreign key(used_no) references used(used_no),
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



select * from(select a.*, rowNum rn from(select * from review where author_work_no=1 and review_del='n' order by review_reg_date desc) a)where rn between 1 and 5


select * from author a, author_work aw where a.author_no(+)=aw.author_no and a.author_no=1;

select * from author where del='n' and ((select count(*) from author a, author_work aw where a.author_no(+)=aw.author_no and a.author_no=2) != 0) order by like_count desc;

select count(*) from author a, author_work aw where a.author_no(+)=aw.author_no and a.author_no=3

select count(*) from author where del='n'

select * from author where del='n' order by like_count desc

SELECT *
  FROM (
         SELECT author_no
			  , author_subject
              , id
              , author_class
			  , like_count
              , DENSE_RANK() OVER(ORDER BY like_count DESC) AS rnk
           FROM author
       )
 WHERE rnk <= 10 and like_count > 0;
select * from member;
update MEMBER set birth='99-02-03' where id='test2';