---------userinfo--------------------
insert into userinfo(u_id, u_name, u_pass, u_image, u_age, u_gen, u_zipcode, u_addr, u_tel, u_grade, u_attend,u_email, u_apply) 
values('kilsoon', '김길순', '1111', 'soon.jpg', 28, '남', '464-456', '경기도 광주시 태전동', '010-3001-2486', 4.98, 4.88, 'kk@naver.com',0);

insert into userinfo(u_id, u_name, u_pass, u_image, u_age, u_gen, u_zipcode, u_addr, u_tel, u_grade, u_attend, u_email, u_apply) 
values('sungmin', '오성민', '1234', 'min.jpg', 28, '남', '797-789', '경기도 용인시 수지구', '010-2019-8723', 5.00, 5.00, 'kk@naver.com',0);

insert into userinfo(u_id, u_name, u_pass, u_image, u_age, u_gen, u_zipcode, u_addr, u_tel, u_grade, u_attend, u_email, u_apply) 
values('youngin', '민영인', '1234', 'in.jpg', 28, '여', '797-789', '서울특별시 서초구 양재동', '010-1111-2222', 4.00, 5.00, 'kk@naver.com',0);

insert into userinfo(u_id, u_name, u_pass, u_image, u_age, u_gen, u_zipcode, u_addr, u_tel, u_grade, u_attend, u_email, u_apply) 
values('hmmmm', '연관흠', '1234', 'hmm.jpg', 28, '남', '797-789', '서울특별시 서초구 양재동', '010-3333-4444', 3.15, 3.00, 'kk@naver.com',0);

insert into userinfo(u_id, u_name, u_pass, u_image, u_age, u_gen, u_zipcode, u_addr, u_tel, u_grade, u_attend, u_email, u_apply) 
values('sungho', '권성호', '1234', 'ho.jpg', 26, '남', '797-789', '경기도 용인시 수지구', '010-5555-6666', 4.00, 4.00, 'kk@naver.com',0);

insert into userinfo(u_id, u_name, u_pass, u_image, u_age, u_gen, u_zipcode, u_addr, u_tel, u_grade, u_attend, u_email, u_apply, u_npeople) 
values('admin', '관리자', '1234', ' ', 99, '남', ' ', ' ', ' ', 0, 0, ' ',0, 0);

-----------zipcode--------------------------
drop sequence zipcode_seq;

create sequence zipcode_seq 
start with 1 
increment by 1 
nocycle 
nocache;

insert into zipcode(seq, zipcode, sido, gugun, dong, ri, bunji) 
values(zipcode_seq.nextval, '464-456', '경기도 광주시', ' ', '태전동', ' ', ' ');


insert into zipcode(seq, zipcode, sido, gugun, dong, ri, bunji) 
values(zipcode_seq.nextval, '797-789', '경기도 용인시', '수지구', '신봉동', ' ', ' ');

-------후기-----------------------
drop sequence review_seq;

create sequence review_seq 
start with 1 
increment by 1 
nocycle 
nocache;

insert into review(r_num, u_id, r_title, r_content, r_date, r_count) 
values(review_seq.nextval, 'kilsoon', '신나는여행~!!', '길동무에서 새로운친구들과 함께 즐거운 여행!', '15/07/10', 135);

insert into review(r_num, u_id, r_title, r_content, r_date, r_count) 
values(review_seq.nextval, 'sungmin', '우울하다...', '여행중에 비가.... 슬프네요!', '15/07/11', 55);

insert into review(r_num, u_id, r_title, r_content, r_date, r_count) 
values(1, 'kilsoon', '신나는여행~!!', '길동무에서 새로운친구들과 함께 즐거운 여행!', '15/07/10', 135);

insert into review(r_num, u_id, r_title, r_content, r_date, r_count) 
values(2, 'sungmin', '우울하다...', '여행중에 비가.... 슬프네요!', '15/07/11', 55);


------------reviewreply--------------------
drop sequence reviewreply_seq;

create sequence reviewreply_seq 
start with 1 
increment by 1 
nocycle 
nocache; 

insert into reviewreply(rr_num, r_num, u_id, rr_date, rr_content) 
values(reviewreply_seq.nextval, 1, 'kilsoon', '15/07/10', '즐거워보이네요!');
insert into reviewreply(rr_num, r_num, u_id, rr_date, rr_content) 
values(reviewreply_seq.nextval, 1, 'sungmin', '15/07/12', '나도 가고 싶어 젠장아아오 아놔');
insert into reviewreply(rr_num, r_num, u_id, rr_date, rr_content) 
values(reviewreply_seq.nextval, 1, 'kilsoon', '15/07/15', '가자가자가자가자가자가자가자가자가자가자');

insert into reviewreply(rr_num, r_num, u_id, rr_date, rr_content) 
values(reviewreply_seq.nextval, 2, 'sungmin', '15/07/10', '나도껴줘어!');

-------local-------------------------

insert into local(l_name, l_image)
values('안성','ga.jpg');


