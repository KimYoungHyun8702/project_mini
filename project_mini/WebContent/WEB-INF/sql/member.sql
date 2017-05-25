--회원 관리
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





--게시판 관리
drop table board;
create table board(
	board_id number primary key,
	board_title varchar2(30) not null,
	board_date date not null,
	board_content varchar2(500) not null,
	board_score	  number not null,
	board_reference number not null,
	member_id varchar2(20) not null,
	movie_id number ,
	constraint movie_fk foreign key(movie_id) references movie
	);
	
drop table movie;
create table movie(
	movie_id number primary key,
	movie_title varchar2(50) not null,
	movie_genre varchar2(30) not null,
	movie_director varchar2(30) not null,
	movie_actor varchar2(50) not null,
	movie_date date not null,
	movie_image varchar2(1000) not null,
	movie_video varchar2(1000) not null
);

delete from board
delete from movie;

create sequence board_id_seq;
select board_id_seq.nextval FROM dual
drop sequence board_id_seq;

	select board_id, board_title, member_id, board_date, board_reference, board_score
			from(
				select rownum rnum, board_id, board_title, member_id, board_date, board_reference, board_score
				from(
					select board_id, board_title, member_id, board_date, board_reference, board_score from board order by board_id
				)
				where rownum <= 10
			)
			where rnum >= 1
			
select board_id boardId, board_title boardTitle, member_id memberId, board_date boardDate, board_reference boardReference, board_score boardScore
			from(
				select rownum rnum, board_id boardId, board_title boardTitle, member_id memberId, board_date boardDate, board_reference boardReference, board_score boardScore
				from(
					select board_id boardId, board_title boardTitle, member_id memberId, board_date boardDate, board_reference boardReference, board_score boardScore from board order by boardId
				where rownum <= 10
			)
			where rnum >= 2
			
SELECT m.movie_title
FROM board b, movie m
WHERE b.movie_id = m.movie_id(+)

SELECT m.movie_title
FROM board b LEFT JOIN movie m ON b.movie_id = m.movie_id(+) -- 조건은 ON 뒤에 씀ca

UPDATE board
SET board_reference = board_reference + 1
WHERE board_id = 2