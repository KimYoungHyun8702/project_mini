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
values('wish','kk','kk','kk','kk',66);

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
	
--영화 관리
drop table movie;
create table movie(
	movie_id number primary key,
	movie_title varchar2(50) not null,
	movie_genre varchar2(50) not null,--30>50으로변경
	movie_director varchar2(50) not null,--30>50으로변경
	movie_actor varchar2(300) not null,--50>300으로변경
	movie_date number not null,
	movie_image varchar2(1000) not null,
	movie_video varchar2(1000) not null
);

-- 추천수 테이블
drop table reference;
create table Reference(
	board_id number,
	member_id varchar2(20),
	constraint board_fk foreign key(board_id) references board,
	constraint member_fk foreign key(member_id) references member
);

select * from movie;

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

<<<<<<< HEAD
select *
from board



select * from member

SELECT reference
FROM reference
WHERE member_id = djestiny4444

delete from reference;

--게시글 더미 데이터
insert into board values(board_id_seq.nextval,'게시글1','asdf',)
>>>>>>> branch 'master' of https://github.com/KimYoungHyun8702/project_mini.git

--영화 쿼리문 연습

--평점매길 테이블(test용)
drop table board;
create table board(
	board_id number primary key,
	board_score number not null,
	movie_id number not null
);

insert into board values(1,2,1);
insert into board values(2,4,1);
insert into board values(3,3,2);
insert into board values(4,5,1);
insert into board values(5,2,3);
insert into board values(6,5,3);
insert into board values(7,5,4);
insert into board values(8,1,5);
insert into board values(9,3,5);
insert into board values(10,5,6);



select * from board order by movie_id;
select movie_id, sum(board_score),count(board_score) from board group by movie_id;
select movie_id, sum(board_score)/count(board_score) from board group by movie_id order by movie_id;



--쿼리문
--전체 영화정보를 조회하는 메소드
--List<Movie> selectAllMovie(Connection conn) throws SQLException;
		SELECT m.movie_id,
				m.movie_title,
				m.movie_genre,
				m.movie_director,
				m.movie_actor,
				m.movie_date,
				m.movie_image,
				m.movie_video,
				b.movie_avg_score,
		FROM movie m,(
			SELECT movie_id, sum(board_score)/count(board_score) movie_avg_score
			FROM board 
			GROUP BY movie_id) b 
		WHERE m.movie_id=b.movie_id(+)


--매개변수로 받은 영화ID와 일치하는 영화정보를 영화 테이블에서 조회하는 메소드
--Movie selectMovieById(Connection conn, int movieId) throws SQLException;
SELECT movie_id,
	movie_title,
	movie_genre,
	movie_director,
	movie_actor,
	movie_date,
	movie_image,
	movie_video
FROM movie
WHERE movie_id=1

--매개변수로 받은 영화제목과 일치하는 영화정보를 조회하는 메소드.이름은 부분일치로 조회한다.
--List<Movie> selectMovieByName(Connection conn, String movieTitle) throws SQLException;
SELECT movie_id,
	movie_title,
	movie_image
FROM movie
WHERE movie_title like '%킹스맨%'

--매개변수로 받은 영화장르와 일치하는 영화정보를 조회하는 메소드.
--List<Movie> selectMovieByGenre(Connection conn, String movieGenre) throws SQLException;
SELECT movie_id,
	movie_title,
	movie_image
FROM movie
WHERE movie_genre like '%액션%'

--매개변수로 받은 영화개봉년도와 일치하는 영화정보를 조회하는 메소드.
--List<Movie> selectMovieByDate(Connection conn, int movieDate) throws SQLException;
SELECT movie_id,
	movie_title,
	movie_image
FROM movie
WHERE movie_date=2016

--평점이 입력된 영화들만 영화정보를 조회하는 메소드 --rank
--List<Movie> selectMovieRank
		SELECT m.movie_id,
				m.movie_title,
				m.movie_genre,
				m.movie_director,
				m.movie_actor,
				m.movie_date,
				m.movie_image,
				m.movie_video,
				b.movie_avg_score,
				RANK() OVER(ORDER BY b.movie_avg_score desc)
		FROM movie m,(
			SELECT movie_id, sum(board_score)/count(board_score) movie_avg_score
			FROM board 
			GROUP BY movie_id) b 
		WHERE m.movie_id=b.movie_id(+) AND b.movie_avg_score IS NOT NULL
		
--등록된 영화수 
--int countMovie(SqlSession session) 
SELECT count(*)
FROM movie

--조인쿼리문(영화별 평점평균)
--매개변수로 받은 영화ID와 일치하는 평균평점을 조회하는 메소드.
--double movieAverageScore(Connection conn, int movieId) throws SQLException;
SELECT m.*, b.movie_avg_score
FROM movie m,(
	SELECT movie_id, sum(board_score)/count(board_score) movie_avg_score
	FROM board 
	GROUP BY movie_id) b 
WHERE m.movie_id=b.movie_id(+) AND m.movie_id=1


--(전체)영화별 평점평균 조회
SELECT m.*, b.movie_avg_score
FROM movie m,(
	SELECT movie_id, sum(board_score)/count(board_score) movie_avg_score
	FROM board 
	GROUP BY movie_id) b 
WHERE m.movie_id=b.movie_id(+)
order by m.movie_id



select m.movie_id, b.board_score
from movie m, board b 
where m.movie_id=b.b_movie_id(+) 
order by m.movie_id 
group by b.b_movie_id;
