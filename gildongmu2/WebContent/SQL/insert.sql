---------userinfo--------------------
insert into userinfo(u_id, u_name, u_pass, u_image, u_age, u_gen, u_zipcode, u_addr, u_tel, u_grade, u_attend,u_email, u_apply) 
values('kilsoon', '����', '1111', 'soon.jpg', 28, '��', '464-456', '��⵵ ���ֽ� ������', '010-3001-2486', 4.98, 4.88, 'kk@naver.com',0);

insert into userinfo(u_id, u_name, u_pass, u_image, u_age, u_gen, u_zipcode, u_addr, u_tel, u_grade, u_attend, u_email, u_apply) 
values('sungmin', '������', '1234', 'min.jpg', 28, '��', '797-789', '��⵵ ���ν� ������', '010-2019-8723', 5.00, 5.00, 'kk@naver.com',0);

insert into userinfo(u_id, u_name, u_pass, u_image, u_age, u_gen, u_zipcode, u_addr, u_tel, u_grade, u_attend, u_email, u_apply) 
values('youngin', '�ο���', '1234', 'in.jpg', 28, '��', '797-789', '����Ư���� ���ʱ� ���絿', '010-1111-2222', 4.00, 5.00, 'kk@naver.com',0);

insert into userinfo(u_id, u_name, u_pass, u_image, u_age, u_gen, u_zipcode, u_addr, u_tel, u_grade, u_attend, u_email, u_apply) 
values('hmmmm', '������', '1234', 'hmm.jpg', 28, '��', '797-789', '����Ư���� ���ʱ� ���絿', '010-3333-4444', 3.15, 3.00, 'kk@naver.com',0);

insert into userinfo(u_id, u_name, u_pass, u_image, u_age, u_gen, u_zipcode, u_addr, u_tel, u_grade, u_attend, u_email, u_apply) 
values('sungho', '�Ǽ�ȣ', '1234', 'ho.jpg', 26, '��', '797-789', '��⵵ ���ν� ������', '010-5555-6666', 4.00, 4.00, 'kk@naver.com',0);

insert into userinfo(u_id, u_name, u_pass, u_image, u_age, u_gen, u_zipcode, u_addr, u_tel, u_grade, u_attend, u_email, u_apply, u_npeople) 
values('admin', '������', '1234', ' ', 99, '��', ' ', ' ', ' ', 0, 0, ' ',0, 0);

-----------zipcode--------------------------
drop sequence zipcode_seq;

create sequence zipcode_seq 
start with 1 
increment by 1 
nocycle 
nocache;

insert into zipcode(seq, zipcode, sido, gugun, dong, ri, bunji) 
values(zipcode_seq.nextval, '464-456', '��⵵ ���ֽ�', ' ', '������', ' ', ' ');


insert into zipcode(seq, zipcode, sido, gugun, dong, ri, bunji) 
values(zipcode_seq.nextval, '797-789', '��⵵ ���ν�', '������', '�ź���', ' ', ' ');

-------�ı�-----------------------
drop sequence review_seq;

create sequence review_seq 
start with 1 
increment by 1 
nocycle 
nocache;

insert into review(r_num, u_id, r_title, r_content, r_date, r_count) 
values(review_seq.nextval, 'kilsoon', '�ų��¿���~!!', '�浿������ ���ο�ģ����� �Բ� ��ſ� ����!', '15/07/10', 135);

insert into review(r_num, u_id, r_title, r_content, r_date, r_count) 
values(review_seq.nextval, 'sungmin', '����ϴ�...', '�����߿� ��.... �����׿�!', '15/07/11', 55);

insert into review(r_num, u_id, r_title, r_content, r_date, r_count) 
values(1, 'kilsoon', '�ų��¿���~!!', '�浿������ ���ο�ģ����� �Բ� ��ſ� ����!', '15/07/10', 135);

insert into review(r_num, u_id, r_title, r_content, r_date, r_count) 
values(2, 'sungmin', '����ϴ�...', '�����߿� ��.... �����׿�!', '15/07/11', 55);


------------reviewreply--------------------
drop sequence reviewreply_seq;

create sequence reviewreply_seq 
start with 1 
increment by 1 
nocycle 
nocache; 

insert into reviewreply(rr_num, r_num, u_id, rr_date, rr_content) 
values(reviewreply_seq.nextval, 1, 'kilsoon', '15/07/10', '��ſ����̳׿�!');
insert into reviewreply(rr_num, r_num, u_id, rr_date, rr_content) 
values(reviewreply_seq.nextval, 1, 'sungmin', '15/07/12', '���� ���� �;� ����ƾƿ� �Ƴ�');
insert into reviewreply(rr_num, r_num, u_id, rr_date, rr_content) 
values(reviewreply_seq.nextval, 1, 'kilsoon', '15/07/15', '���ڰ��ڰ��ڰ��ڰ��ڰ��ڰ��ڰ��ڰ��ڰ���');

insert into reviewreply(rr_num, r_num, u_id, rr_date, rr_content) 
values(reviewreply_seq.nextval, 2, 'sungmin', '15/07/10', '���������!');