-------tour--------------------------

insert into tour(t_name, l_name, t_guide, t_addr, t_image) 
values('쁘띠프랑스', '가평', 
	'한국안에 작은 프랑스 문화마을 쁘띠프랑스는 자라나는 아이들의 꿈을 키우는 공간이자 
	함께 하는 어른들에겐 동심을 떠올리게 하는 동화 같은 공간이에요.', 
	'경기도 가평 청평면 고성리 616', 'a.jpg');

insert into tour(t_name, l_name, t_guide, t_addr, t_image) 
values('아침고요수목원', '가평', 
	'아침고요수목원은 한국정원을 정의하고 한국 정원의 모델을 제시하여 한국정원을 정립하여 
	한국자연의 아름다움을 표현하고자 하였습니다.', 
	'경기도 가평 상면 행현리 산 255번지', 'b.jpg');

insert into tour(t_name, l_name, t_guide, t_addr, t_image) 
values('에델바이스 테마파크', '가평' ,
	'스위스의 작은 마을 축제를 주제로 만들어 진 테마파크 에델바이스는 스위스에서 보고 느낀 
	아름다운 숲과 마을, 따뜻하고 친절한 사람들의 미소를 경기도 가평의 아름다운 자연환경 속에서
	 스위스풍의 건축물과 다양한 테마공원을 통해 재현하였습니다.', 
	'경기도 가평 설악면 이천리 304', 'c.jpg');

insert into tour(t_name, l_name, t_guide, t_addr, t_image) 
values('호명호수', '가평', 
	'호명호수는 국내 최초로 건설된 양수식 발전소의 상부저수지로 호명산의 수려한 산세와 
	더불어 넓은 저수지는 백두산 천지를 연상시키는 아름다운 절경이다.', 
	'경기도 가평 청평면 상천리 산392', 'c.jpg');

insert into tour(t_name, l_name, t_guide, t_addr, t_image) 
values('잣향기푸른숲', '가평', 
	'가평은 뛰어난 자연환경을 가지고 있다. 산림이 대부분 침엽수인 잦나무와 소나무·편백나무로 
	이루어져 있다.', 
	'경기도 가평 상면 축령로 171-24', 'c.jpg');

-------board--------------------------
drop sequence board_seq;
	
create sequence board_seq 
start with 1 
increment by 1 
nocycle 
nocache; 

insert into board(b_num, b_content, l_name, b_sdate, b_edate, b_thema, b_title, b_date, u_id, b_recruit, b_count, b_status)
values(board_seq.nextval, '가평에서 다양한 레저와 화끈한 바베큐즐기실분~!!', '가평', '15/07/10', '15/07/15', 
	'레저', '여행을떠나요!즐거운마음으로~~', '15/07/01', 'kilsoon', 5, 3, '모집중');

insert into board(b_num, b_content, l_name, b_sdate, b_edate, b_thema, b_title, b_date, u_id, b_recruit, b_count, b_status)
values(board_seq.nextval, '쁘띠프랑스에서 프랑스의 느낌을 물씬느껴봐~', '가평', '15/07/20', '15/07/25', 
	'힐링', '일상을벗어나 함께 힐링을~~', '15/07/05', 'sungmin', 10, 15, '모집중');

insert into board(b_num, b_content, l_name, b_sdate, b_edate, b_thema, b_title, b_date, u_id, b_recruit, b_count, b_status)
values(1, '가평에서 다양한 레저와 화끈한 바베큐즐기실분~!!', '가평', '15/07/10', '15/07/15', 
	'레저', '여행을떠나요!즐거운마음으로~~', '15/07/01', 'kilsoon', 5, 3, '모집중');

insert into board(b_num, b_content, l_name, b_sdate, b_edate, b_thema, b_title, b_date, u_id, b_recruit, b_count, b_status)
values(2, '쁘띠프랑스에서 프랑스의 느낌을 물씬느껴봐~', '가평', '15/07/20', '15/07/25', 
	'힐링', '일상을벗어나 함께 힐링을~~', '15/07/05', 'sungmin', 10, 15, '모집중');


-------status--------------------------------------

insert into status(b_num, u_id, s_apply, s_attend) 
values(1, 'sungmin', 'Y', 'Y');

insert into status(b_num, u_id, s_apply, s_attend) 
values(2, 'kilsoon', 'N', 'N');

------------boardreply------------------------------
drop sequence boardreply_seq;

create sequence boardreply_seq 
start with 1 
increment by 1 
nocycle 
nocache; 

insert into  boardreply(br_num, b_num, u_id, br_date, br_content) 
values(boardreply_seq.nextval, 1, 'sungmin', '05/07/02', '저도참석하고싶어요!');

insert into  boardreply(br_num, b_num, u_id, br_date, br_content) 
values(boardreply_seq.nextval, 2, 'kilsoon', '05/07/22', '나는나는???');


-------------------------------7월 23일 테이블 수정밑 데이터 추가--------------------------
drop table tour;

