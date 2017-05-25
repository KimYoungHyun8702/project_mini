/**
설명
작성자 :  김경혜
최초 작성일 : 2017.05.23
변경이력
-김경혜) movieAvgScore 변수추가 : 2017.05.24수정
xxx 며칠날 수정
*/

package vo;

import java.io.Serializable;

public class Movie implements Serializable {
	private int movieId;
	private String movieTitle;
	private String movieGenre;
	private String movieDirector;
	private 	String movieActor;
	private 	int movieDate;// 개봉년도- int
	private 	String movieImage;
	private 	String movieVideo;
	/****************************************
	 * 부모테이블 : MOVIE, 자식테이블 : BOARD에서 파생된 테이블
	 * 평균평점은 영화 하나에 소속되 있다.
	 * 평균평점을 저장할 instance 변수 선언.
	 * +평균평점별 rank를 저장할 instance 변수 선언.
	 ****************************************/
	private double movieAvgScore;
	private int movieRank;

	public Movie() {
	}

	public Movie(int movieId, String movieTitle, String movieGenre, String movieDirector, String movieActor,
			int movieDate, String movieImage, String movieVideo, double movieAvgScore, int movieRank) {
		this.movieId = movieId;
		this.movieTitle = movieTitle;
		this.movieGenre = movieGenre;
		this.movieDirector = movieDirector;
		this.movieActor = movieActor;
		this.movieDate = movieDate;
		this.movieImage = movieImage;
		this.movieVideo = movieVideo;
		this.movieAvgScore = movieAvgScore;
		this.movieRank = movieRank;
	}



	public int getMovieRank() {
		return movieRank;
	}

	public void setMovieRank(int movieRank) {
		this.movieRank = movieRank;
	}

	public double getMovieAvgScore() {
		return movieAvgScore;
	}


	public void setMovieAvgScore(double movieAvgScore) {
		this.movieAvgScore = movieAvgScore;
	}


	public int getMovieId() {
		return movieId;
	}

	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}

	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public String getMovieGenre() {
		return movieGenre;
	}

	public void setMovieGenre(String movieGenre) {
		this.movieGenre = movieGenre;
	}

	public String getMovieDirector() {
		return movieDirector;
	}

	public void setMovieDirector(String movieDirector) {
		this.movieDirector = movieDirector;
	}

	public String getMovieActor() {
		return movieActor;
	}

	public void setMovieActor(String movieActor) {
		this.movieActor = movieActor;
	}

	public int getMovieDate() {
		return movieDate;
	}

	public void setMovieDate(int movieDate) {
		this.movieDate = movieDate;
	}

	public String getMovieImage() {
		return movieImage;
	}

	public void setMovieImage(String movieImage) {
		this.movieImage = movieImage;
	}

	public String getMovieVideo() {
		return movieVideo;
	}

	public void setMovieVideo(String movieVideo) {
		this.movieVideo = movieVideo;
	}

	@Override
	public String toString() {
		return "Movie [movieId=" + movieId + ", movieTitle=" + movieTitle + ", movieGenre=" + movieGenre
				+ ", movieDirector=" + movieDirector + ", movieActor=" + movieActor + ", movieDate=" + movieDate
				+ ", movieImage=" + movieImage + ", movieVideo=" + movieVideo + ", movieAvgScore=" + movieAvgScore
				+ ", movieRank=" + movieRank + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((movieActor == null) ? 0 : movieActor.hashCode());
		long temp;
		temp = Double.doubleToLongBits(movieAvgScore);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + movieDate;
		result = prime * result + ((movieDirector == null) ? 0 : movieDirector.hashCode());
		result = prime * result + ((movieGenre == null) ? 0 : movieGenre.hashCode());
		result = prime * result + movieId;
		result = prime * result + ((movieImage == null) ? 0 : movieImage.hashCode());
		result = prime * result + movieRank;
		result = prime * result + ((movieTitle == null) ? 0 : movieTitle.hashCode());
		result = prime * result + ((movieVideo == null) ? 0 : movieVideo.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Movie other = (Movie) obj;
		if (movieActor == null) {
			if (other.movieActor != null)
				return false;
		} else if (!movieActor.equals(other.movieActor))
			return false;
		if (Double.doubleToLongBits(movieAvgScore) != Double.doubleToLongBits(other.movieAvgScore))
			return false;
		if (movieDate != other.movieDate)
			return false;
		if (movieDirector == null) {
			if (other.movieDirector != null)
				return false;
		} else if (!movieDirector.equals(other.movieDirector))
			return false;
		if (movieGenre == null) {
			if (other.movieGenre != null)
				return false;
		} else if (!movieGenre.equals(other.movieGenre))
			return false;
		if (movieId != other.movieId)
			return false;
		if (movieImage == null) {
			if (other.movieImage != null)
				return false;
		} else if (!movieImage.equals(other.movieImage))
			return false;
		if (movieRank != other.movieRank)
			return false;
		if (movieTitle == null) {
			if (other.movieTitle != null)
				return false;
		} else if (!movieTitle.equals(other.movieTitle))
			return false;
		if (movieVideo == null) {
			if (other.movieVideo != null)
				return false;
		} else if (!movieVideo.equals(other.movieVideo))
			return false;
		return true;
	}

	

}// end of class