```java
package day20;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Example3 {
	public static void main(String[] args) {
		// XE : SID(Server ID). 오라클 XE의 경우 변경이 불가능
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "SCOTT";
		String password = "TIGER";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// Java DataBase Connectivity : DB 접근 표준화 기술
		// 실제로 JDBC를 구현하는 사람은 DB 업체

		// 1.드라이버를 로딩
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 2. DriverManager를 이용해 서버에 대한 연결 객체를 얻어온다.
			conn = DriverManager.getConnection(url, user, password);
			// 3. PreparedStatement 객체를 이용해 SQL을 실행
			pstmt = conn.prepareStatement("select empno, ename from emp");
			// 4. ResultSet객체에 실행 결과가 담겨 리턴된다.
			rs = pstmt.executeQuery();
			while (rs.next()) {
				System.out.println(rs.getInt(1) + " " + rs.getString(2));
			}
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버를 찾을 수 없습니다");
		} catch (SQLException e) {
			System.out.println("접속 정보를 확인해 주세요");
		}
		System.out.println("Program End");
	}
}

```

