package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBLink {
    // 通过静态块加载数据库驱动
    static {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    // 获取连接
    public static Connection getCon() throws ClassNotFoundException, SQLException {

        Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE",
                "system","sun");
        return con;

    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        System.out.println(getCon());
    }
}

