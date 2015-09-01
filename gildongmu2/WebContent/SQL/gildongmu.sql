drop table zipcode;
drop table reviewreply;
drop table boardreply;
drop table tour;
drop table review;
drop table status;
drop table board;
drop table local;
drop table userinfo;

--지역테이블
create table local(
			l_name	   varchar2(20)  primary key,
			l_image    varchar2(50) not null
);

--관광테이블
create table tour(
			t_name	varchar2(20)  primary key,
            l_name	varchar2(20)  references local(l_name),
			t_image varchar2(50)  not null
);



--회원테이블
create table userinfo(
			u_id	  varchar2(20) primary key,
            u_name	  varchar2(10) Not null,
			u_pass	  varchar2(20) Not null,
			u_image varchar(300) Not null,
			u_age	  number    Not null,
			u_gen	  char(2)      not null check(u_gen in('남','여')),
			u_zipcode  varchar2(7)  Not null,
			u_addr	  varchar2(70) Not null,
			u_tel	  varchar2(13) Not null,
			u_email	  varchar2(40) Not null,
			u_grade	  number,
			u_attend  number,
			u_apply number,
			u_npeople number,
			u_level number
);

alter table userinfo add(u_level number);

--게시판 테이블
create table board(
			b_num	   number         primary key,
            b_content  varchar2(1000) Not null,
			l_name	   varchar2(100)  Not null,
			b_sdate	   date           Not null,
			b_edate	   date           Not null,
			b_thema	   varchar2(100)   Not null,
			b_title	   varchar2(40)   Not null,
			b_date	   date           Not null,
			u_id       varchar2(20)   references userinfo(u_id),
			b_recruit  number         Not null,
			b_count    number         Not null,
			b_status   varchar2(10)   Not null
);

--후기 테이블
create table review(
			r_num	  number         primary key,
			u_id	  varchar2(20)   references userinfo(u_id),
            r_title	  varchar2(40)   Not null,
			r_content varchar2(1000) Not null,
			r_date	  date           Not null,
			r_count	  number         Not null,
			r_image   varchar2(300)  Not null
);

alter table review add(b_num number);
ALTER TABLE review
ADD FOREIGN KEY (b_num) REFERENCES board(b_num);
--모집현황

create table status(
			b_num	  number        references board(b_num),
            u_id	  varchar2(20)  references userinfo(u_id),
			s_apply	  char(1)       default 'N',
			s_attend  char(1)       default 'N',
			s_give char(1) default 'N',
			s_rewrite char(1)       default 'N',
			primary key (b_num, u_id)
);
alter table status add(s_rewrite char(1));

--게시판댓글테이블
create table boardreply(
			br_num	    number        primary key,
			b_num	    number        references board(b_num),
            u_id	    varchar2(20)  references userinfo(u_id),
			br_date	    date          Not null,
			br_content  varchar2(100) Not null
);
				

--후기댓글 테이블
create table reviewreply(
			rr_num	  number         primary key,
			r_num	  number         references review(r_num),
			u_id	  varchar2(20)   references userinfo(u_id),
			rr_date	  date           Not null,
			rr_content varchar2(1000) Not null
);

--주소테이블

create table zipcode(
			seq	      number(5,0)  primary key,
			zipcode	  varchar2(7)  Not null,
			sido	  varchar2(15),
			gugun	  varchar2(30),
			dong	  varchar2(50),
			ri	      varchar2(80),
			bunji	  varchar2(20)
);

create table message(
	m_num number primary key,
	m_sendID varchar2(20),
	m_receiveID varchar2(20),
	m_message varchar2(100),
	m_read char(1) default 'N',
	m_date Date
);

create sequence message_seq 
start with 1 
increment by 1 
nocycle 
nocache;

