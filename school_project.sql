create table student
(
student_id number generated always as identity (start with 1 increment by 1),
first_name varchar2(40) not null,
last_name varchar2(40) not null,
date_of_birth date,
gender char(1),
enrolment_date date,
primary key(student_id)
);


insert all
into student(first_name, last_name, date_of_birth, gender, enrolment_date) 
values ('doniyor','bakirov','23-apr-2000','M','12-sep-2022')
into student(first_name, last_name, date_of_birth, gender, enrolment_date) 
values ('donik','bakirov','23-apr-2000','M','12-sep-2022')
select dummy from dual;

insert into student(first_name, last_name, date_of_birth, gender, enrolment_date) 
values ('nurchik','latipov','29-apr-2005','M','12-sep-2022');

insert into student(first_name, last_name, date_of_birth, gender, enrolment_date) values ('doniyor','bakirov','23-apr-2000','M','12-sep-2022');
insert into student(first_name, last_name, date_of_birth, gender, enrolment_date) values ('toshmat','salimov','12-mar-2000','M','124-sep-2022');

select * from student;

describe student;



CREATE TABLE guardian_type
(
guardian_type_id int generated always as identity (start with 1 increment by 1),
name varchar2(100),
primary key(guardian_type_id)
);

CREATE TABLE guardian (
guardian_id int generated always as identity (start with 1 increment by 1),
given_name varchar2(100),
surname varchar2(100),
email_address varchar2(100),
phone_number varchar2(100),
primary key (guardian_id)
);

CREATE TABLE student_guardian (
student_id int not null,
guardian_type_id int not null,
guardian_id int not null,
constraint fk_student foreign key (student_id) references student (student_id),
constraint fk_guardian_type_id foreign key (guardian_type_id) references guardian_type (guardian_type_id),
constraint fk_guardian foreign key (guardian_id) references guardian (guardian_id)
);


select * from guardian;

insert into guardian (given_name, surname, email_address, phone_number) values ('ganibek','gopirov','sdnje@gmail.com','+998900120545');
insert into guardian (given_name, surname, email_address, phone_number) values ('gafur','latipov','sdsf mkb@gmail.com','+99897858115');
insert into guardian (given_name, surname, email_address, phone_number) values ('doni','nodikov','wreg@gmail.com','+998900120545');
insert into guardian (given_name, surname, email_address, phone_number) values ('gaybulla','bozorov','34nrijfnje@gmail.com','+9989484845');
insert into guardian (given_name, surname, email_address, phone_number) values ('sobir','gopirov','i4utnkd @gmail.com','+9989048815');

insert into guardian_type (name) values ('grandmother');
insert into guardian_type (name) values ('father');
insert into guardian_type (name) values ('grandfather');
insert into guardian_type (name) values ('grandmother');
insert into guardian_type (name) values ('mother');
insert into guardian_type (name) values ('mother');


select * from student;

insert into student_guardian values (1,6,1);
insert into student_guardian values (2,4,4);
insert into student_guardian values (7,2,2);
insert into student_guardian values (4,3,3);
insert into student_guardian values (8,5,5);

select * from student;
select * from guardian;
select * from guardian_type;
select * from student_guardian;

select s.first_name , s.last_name, g.given_name as guardian_given_name, g.surname as guardian_surname, g.phone_number as guardian_phone_number, gt.name from student_guardian sg
join student  s on sg.student_id = s.student_id
join guardian g on sg.guardian_id  = g.guardian_id
join guardian_type gt on sg.guardian_type_id = gt.guardian_type_id;

CREATE TABLE year_level
(
 year_level_id int generated always as identity (start with 1 increment by 1),
 level_name varchar2(50),
 level_order int,
 primary key (year_level_id)
 );
 
 insert into year_level (level_name,level_order) values ('bogcha', 0);
 insert into year_level (level_name,level_order) values ('birinchi sinf', 1);
 insert into year_level (level_name,level_order) values ('ikkinchi sinf', 2);
 insert into year_level (level_name,level_order) values ('uchinchi sinf', 3);
 insert into year_level (level_name,level_order) values ('tortinchi sinf', 4);
 insert into year_level (level_name,level_order) values ('beshinchi sinf', 5);
 insert into year_level (level_name,level_order) values ('oltinchi sinf', 6);
 insert into year_level (level_name,level_order) values ('yettinchi sinf', 7);
 insert into year_level (level_name,level_order) values ('sakkizinchi sinf', 8);
 insert into year_level (level_name,level_order) values ('toqqizinchi sinf', 9);
 insert into year_level (level_name,level_order) values ('oninchi sinf', 10);
 insert into year_level (level_name,level_order) values ('om birinchi sinf', 11);
 
 select * from year_level;
 
 CREATE TABLE school_year
 (
 school_year_id int generated always as identity(start with 1 increment by 1),
 year_name varchar2(100),
 start_date date,
 end_date date,
 primary key (school_year_id)
 );
 
  insert into school_year (year_name, start_date, end_date) values ('2020- yil', '12-sep-2020', '25-may-2021');
  insert into school_year (year_name, start_date, end_date) values ('2021- yil', '4-sep-2020', '27-may-2021');
  insert into school_year (year_name, start_date, end_date) values ('2022- yil', '6-sep-2020', '25-may-2021');
  insert into school_year (year_name, start_date, end_date) values ('2023- yil', '7-sep-2020', '25-may-2021');
  insert into school_year (year_name, start_date, end_date) values ('2024- yil', '5-sep-2020', '25-may-2021');
 
 select * from school_year;
 
