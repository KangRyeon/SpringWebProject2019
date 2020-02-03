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
			

insert into student values('2016301001', '윤나라', 'nara97', '1234a', '맛좋은동산', 'naver@naver.com', '01012345678', '서경대학교', '컴퓨터과학과');
insert into student values('2015301001', '김빛나', 'shine', '5678b', 'ShiNe', 'shine@naver.com', '01036452837', '서경대학교', '컴퓨터과학과');
insert into student values('2014301058', '김명훈', 'ummpa', '91011a', 'Ummpa', 'ummpa@naver.com', '01024655871', '서경대학교', '컴퓨터과학과');
insert into student values('2017301002', '이찬우', 'skysound', 'a365s', 'SkySound', 'SSound@google.com', '01033424689', '서경대학교', '컴퓨터과학과');
insert into student values('2016301032', '박예진', 'yejin', 'yejin78!', 'Yejin', 'Yejin@daum.net', '01096755321', '서경대학교', '컴퓨터과학과');
insert into student values('2016301044', '김민섭', 'minseop', 'mins12!', '댕댕이', 'MinMin@naver.com', '01025453131', '서경대학교', '컴퓨터과학과');
insert into student values('2015301042', '박도일', 'doil', 'dodo12', 'KD123', 'doil100@naver.com', '01031982221', '서경대학교', '컴퓨터과학과');
insert into student values('2017301050', '고경호', 'KooKoa', 'ain12!', 'KooK', 'Kook@hanmail.net', '01064608271', '서경대학교', '컴퓨터과학과');
insert into student values('2015301046', '김유진', 'ujin', 'ujin13!', 'yuyujiji', 'yujin13@google.com', '01077988463', '서경대학교', '컴퓨터과학과');
insert into student values('2017301001', '강동일', 'Dongil', 'ilil44!', 'dongilnara', 'dongilnara@naver.com', '01069214654', '서경대학교', '컴퓨터과학과');
insert into student values('2017301052', '신혜지', 'angel44', 'chunsa12', '천사혜지', 'angel44@hanmail.net', '01077782103', '서경대학교', '컴퓨터과학과');
insert into student values('2016301016', '박미나', 'mina1013', 'a1s2d3f4!', 'MiNa', 'MiNa@naver.com', '01046507903', '서경대학교', '컴퓨터과학과');
insert into student values('2016301050', '오현영', 'ohhyun11', '1q2w3e4r!', 'hyuN', 'ohhyun11@daum.net', '01021304498', '서경대학교', '컴퓨터과학과');
insert into student values('2017301014', '박희완', 'hwan96', 'parkhw96', '희와니', 'hwan96@google.com', '01099875646', '서경대학교', '컴퓨터과학과');
insert into student values('2015301049', '이찬영', 'eternaleye', 'prrrrrr!', '영원한눈', 'eternaleye@naver.com', '01055504342', '서경대학교', '컴퓨터과학과');

insert into lecture( dept_number, dept_name, prof_name, date, start_time, end_time, start_date, end_date) 
      values("CS1065", "데이터베이스", "김철수", "화", "09:00:00", "11:45:00", "2019-03-05", "2019-06-18");
insert into lecture( dept_number, dept_name, prof_name, date, start_time, end_time, start_date, end_date) 
      values("CS1401", "컴퓨터네트워크", "김연아", "목", "09:00:00", "11:45:00", "2019-03-07", "2019-06-20");
insert into lecture( dept_number, dept_name, prof_name, date, start_time, end_time, start_date, end_date) 
      values("CS1541", "웹프로그래밍", "박지성", "화", "12:00:00", "13:15:00", "2019-03-05", "2019-06-18");
insert into lecture( dept_number, dept_name, prof_name, date, start_time, end_time, start_date, end_date) 
      values("CS1541", "웹프로그래밍", "박지성", "목", "12:00:00", "13:15:00", "2019-03-07", "2019-06-20");
insert into lecture( dept_number, dept_name, prof_name, date, start_time, end_time, start_date, end_date) 
      values("EG1001", "영어학개론", "김민섭", "월", "12:00:00", "14:45:00", "2019-03-04", "2019-06-21");
insert into lecture( dept_number, dept_name, prof_name, date, start_time, end_time, start_date, end_date) 
      values("EG1004", "다인종미국문하의이해", "박인혁", "화", "12:00:00", "14:45:00", "2019-03-05", "2019-06-18");
insert into lecture( dept_number, dept_name, prof_name, date, start_time, end_time, start_date, end_date) 
      values("GE1002", "발표토론과글쓰기", "신이정", "금", "09:00:00", "11:45:00", "2019-03-06", "2019-06-21");
insert into lecture( dept_number, dept_name, prof_name, date, start_time, end_time, start_date, end_date) 
      values("GE6101", "대학수학 1", "안가경", "월", "09:00:00", "10:15:00", "2019-03-04", "2019-06-20");
