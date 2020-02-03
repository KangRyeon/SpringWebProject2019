create database spring_project;
use spring_project;
create table student( stu_number char(12) primary key
			, stu_name varchar(10) not null
			, id varchar(20) not null
			, pw varchar(20) not null
			, nickname varchar(20) 
			, email varchar(30)
			, phone char(11)
			, school varchar(20)
			, major varchar(40));

create table lecture( dept_id int(100) auto_increment primary key
			, dept_number char(6) not null
			, dept_name varchar(30) not null
			, prof_name varchar(10) not null
			, date char(15)
			, start_time time
			, end_time time
			, start_date date
			, end_date date); 

create table attend_lecture( stu_number char(12)
			, dept_id int(100)
			, constraint sNd primary key (stu_number, dept_id)
			, foreign key(stu_number) references student(stu_number)
			, foreign key(dept_id) references lecture(dept_id));

create table note( stu_number char(12)
			, dept_name varchar(30)
			, title varchar(30)
			, note_date date
			, note_content varchar(255)
			, foreign key(stu_number) references student(stu_number));

create table assignment(  stu_number char(12)
			, dept_name varchar(30)
			, assg_name varchar(20)
			, assg_start date
			, assg_end date
			, assg_content varchar(255)
			, foreign key(stu_number) references student(stu_number));
			

insert into student values('2016301001', '������', 'nara97', '1234a', '����������', 'naver@naver.com', '01012345678', '������б�', '��ǻ�Ͱ��а�');
insert into student values('2015301001', '�����', 'shine', '5678b', 'ShiNe', 'shine@naver.com', '01036452837', '������б�', '��ǻ�Ͱ��а�');
insert into student values('2014301058', '�����', 'ummpa', '91011a', 'Ummpa', 'ummpa@naver.com', '01024655871', '������б�', '��ǻ�Ͱ��а�');
insert into student values('2017301002', '������', 'skysound', 'a365s', 'SkySound', 'SSound@google.com', '01033424689', '������б�', '��ǻ�Ͱ��а�');
insert into student values('2016301032', '�ڿ���', 'yejin', 'yejin78!', 'Yejin', 'Yejin@daum.net', '01096755321', '������б�', '��ǻ�Ͱ��а�');
insert into student values('2016301044', '��μ�', 'minseop', 'mins12!', '�����', 'MinMin@naver.com', '01025453131', '������б�', '��ǻ�Ͱ��а�');
insert into student values('2015301042', '�ڵ���', 'doil', 'dodo12', 'KD123', 'doil100@naver.com', '01031982221', '������б�', '��ǻ�Ͱ��а�');
insert into student values('2017301050', '���ȣ', 'KooKoa', 'ain12!', 'KooK', 'Kook@hanmail.net', '01064608271', '������б�', '��ǻ�Ͱ��а�');
insert into student values('2015301046', '������', 'ujin', 'ujin13!', 'yuyujiji', 'yujin13@google.com', '01077988463', '������б�', '��ǻ�Ͱ��а�');
insert into student values('2017301001', '������', 'Dongil', 'ilil44!', 'dongilnara', 'dongilnara@naver.com', '01069214654', '������б�', '��ǻ�Ͱ��а�');
insert into student values('2017301052', '������', 'angel44', 'chunsa12', 'õ������', 'angel44@hanmail.net', '01077782103', '������б�', '��ǻ�Ͱ��а�');
insert into student values('2016301016', '�ڹ̳�', 'mina1013', 'a1s2d3f4!', 'MiNa', 'MiNa@naver.com', '01046507903', '������б�', '��ǻ�Ͱ��а�');
insert into student values('2016301050', '������', 'ohhyun11', '1q2w3e4r!', 'hyuN', 'ohhyun11@daum.net', '01021304498', '������б�', '��ǻ�Ͱ��а�');
insert into student values('2017301014', '�����', 'hwan96', 'parkhw96', '��ʹ�', 'hwan96@google.com', '01099875646', '������б�', '��ǻ�Ͱ��а�');
insert into student values('2015301049', '������', 'eternaleye', 'prrrrrr!', '�����Ѵ�', 'eternaleye@naver.com', '01055504342', '������б�', '��ǻ�Ͱ��а�');

insert into lecture( dept_number, dept_name, prof_name, date, start_time, end_time, start_date, end_date) 
      values("CS1065", "�����ͺ��̽�", "��ö��", "ȭ", "09:00:00", "11:45:00", "2019-03-05", "2019-06-18");
insert into lecture( dept_number, dept_name, prof_name, date, start_time, end_time, start_date, end_date) 
      values("CS1401", "��ǻ�ͳ�Ʈ��ũ", "�迬��", "��", "09:00:00", "11:45:00", "2019-03-07", "2019-06-20");