-------local-------------------------

insert into local(l_name, l_image)
values('�ȼ�','ga.jpg');


-------tour--------------------------

insert into tour(t_name, l_name, t_guide, t_addr, t_image) 
values('�ڶ�������', '����', 
	'�ѱ��ȿ� ���� ������ ��ȭ���� �ڶ��������� �ڶ󳪴� ���̵��� ���� Ű��� �������� 
	�Բ� �ϴ� ��鿡�� ������ ���ø��� �ϴ� ��ȭ ���� �����̿���.', 
	'��⵵ ���� û��� ���� 616', 'a.jpg');

insert into tour(t_name, l_name, t_guide, t_addr, t_image) 
values('��ħ�������', '����', 
	'��ħ��������� �ѱ������� �����ϰ� �ѱ� ������ ���� �����Ͽ� �ѱ������� �����Ͽ� 
	�ѱ��ڿ��� �Ƹ��ٿ��� ǥ���ϰ��� �Ͽ����ϴ�.', 
	'��⵵ ���� ��� ������ �� 255����', 'b.jpg');

insert into tour(t_name, l_name, t_guide, t_addr, t_image) 
values('�������̽� �׸���ũ', '����' ,
	'�������� ���� ���� ������ ������ ����� �� �׸���ũ �������̽��� ���������� ���� ���� 
	�Ƹ��ٿ� ���� ����, �����ϰ� ģ���� ������� �̼Ҹ� ��⵵ ������ �Ƹ��ٿ� �ڿ�ȯ�� �ӿ���
	 ������ǳ�� ���๰�� �پ��� �׸������� ���� �����Ͽ����ϴ�.', 
	'��⵵ ���� ���Ǹ� ��õ�� 304', 'c.jpg');

insert into tour(t_name, l_name, t_guide, t_addr, t_image) 
values('ȣ��ȣ��', '����', 
	'ȣ��ȣ���� ���� ���ʷ� �Ǽ��� ����� �������� ����������� ȣ����� ������ �꼼�� 
	���Ҿ� ���� �������� ��λ� õ���� �����Ű�� �Ƹ��ٿ� �����̴�.', 
	'��⵵ ���� û��� ��õ�� ��392', 'c.jpg');

insert into tour(t_name, l_name, t_guide, t_addr, t_image) 
values('�����Ǫ����', '����', 
	'������ �پ �ڿ�ȯ���� ������ �ִ�. �긲�� ��κ� ħ������ �泪���� �ҳ�������鳪���� 
	�̷���� �ִ�.', 
	'��⵵ ���� ��� ��ɷ� 171-24', 'c.jpg');

-------board--------------------------
drop sequence board_seq;
	
create sequence board_seq 
start with 1 
increment by 1 
nocycle 
nocache; 

insert into board(b_num, b_content, l_name, b_sdate, b_edate, b_thema, b_title, b_date, u_id, b_recruit, b_count, b_status)
values(board_seq.nextval, '���򿡼� �پ��� ������ ȭ���� �ٺ�ť���Ǻ�~!!', '����', '15/07/10', '15/07/15', 
	'����', '������������!��ſ������~~', '15/07/01', 'kilsoon', 5, 3, '������');

insert into board(b_num, b_content, l_name, b_sdate, b_edate, b_thema, b_title, b_date, u_id, b_recruit, b_count, b_status)
values(board_seq.nextval, '�ڶ����������� �������� ������ ����������~', '����', '15/07/20', '15/07/25', 
	'����', '�ϻ������ �Բ� ������~~', '15/07/05', 'sungmin', 10, 15, '������');

insert into board(b_num, b_content, l_name, b_sdate, b_edate, b_thema, b_title, b_date, u_id, b_recruit, b_count, b_status)
values(1, '���򿡼� �پ��� ������ ȭ���� �ٺ�ť���Ǻ�~!!', '����', '15/07/10', '15/07/15', 
	'����', '������������!��ſ������~~', '15/07/01', 'kilsoon', 5, 3, '������');

insert into board(b_num, b_content, l_name, b_sdate, b_edate, b_thema, b_title, b_date, u_id, b_recruit, b_count, b_status)
values(2, '�ڶ����������� �������� ������ ����������~', '����', '15/07/20', '15/07/25', 
	'����', '�ϻ������ �Բ� ������~~', '15/07/05', 'sungmin', 10, 15, '������');


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
values(boardreply_seq.nextval, 1, 'sungmin', '05/07/02', '���������ϰ�;��!');

insert into  boardreply(br_num, b_num, u_id, br_date, br_content) 
values(boardreply_seq.nextval, 2, 'kilsoon', '05/07/22', '���³���???');


-------------------------------7�� 23�� ���̺� ������ ������ �߰�--------------------------
drop table tour;

--�������̺�
create table tour(
			t_name	varchar2(20)  primary key,
            l_name	varchar2(20)  references local(l_name),
			t_image varchar2(50)  not null
);


alter table local drop (l_subject);
alter table local drop (l_guide);