CREATE  TABLE student_year_level
(
student_id int not null,
year_level_id int not null,
school_year_id int not null,
score int not null,
constraint fk_studentt foreign key (student_id) references student (student_id),
constraint fk_school_level foreign key (year_level_id) references year_level (year_level_id),
constraint fk_school_year foreign key (school_year_id) references school_year (school_year_id)
);

select * from student;
select * from year_level;
select * from school_year;

insert into student_year_level values (2,12,1, 5);
insert into student_year_level values (8,8,3, 4);
insert into student_year_level values (1,11,1, 5);
insert into student_year_level values (4,6,5, 3);
insert into student_year_level values (2,1,2, 2);
insert into student_year_level values (7,4,4, 4);

select s.first_name, s.last_name, yl.level_name, sy.year_name, sy.start_date, sy.end_date from student_year_level syl
join student s ON syl.student_id = s.student_id
join year_level yl ON syl.year_level_id = yl.year_level_id
join school_year sy ON syl.school_year_id = sy.school_year_id;


CREATE TABLE term
(
term_id int generated always as identity (start with 1 increment by 1 ),
school_year_id int not null,
term_number int not null,
start_date date, 
end_date date,
primary key (term_id),
constraint fk_school_year_idd foreign key (school_year_id) references school_year(school_year_id)
);

select * from school_year;

insert into term (school_year_id, term_number, start_date, end_date) values (2,4,'21-mar-2021', '25-may-2021');
insert into term (school_year_id, term_number, start_date, end_date) values (5,1,'12-sep-2024', '21-oct-2024');
insert into term (school_year_id, term_number, start_date, end_date) values (3,2,'29-oct-2022', '27-dec-2022');
insert into term (school_year_id, term_number, start_date, end_date) values (1,3,'10-jan-2021', '27-feb-2021');
insert into term (school_year_id, term_number, start_date, end_date) values (3,4,'21-mar-2021', '25-may-2021');


select * from term;

CREATE TABLE teacher
(
teacher_id int generated always as identity (start with 1 increment by 1),
first_name varchar2(100),
last_name varchar2(100),
date_of_birth date,
gender char(1),
enrolment_date date,
primary key (teacher_id)
);


insert into teacher (first_name, last_name, date_of_birth, gender, enrolment_date) values ('shakira','nozimova','22-apr-2000','F','11-may-2022');
insert into teacher (first_name, last_name, date_of_birth, gender, enrolment_date) values ('nozim','saidov','20-may-2001','M','12-may-2022');
insert into teacher (first_name, last_name, date_of_birth, gender, enrolment_date) values ('latip','toshmatov','10-jan-1999','F','12-may-2022');
insert into teacher (first_name, last_name, date_of_birth, gender, enrolment_date) values ('karim','nozimova','16-apr-2003','F','19-may-2022');
insert into teacher (first_name, last_name, date_of_birth, gender, enrolment_date) values ('abdulatif','malikova','29-apr-2000','F','21-may-2022');


select * from teacher;

CREATE TABLE period (
period_id int generated always as identity (start with 1 increment by 1),
year_id int not null,
name varchar2(100),
start_time date, 
end_time date,
primary key (period_id),
constraint fk_year_id foreign key (year_id ) references school_year (school_year_id)
);

select * from school_year;

insert into period (year_id, name, start_time, end_time) values (4, '2023-yil', '8-sep-2023','25-may-2024');
insert into period (year_id, name, start_time, end_time) values (2, '2021-yil', '8-sep-2023','25-may-2022');
insert into period (year_id, name, start_time, end_time) values (5, '2024-yil', '5-sep-2024','25-may-2025');
insert into period (year_id, name, start_time, end_time) values (1, '2020-yil', '4-sep-2020','25-may-2021');
insert into period (year_id, name, start_time, end_time) values (3, '2022-yil', '2-sep-2023','25-may-2024');

