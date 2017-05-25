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

select * from movie;

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
SELECT movie_id,
	movie_title,
	movie_genre,
	movie_director,
	movie_actor,
	movie_date,
	movie_image,
	movie_video
FROM movie


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