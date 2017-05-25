package db;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InsertData {
	public static void main(String[] args) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE"; // 본인 데이터베이스 설정에
																// 맞게 쓸것
			String id = "scott"; // 본인 데이터베이스 아이디에 맞춰서 쓸것
			String pw = "tiger"; // 본인 데이터베이스 비밀번호에 맞춰서 쓸것

			Class.forName("oracle.jdbc.driver.OracleDriver");

			conn = DriverManager.getConnection(url, id, pw);

			BufferedReader in = new BufferedReader(
					new InputStreamReader(new FileInputStream("C:\\Java\\Movie_DB.txt"), "euc-kr")); // 파일경로는
																										// 본인에
																										// 맞춰서..
			String line;
			String[] str = null;

			String sql = "insert into movie values(?,?,?,?,?,?,?,?)"; // 시퀀스 이름
																		// 바꿀것

			pstmt = conn.prepareStatement(sql);

			while ((line = in.readLine()) != null) {
				str = line.split(",");
				if (str.length == 8) {
					pstmt.setString(1, str[0]);
					pstmt.setString(2, str[1]);
					pstmt.setString(3, str[2]);
					pstmt.setString(4, str[3]);
					pstmt.setString(5, str[4]);
					pstmt.setString(6, str[5]);
					pstmt.setString(7, str[6]);
					pstmt.setString(8, str[7]);
					//System.out.println(str[0]);
					pstmt.executeUpdate();
				} /*
					 * else if (str.length == 9) { pstmt.setString(1, str[0]);
					 * pstmt.setString(2, str[1]); pstmt.setString(3, str[2]);
					 * pstmt.executeUpdate(); }
					 */
			}
			System.out.println("영화 자료 넣기 완료");
			in.close();

		} catch (Exception e) {
			System.err.println(e);
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException sqle) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException sqle) {
				}
		}
	}
}