--관광테이블
create table tour(
			t_name	varchar2(20)  primary key,
            l_name	varchar2(20)  references local(l_name),
			t_image varchar2(50)  not null
);


alter table local drop (l_subject);
alter table local drop (l_guide);

UPDATE local SET l_image='가평.png' WHERE l_name='가평';
insert into local values ('화성', '화성소개.png');
insert into local values ('가평', '가평소개.png');
insert into local values ('파주', '파주소개.png');
insert into local values ('평택', '평택소개.png');
insert into local values ('연천', '연천소개.png');
insert into local values ('여주', '여주소개.png');
insert into local values ('양평', '양평소개.png');
insert into local values ('안성', '안성소개.png');
insert into local values ('성남', '성남소개.png');
insert into local values ('과천', '과천소개.png');

insert into tour values('쁘띠프랑스', '가평', '가평-쁘띠프랑스.png');
insert into tour values('아침고요수목원', '가평', '가평-아침고요수목원.png');
insert into tour values('에델바이스', '가평', '가평-에델바이스.png');
insert into tour values('잣향기푸른숲', '가평', '가평-잣향기푸른숲.png');
insert into tour values('제이드가든', '가평', '가평-제이드가든.png');
insert into tour values('호명호수', '가평', '가평-호명호수.png');

insert into tour values('국립현대미술관', '과천', '과천-국립현대미술관.png');
insert into tour values('서울대공원', '과천', '과천-서울대공원.png');
insert into tour values('청계저수지', '과천', '과천-청계저수지.png');

insert into tour values('남한산성', '성남', '성남-남한산성.png');
insert into tour values('분당중앙공원', '성남', '성남-분당중앙공원.png');
insert into tour values('성남아트센터', '성남', '성남-성남아트센터.png');
insert into tour values('율동공원', '성남', '성남-율동공원.png');
insert into tour values('잡월드', '성남', '성남-잡월드.png');

insert into tour values('고삼호수', '안성', '안성-고삼호수.png');
insert into tour values('금광호수', '안성', '안성-금광호수.png');
insert into tour values('미리내성지', '안성', '안성-미리내성지.png');
insert into tour values('서운산', '안성', '안성-서운산.png');
insert into tour values('석남사', '안성', '안성-석남사.png');
insert into tour values('안성팜랜드', '안성', '안성-안성팜랜드.png');
insert into tour values('죽주산성', '안성', '안성-죽주산성.png');
insert into tour values('칠장사', '안성', '안성-칠장사.png');

insert into tour values('두물머리', '양평', '양평-두물머리.png');
insert into tour values('들꽃수목원', '양평', '양평-들꽃수목원.png');
insert into tour values('레일바이크', '양평', '양평-레일바이크.png');
insert into tour values('산음자연휴양림', '양평', '양평-산음자연휴양림.png');
insert into tour values('소나기마을', '양평', '양평-소나기마을.png');

insert into tour values('명성황후생가', '여주', '여주-명성황후생가.png');
insert into tour values('세종대왕릉', '여주', '여주-세종대왕릉.png');
insert into tour values('파사성', '여주', '여주-파사성.png');
insert into tour values('황학산수목원', '여주', '여주-황학산수목원.png');
insert into tour values('효종대왕릉', '여주', '여주-효종대왕릉.png');

insert into tour values('석장리미술관', '연천', '연천-석장리미술관.png');
insert into tour values('숭의전지', '연천', '연천-숭의전지.png');
insert into tour values('임진강', '연천', '연천-임진강.png');
insert into tour values('재인폭포', '연천', '연천-재인폭포.png');
insert into tour values('전곡선사박물관', '연천', '연천-전곡선사박물관.png');
insert into tour values('허브빌리지', '연천', '연천-허브빌리지.png');

insert into tour values('벽초지문화수목원', '파주', '파주-벽초지문화수목원.png');
insert into tour values('임진각', '파주', '파주-임진각.png');
insert into tour values('출판도시', '파주', '파주-출판도시.png');
insert into tour values('헤이리예술마을', '파주', '파주-헤이리예술마을.png');

insert into tour values('국제중앙시장', '평택', '평택-국제중앙시장.png');
insert into tour values('평택호', '평택', '평택-평택호.png');
insert into tour values('한국소리터', '평택', '평택-한국소리터.png');

insert into tour values('3.1순국기념관', '화성', '화성-3.1순국기념관.png');
insert into tour values('공룡알화석지', '화성', '화성-공룡알화석지.png');
insert into tour values('국화도', '화성', '화성-국화도.png');
insert into tour values('궁평항', '화성', '화성-궁평항.png');
insert into tour values('비봉생태습지', '화성', '화성-비봉생태습지.png');
insert into tour values('우리꽃식물원', '화성', '화성-우리꽃식물원.png');

-- 테스트

ALTER TABLE reviewreply add CONSTRAINT rr_num FOREIGN KEY (r_num) 
REFERENCES review(r_num) ON DELETE CASCADE;


