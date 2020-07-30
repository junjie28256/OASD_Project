package JunitTest;

import jdbcUtil.jdbcUtil;
import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;

class jdbcUtilTest {

    @Test
    void getConnection() throws SQLException {
        Connection connection = jdbcUtil.getConnection();
        System.out.println(connection);
    }
}