select * from period;

CREATE TABLE classroom_types 
(
classroom_types_id int generated always as identity (start with 1 increment by 1),
name varchar2(100),
primary key (classroom_types_id)
);

insert into classroom_types (name ) values ('fizika honasi');
insert into classroom_types (name ) values ('kimyo honasi');
insert into classroom_types (name ) values ('rus tili honasi');
insert into classroom_types (name ) values ('ingliz tili honasi');
insert into classroom_types (name ) values ('geografiya honasi');
insert into classroom_types (name ) values ('tarix honasi');
insert into classroom_types (name ) values ('matematika honasi');
insert into classroom_types (name ) values ('nemis tili honasi');


CREATE TABLE classroom
(
classroom_id int generated always as identity (start with 1 increment by 1),
room_type varchar2(50),
room_name int not null,
capacity int,
primary key (classroom_id),
constraint fk_classroom_id foreign key (room_name) references classroom_types(classroom_types_id)
);

insert into classroom (room_type, room_name, capacity) values ('kichkina', 2,20);
insert into classroom (room_type, room_name, capacity) values ('katta', 5,25);
insert into classroom (room_type, room_name, capacity) values ('orta', 3,23);
insert into classroom (room_type, room_name, capacity) values ('kichkina', 1,22);
insert into classroom (room_type, room_name, capacity) values ('katta', 2,20);
insert into classroom (room_type, room_name, capacity) values ('orta', 4,20);


CREATE TABLE subject 
(
subject_id int generated always as identity (start with 1 increment by 1),
subject_name varchar2(100),
primary key (subject_id)
);

insert into subject (subject_name) values ('tarix');
insert into subject (subject_name) values ('ona tili');
insert into subject (subject_name) values ('adabiyot');
insert into subject (subject_name) values ('ingliz tili');
insert into subject (subject_name) values ('rus tili');
insert into subject (subject_name) values ('matematika');
insert into subject (subject_name) values ('fizika');
insert into subject (subject_name) values ('jismoniy tarbiya');
insert into subject (subject_name) values ('mexnat');

select * from teacher;
select * from subject;
select * from term;
select * from classroom;
desc period;

CREATE TABLE class (
class_id int generated always as identity (start with 1 increment by 1 ),
subject_id int not null,
teacher_id int not null,
term_id int not null,
classroom_id int not null,
classroom_types int not null,
primary key (class_id),
constraint fkk_subject_id foreign key (subject_id) references subject (subject_id),
constraint fkk_teacher_id foreign key (teacher_id) references teacher(teacher_id),
constraint fkk_term_id foreign key (term_id) references term (term_id),
constraint fkk_classroom_id foreign key (classroom_id ) references classroom(classroom_id),
constraint fkk_classroom_types foreign key (classroom_types) references classroom_types(classroom_types_id)
);
desc classroom_types;
select * from classroom;

select * from class;

insert into class (subject_id, teacher_id, term_id, classroom_id, classroom_types) values (3,4,5,1,2);
insert into class (subject_id, teacher_id, term_id, classroom_id, classroom_types) values (4,4,5,3,2);
insert into class (subject_id, teacher_id, term_id, classroom_id, classroom_types) values (1,3,5,4,2);
insert into class (subject_id, teacher_id, term_id, classroom_id, classroom_types) values (1,4,5,1,4);
insert into class (subject_id, teacher_id, term_id, classroom_id, classroom_types) values (2,4,5,3,2);

create table student_class
(
student_id int not null,
class_id int not null,
score int not null,
constraint fkk_student_id foreign key (student_id) references student(student_id),
constraint fkk_class_id foreign key (class_id) references class(class_id)
);

select * from student;
insert into student_class values (7,4,5);
insert into student_class values (4,2,4);
insert into student_class values (4,5,3);
insert into student_class values (1,4,4);
insert into student_class values (2,2,5);
insert into student_class values (8,1,5);

select * from student_class;

select * from class;

select s.subject_name, t.first_name as teacher_first_name, t.last_name as teacher_last_name,tm.term_number, tm.start_date, tm.end_date, cl.room_name, ct.name from class  
join subject s on class.subject_id = s.subject_id
join teacher t on class.teacher_id = t.teacher_id
join term tm  on class.term_id = tm.term_id
join classroom cl on class.classroom_id = cl.classroom_id
join classroom_types ct on class.classroom_types = ct.classroom_types_id;

