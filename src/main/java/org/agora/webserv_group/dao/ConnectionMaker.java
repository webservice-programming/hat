package org.agora.webserv_group.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionMaker {
    final String JDBC_DRIVER = "org.h2.Driver";
    final String JDBC_URL = "jdbc:h2:tcp://localhost/~/jwbookdb";
    public Connection makeNewConnection() {
        Connection conn = null;
        try {
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(JDBC_URL,"sa","1234");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}