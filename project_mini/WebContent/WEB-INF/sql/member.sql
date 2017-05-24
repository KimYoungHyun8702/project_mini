drop table member;
create table member(
	member_id varchar2(20) primary key,
	member_name varchar2(15) not null,
	member_password varchar2(20) not null,
	member_email varchar2(30) not null,
	member_sex varchar2(10) not null,
	member_age number not null
);
select member_id 회원ID , member_name 이름,  member_password 비밀번호, member_email 이메일, member_sex 성별, member_age 나이
from member;

insert into MEMBER
values('kk','kk','kk','kk','kk',66);

delete from MEMBER
where member_id = 'kk'