insert into lecture( dept_number, dept_name, prof_name, date, start_time, end_time, start_date, end_date) 
      values("GE6101", "대학수학 1", "안가경", "수", "09:00:00", "10:15:00", "2019-03-06", "2019-06-20");
insert into lecture( dept_number, dept_name, prof_name, date, start_time, end_time, start_date, end_date) 
      values("GE6106", "TOEIC 1", "딜란", "화", "10:30:00", "14:45:00", "2019-03-05", "2019-06-18");
insert into lecture( dept_number, dept_name, prof_name, date, start_time, end_time, start_date, end_date) 
      values("GE6107", "TOEIC 2", "라이트", "목", "10:30:00", "14:45:00", "2019-03-07", "2019-06-20");
insert into lecture( dept_number, dept_name, prof_name, date, start_time, end_time, start_date, end_date) 
      values("LM5001", "소비자행동", "김동성", "월", "12:00:00", "13:15:00", "2019-03-04", "2019-06-20");
insert into lecture( dept_number, dept_name, prof_name, date, start_time, end_time, start_date, end_date) 
      values("LM5001", "소비자행동", "김동성", "수", "12:00:00", "13:15:00", "2019-03-06", "2019-06-21");


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

insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '데이터베이스', '오늘의 DB', '2019-03-07','DB수업 첫날 강의를 들음.<br/>1. 책:데이터베이스론<br/>2.수업시간 지각시 0.5점 감점<br/>3.MySQL사용할 것<br/>4.자신의 노트북에서 구현하면 좋을 것.');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '컴퓨터네트워크', '20190422 네트워크', '2019-04-22','네트워크는 재미있어');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '데이터베이스', 'DB 수업 1', '2019-04-27','DB싫어요');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '데이터베이스', 'DB 수업 2', '2019-04-27','동해물과백두산이날이난가나다라마사바다아자아');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '웹프로그래밍', '0525 웹프로그래밍', '2019-05-25','웹프로그래밍 수업은 짱 재미있어요');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '컴퓨터네트워크', '0325 컴퓨터네트워크', '2019-03-25','라우팅의 이해');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '웹프로그래밍', '0322 웹프로그래밍', '2019-03-22','php의 이해');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '데이터베이스', 'DB 수업 3', '2019-04-30','DB너무 재미없다');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '웹프로그래밍', '0330 웹프로그래밍', '2019-03-30','왜이렇게 php는 재미가 없을까');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '웹프로그래밍', '0402 웹프로그래밍', '2019-04-02','이제어느정도 php에 대해서 이해가 가기 시작했다.');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '컴퓨터네트워크', '0412 컴퓨터네트워크', '2019-04-12','버퍼에 관한 수업이었다.');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '컴퓨터네트워크', '0417 컴퓨터네트워크', '2019-04-17','저번시간에 했던 버퍼에 대해서 더 자세히 공부함.');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '웹프로그래밍', '0307 웹프로그래밍', '2019-03-07','수업내용이 거의 처음듣는 이야기라 많이 어려움 과제도 있었다.');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '데이터베이스', 'DB 수업 4', '2019-05-02','관계형 데이터베이스 모델에 대해서 공부함.');
insert into note(stu_number, dept_name, title, note_date, note_content) values(2016301001, '데이터베이스', 'DB 수업 5', '2019-05-04','SQL사용을 처음 해봤다. 많이 어려웠음.');

insert into assignment values(2016301001, '데이터베이스', 'SQL사용', '2019-03-14', '2019-03-21', '1. sql db 설치하기<br/>2. spring db 생성하기<br/>3. 해당 db에 student table 만들어오기');
insert into assignment values(2016301001, '웹프로그래밍', '라우팅이해', '2019-03-22', '2019-03-29', '라우팅 완벽하게 이해해오기');
insert into assignment values(2016301001, '데이터베이스', '회원DB구성', '2019-04-21', '2019-04-30', '회원DB구성을 해오시오');
insert into assignment values(2016301001, '컴퓨터네트워크', '네트워크종류퀴즈', '2019-03-26', '2019-03-30', '다음시간까지 네트워크 퀴즈준비');
insert into assignment values(2016301001, '데이터베이스', 'mysql 명령어암기', '2019-04-16', '2019-04-20', 'mysql의 기초명령어를 암기해오기');
insert into assignment values(2016301001, '데이터베이스', '데이터베이스모델의 이해', '2019-04-07', '2019-04-12', '데이터베이스모델에 대해서 공부해오기');
insert into assignment values(2016301001, '컴퓨터네트워크', 'propagationi의 이해', '2019-03-20', '2019-03-25', 'propagation을 공부해오고 이와 관련된 단어 찾아오기');
insert into assignment values(2016301001, '발표토론과글쓰기', '발표를 잘하는 법 리포트', '2019-03-20', '2019-03-25', '발표를 잘하는 방법에 대해 2page 작성');


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