insert into lecture( dept_number, dept_name, prof_name, date, start_time, end_time, start_date, end_date) 
      values("CS1541", "�����α׷���", "������", "ȭ", "12:00:00", "13:15:00", "2019-03-05", "2019-06-18");
insert into lecture( dept_number, dept_name, prof_name, date, start_time, end_time, start_date, end_date) 
      values("CS1541", "�����α׷���", "������", "��", "12:00:00", "13:15:00", "2019-03-07", "2019-06-20");
insert into lecture( dept_number, dept_name, prof_name, date, start_time, end_time, start_date, end_date) 
      values("EG1001", "�����а���", "��μ�", "��", "12:00:00", "14:45:00", "2019-03-04", "2019-06-21");
insert into lecture( dept_number, dept_name, prof_name, date, start_time, end_time, start_date, end_date) 
      values("EG1004", "�������̱�����������", "������", "ȭ", "12:00:00", "14:45:00", "2019-03-05", "2019-06-18");
insert into lecture( dept_number, dept_name, prof_name, date, start_time, end_time, start_date, end_date) 
      values("GE1002", "��ǥ��а��۾���", "������", "��", "09:00:00", "11:45:00", "2019-03-06", "2019-06-21");
insert into lecture( dept_number, dept_name, prof_name, date, start_time, end_time, start_date, end_date) 
      values("GE6101", "���м��� 1", "�Ȱ���", "��", "09:00:00", "10:15:00", "2019-03-04", "2019-06-20");
insert into lecture( dept_number, dept_name, prof_name, date, start_time, end_time, start_date, end_date) 
      values("GE6101", "���м��� 1", "�Ȱ���", "��", "09:00:00", "10:15:00", "2019-03-06", "2019-06-20");
insert into lecture( dept_number, dept_name, prof_name, date, start_time, end_time, start_date, end_date) 
      values("GE6106", "TOEIC 1", "����", "ȭ", "10:30:00", "14:45:00", "2019-03-05", "2019-06-18");
insert into lecture( dept_number, dept_name, prof_name, date, start_time, end_time, start_date, end_date) 
      values("GE6107", "TOEIC 2", "����Ʈ", "��", "10:30:00", "14:45:00", "2019-03-07", "2019-06-20");
insert into lecture( dept_number, dept_name, prof_name, date, start_time, end_time, start_date, end_date) 
      values("LM5001", "�Һ����ൿ", "�赿��", "��", "12:00:00", "13:15:00", "2019-03-04", "2019-06-20");
insert into lecture( dept_number, dept_name, prof_name, date, start_time, end_time, start_date, end_date) 
      values("LM5001", "�Һ����ൿ", "�赿��", "��", "12:00:00", "13:15:00", "2019-03-06", "2019-06-21");


insert into attend_lecture values(2016301001, 1);
insert into attend_lecture values(2016301001, 2);
insert into attend_lecture values(2016301001, 3);
insert into attend_lecture values(2016301001, 4);
insert into attend_lecture values(2016301001, 7);
insert into attend_lecture values(2016301001, 12);
insert into attend_lecture values(2016301001, 13);

insert into attend_lecture values(2015301001, 1);
insert into attend_lecture values(2015301001, 2);
insert into attend_lecture values(2015301001, 3);
insert into attend_lecture values(2015301001, 4);
insert into attend_lecture values(2015301001, 6);

insert into attend_lecture values(2016301044, 1);
insert into attend_lecture values(2016301044, 3);
insert into attend_lecture values(2016301044, 4);
insert into attend_lecture values(2016301044, 12);
insert into attend_lecture values(2016301044, 13);

insert into attend_lecture values(2014301058, 1);

insert into attend_lecture values(2017301002, 1);
insert into attend_lecture values(2017301002, 2);
insert into attend_lecture values(2017301002, 3);
insert into attend_lecture values(2017301002, 4);

insert into attend_lecture values(2016301032, 2);
insert into attend_lecture values(2016301032, 8);
insert into attend_lecture values(2016301032, 9);

insert into attend_lecture values(2015301042, 2);
insert into attend_lecture values(2015301042, 3);
insert into attend_lecture values(2015301042, 4);

insert into attend_lecture values(2017301050, 8);
insert into attend_lecture values(2017301050, 9);
insert into attend_lecture values(2017301050, 10);

insert into attend_lecture values(2015301046, 1);
insert into attend_lecture values(2015301046, 2);
insert into attend_lecture values(2015301046, 3);
insert into attend_lecture values(2015301046, 4);

insert into attend_lecture values(2017301001, 3);
insert into attend_lecture values(2017301001, 4);
insert into attend_lecture values(2017301001, 7);

insert into attend_lecture values(2017301052, 1);
insert into attend_lecture values(2017301052, 3);
insert into attend_lecture values(2017301052, 4);

insert into attend_lecture values(2016301016, 8);
insert into attend_lecture values(2016301016, 9);