UPDATE local SET l_image='����.png' WHERE l_name='����';
insert into local values ('ȭ��', 'ȭ���Ұ�.png');
insert into local values ('����', '����Ұ�.png');
insert into local values ('����', '���ּҰ�.png');
insert into local values ('����', '���üҰ�.png');
insert into local values ('��õ', '��õ�Ұ�.png');
insert into local values ('����', '���ּҰ�.png');
insert into local values ('����', '����Ұ�.png');
insert into local values ('�ȼ�', '�ȼ��Ұ�.png');
insert into local values ('����', '�����Ұ�.png');
insert into local values ('��õ', '��õ�Ұ�.png');

insert into tour values('�ڶ�������', '����', '����-�ڶ�������.png');
insert into tour values('��ħ�������', '����', '����-��ħ�������.png');
insert into tour values('�������̽�', '����', '����-�������̽�.png');
insert into tour values('�����Ǫ����', '����', '����-�����Ǫ����.png');
insert into tour values('���̵尡��', '����', '����-���̵尡��.png');
insert into tour values('ȣ��ȣ��', '����', '����-ȣ��ȣ��.png');

insert into tour values('��������̼���', '��õ', '��õ-��������̼���.png');
insert into tour values('��������', '��õ', '��õ-��������.png');
insert into tour values('û��������', '��õ', '��õ-û��������.png');

insert into tour values('���ѻ꼺', '����', '����-���ѻ꼺.png');
insert into tour values('�д��߾Ӱ���', '����', '����-�д��߾Ӱ���.png');
insert into tour values('������Ʈ����', '����', '����-������Ʈ����.png');
insert into tour values('��������', '����', '����-��������.png');
insert into tour values('�����', '����', '����-�����.png');

insert into tour values('���ȣ��', '�ȼ�', '�ȼ�-���ȣ��.png');
insert into tour values('�ݱ�ȣ��', '�ȼ�', '�ȼ�-�ݱ�ȣ��.png');
insert into tour values('�̸�������', '�ȼ�', '�ȼ�-�̸�������.png');
insert into tour values('�����', '�ȼ�', '�ȼ�-�����.png');
insert into tour values('������', '�ȼ�', '�ȼ�-������.png');
insert into tour values('�ȼ��ʷ���', '�ȼ�', '�ȼ�-�ȼ��ʷ���.png');
insert into tour values('���ֻ꼺', '�ȼ�', '�ȼ�-���ֻ꼺.png');
insert into tour values('ĥ���', '�ȼ�', '�ȼ�-ĥ���.png');

insert into tour values('�ι��Ӹ�', '����', '����-�ι��Ӹ�.png');
insert into tour values('��ɼ����', '����', '����-��ɼ����.png');
insert into tour values('���Ϲ���ũ', '����', '����-���Ϲ���ũ.png');
insert into tour values('�����ڿ��޾縲', '����', '����-�����ڿ��޾縲.png');
insert into tour values('�ҳ��⸶��', '����', '����-�ҳ��⸶��.png');

insert into tour values('��Ȳ�Ļ���', '����', '����-��Ȳ�Ļ���.png');
insert into tour values('������ո�', '����', '����-������ո�.png');
insert into tour values('�Ļ缺', '����', '����-�Ļ缺.png');
insert into tour values('Ȳ�л�����', '����', '����-Ȳ�л�����.png');
insert into tour values('ȿ����ո�', '����', '����-ȿ����ո�.png');

insert into tour values('���帮�̼���', '��õ', '��õ-���帮�̼���.png');
insert into tour values('��������', '��õ', '��õ-��������.png');
insert into tour values('������', '��õ', '��õ-������.png');
insert into tour values('��������', '��õ', '��õ-��������.png');
insert into tour values('�����ڹ���', '��õ', '��õ-�����ڹ���.png');
insert into tour values('��������', '��õ', '��õ-��������.png');

insert into tour values('��������ȭ�����', '����', '����-��������ȭ�����.png');
insert into tour values('������', '����', '����-������.png');
insert into tour values('���ǵ���', '����', '����-���ǵ���.png');
insert into tour values('���̸���������', '����', '����-���̸���������.png');

insert into tour values('�����߾ӽ���', '����', '����-�����߾ӽ���.png');
insert into tour values('����ȣ', '����', '����-����ȣ.png');
insert into tour values('�ѱ��Ҹ���', '����', '����-�ѱ��Ҹ���.png');

insert into tour values('3.1��������', 'ȭ��', 'ȭ��-3.1��������.png');
insert into tour values('�����ȭ����', 'ȭ��', 'ȭ��-�����ȭ����.png');
insert into tour values('��ȭ��', 'ȭ��', 'ȭ��-��ȭ��.png');
insert into tour values('������', 'ȭ��', 'ȭ��-������.png');
insert into tour values('������½���', 'ȭ��', 'ȭ��-������½���.png');
insert into tour values('�츮�ɽĹ���', 'ȭ��', 'ȭ��-�츮�ɽĹ���.png');

-- �׽�Ʈ

ALTER TABLE reviewreply add CONSTRAINT rr_num FOREIGN KEY (r_num) 
REFERENCES review(r_num) ON DELETE CASCADE;


