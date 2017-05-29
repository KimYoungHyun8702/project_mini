package board.vo;

import java.io.Serializable;
import java.util.Date;

public class Board implements Serializable{
   private int boardId;
   private String boardTitle;
   private Date boardDate;
   private String boardContent;
   private int boardScore;
   private int boardReference;
   private String memberId;
   private int movieId;
   private String movieTitle;
   private int boardCount;
   public Board() {
      super();
   }
   public Board(int boardId, String boardTitle, Date boardDate, String boardContent, int boardScore,
         int boardReference, String memberId, int movieId, String movieTitle, int boardCount) {
      super();
      this.boardId = boardId;
      this.boardTitle = boardTitle;
      this.boardDate = boardDate;
      this.boardContent = boardContent;
      this.boardScore = boardScore;
      this.boardReference = boardReference;
      this.memberId = memberId;
      this.movieId = movieId;
      this.movieTitle = movieTitle;
      this.boardCount = boardCount;
   }
   public int getBoardId() {
      return boardId;
   }
   public void setBoardId(int boardId) {
      this.boardId = boardId;
   }
   public String getBoardTitle() {
      return boardTitle;
   }
   public void setBoardTitle(String boardTitle) {
      this.boardTitle = boardTitle;
   }
   public Date getBoardDate() {
      return boardDate;
   }
   public void setBoardDate(Date boardDate) {
      this.boardDate = boardDate;
   }
   public String getBoardContent() {
      return boardContent;
   }
   public void setBoardContent(String boardContent) {
      this.boardContent = boardContent;
   }
   public int getBoardScore() {
      return boardScore;
   }
   public void setBoardScore(int boardScore) {
      this.boardScore = boardScore;
   }
   public int getBoardReference() {
      return boardReference;
   }
   public void setBoardReference(int boardReference) {
      this.boardReference = boardReference;
   }
   public String getMemberId() {
      return memberId;
   }
   public void setMemberId(String memberId) {
      this.memberId = memberId;
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
   public int getBoardCount() {
      return boardCount;
   }
   public void setBoardCount(int boardCount) {
      this.boardCount = boardCount;
   }
   @Override
   public int hashCode() {
      final int prime = 31;
      int result = 1;
      result = prime * result + ((boardContent == null) ? 0 : boardContent.hashCode());
      result = prime * result + boardCount;
      result = prime * result + ((boardDate == null) ? 0 : boardDate.hashCode());
      result = prime * result + boardId;
      result = prime * result + boardReference;
      result = prime * result + boardScore;
      result = prime * result + ((boardTitle == null) ? 0 : boardTitle.hashCode());
      result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
      result = prime * result + movieId;
      result = prime * result + ((movieTitle == null) ? 0 : movieTitle.hashCode());
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
      Board other = (Board) obj;
      if (boardContent == null) {
         if (other.boardContent != null)
            return false;
      } else if (!boardContent.equals(other.boardContent))
         return false;
      if (boardCount != other.boardCount)
         return false;
      if (boardDate == null) {
         if (other.boardDate != null)
            return false;
      } else if (!boardDate.equals(other.boardDate))
         return false;
      if (boardId != other.boardId)
         return false;
      if (boardReference != other.boardReference)
         return false;
      if (boardScore != other.boardScore)
         return false;
      if (boardTitle == null) {
         if (other.boardTitle != null)
            return false;
      } else if (!boardTitle.equals(other.boardTitle))
         return false;
      if (memberId == null) {
         if (other.memberId != null)
            return false;
      } else if (!memberId.equals(other.memberId))
         return false;
      if (movieId != other.movieId)
         return false;
      if (movieTitle == null) {
         if (other.movieTitle != null)
            return false;
      } else if (!movieTitle.equals(other.movieTitle))
         return false;
      return true;
   }
   @Override
   public String toString() {
      return "Board [boardId=" + boardId + ", boardTitle=" + boardTitle + ", boardDate=" + boardDate
            + ", boardContent=" + boardContent + ", boardScore=" + boardScore + ", boardReference=" + boardReference
            + ", memberId=" + memberId + ", movieId=" + movieId + ", movieTitle=" + movieTitle + ", boardCount="
            + boardCount + "]";
   }
   
   
   
   
   
}