insert into attend_lecture values(2016301050, 12);
insert into attend_lecture values(2016301050, 13);

insert into attend_lecture values(2017301014, 5);
insert into attend_lecture values(2017301014, 7);

insert into attend_lecture values(2015301049, 1);
insert into attend_lecture values(2015301049, 2);
insert into attend_lecture values(2015301049, 3);
insert into attend_lecture values(2015301049, 4);

insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '�����ͺ��̽�', '������ DB', '2019-03-07','DB���� ù�� ���Ǹ� ����.<br/>1. å:�����ͺ��̽���<br/>2.�����ð� ������ 0.5�� ����<br/>3.MySQL����� ��<br/>4.�ڽ��� ��Ʈ�Ͽ��� �����ϸ� ���� ��.');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '��ǻ�ͳ�Ʈ��ũ', '20190422 ��Ʈ��ũ', '2019-04-22','��Ʈ��ũ�� ����־�');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '�����ͺ��̽�', 'DB ���� 1', '2019-04-27','DB�Ⱦ��');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '�����ͺ��̽�', 'DB ���� 2', '2019-04-27','���ع�����λ��̳��̳������ٶ󸶻�ٴپ��ھ�');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '�����α׷���', '0525 �����α׷���', '2019-05-25','�����α׷��� ������ ¯ ����־��');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '��ǻ�ͳ�Ʈ��ũ', '0325 ��ǻ�ͳ�Ʈ��ũ', '2019-03-25','������� ����');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '�����α׷���', '0322 �����α׷���', '2019-03-22','php�� ����');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '�����ͺ��̽�', 'DB ���� 3', '2019-04-30','DB�ʹ� ��̾���');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '�����α׷���', '0330 �����α׷���', '2019-03-30','���̷��� php�� ��̰� ������');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '�����α׷���', '0402 �����α׷���', '2019-04-02','����������� php�� ���ؼ� ���ذ� ���� �����ߴ�.');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '��ǻ�ͳ�Ʈ��ũ', '0412 ��ǻ�ͳ�Ʈ��ũ', '2019-04-12','���ۿ� ���� �����̾���.');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '��ǻ�ͳ�Ʈ��ũ', '0417 ��ǻ�ͳ�Ʈ��ũ', '2019-04-17','�����ð��� �ߴ� ���ۿ� ���ؼ� �� �ڼ��� ������.');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '�����α׷���', '0307 �����α׷���', '2019-03-07','���������� ���� ó����� �̾߱�� ���� ����� ������ �־���.');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '�����ͺ��̽�', 'DB ���� 4', '2019-05-02','������ �����ͺ��̽� �𵨿� ���ؼ� ������.');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '�����ͺ��̽�', 'DB ���� 5', '2019-05-04','SQL����� ó�� �غô�. ���� �������.');

insert into assignment values(2016301001, '�����ͺ��̽�', 'SQL���', '2019-03-14', '2019-03-21', '1. sql db ��ġ�ϱ�<br/>2. spring db �����ϱ�<br/>3. �ش� db�� student table ��������');
insert into assignment values(2016301001, '�����α׷���', '���������', '2019-03-22', '2019-03-29', '����� �Ϻ��ϰ� �����ؿ���');
insert into assignment values(2016301001, '�����ͺ��̽�', 'ȸ��DB����', '2019-04-21', '2019-04-30', 'ȸ��DB������ �ؿ��ÿ�');
insert into assignment values(2016301001, '��ǻ�ͳ�Ʈ��ũ', '��Ʈ��ũ��������', '2019-03-26', '2019-03-30', '�����ð����� ��Ʈ��ũ �����غ�');
insert into assignment values(2016301001, '�����ͺ��̽�', 'mysql ��ɾ�ϱ�', '2019-04-16', '2019-04-20', 'mysql�� ���ʸ�ɾ �ϱ��ؿ���');
insert into assignment values(2016301001, '�����ͺ��̽�', '�����ͺ��̽����� ����', '2019-04-07', '2019-04-12', '�����ͺ��̽��𵨿� ���ؼ� �����ؿ���');
insert into assignment values(2016301001, '��ǻ�ͳ�Ʈ��ũ', 'propagationi�� ����', '2019-03-20', '2019-03-25', 'propagation�� �����ؿ��� �̿� ���õ� �ܾ� ã�ƿ���');
insert into assignment values(2016301001, '��ǥ��а��۾���', '��ǥ�� ���ϴ� �� ����Ʈ', '2019-03-20', '2019-03-25', '��ǥ�� ���ϴ� ����� ���� 2page �ۼ�');


select * from student;
select * from lecture;
select * from attend_lecture;
select * from note;
select * from assignment;

desc student;
desc lecture;
desc attend_lecture order by stu_number desc;
desc note;
desc assignment;
