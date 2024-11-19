package common;

import java.sql.*;
import jakarta.servlet.ServletContext;

public class JDBConnect {
    protected Connection con;
    protected PreparedStatement psmt;
    protected ResultSet rs;

    public JDBConnect(ServletContext application) {
        try {
            String driver = application.getInitParameter("OracleDriver");
            String url = application.getInitParameter("OracleURL");
            String id = application.getInitParameter("OracleId");
            String pwd = application.getInitParameter("OraclePwd");

            // JDBC 드라이버 로드
            Class.forName(driver);

            // DB 연결
            con = DriverManager.getConnection(url, id, pwd);
            System.out.println("DB 연결 성공 (web.xml 사용)");
        } catch (Exception e) {
            System.err.println("DB 연결 실패: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // 연결 상태 확인 및 재연결
    public void ensureConnection(ServletContext application) {
        try {
            if (con == null || con.isClosed()) {
                System.out.println("DB 연결이 끊어져 재연결 시도 중...");
                String driver = application.getInitParameter("OracleDriver");
                String url = application.getInitParameter("OracleURL");
                String id = application.getInitParameter("OracleId");
                String pwd = application.getInitParameter("OraclePwd");

                // 재연결
                Class.forName(driver);
                con = DriverManager.getConnection(url, id, pwd);
                System.out.println("DB 재연결 성공");
            }
        } catch (Exception e) {
            System.err.println("DB 재연결 실패: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public void close() {
        try {
            if (rs != null) rs.close();
            if (psmt != null) psmt.close();
            if (con != null) con.close();
            System.out.println("JDBC 자원 해제 완료");
        } catch (Exception e) {
            System.err.println("JDBC 자원 해제 중 오류: " + e.getMessage());
        }
    }
}
