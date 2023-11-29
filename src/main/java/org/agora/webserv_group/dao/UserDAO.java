package org.agora.webserv_group.dao;

import org.agora.webserv_group.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Pattern;

public class UserDAO {
    private ConnectionMaker connectionMaker;
    PreparedStatement pstmt;
    Connection conn;

    public UserDAO() {
        connectionMaker = new ConnectionMaker();
    }

    public boolean idCheck(String id) throws SQLException { //id를 입력하지 않았거나 DB내에 존재하지 않는 id를 입력한 경우 false를 반환
        String sql = "select EXISTS (select * from usertable where ID= ? limit 1) as success";
        conn = connectionMaker.makeNewConnection();
        try {
            if(id != null){ //id 입력을한 경우 실행
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, id);
                boolean check = pstmt.execute(); //존재하면 true 없으면 false 저장
                if(check) {return true;} //DB내에 존재시 true를 반환
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            pstmt.close();
            conn.close();
        }
        return false;
    }

    public void addUser(User user) throws SQLException {
        String sql = "insert into usertable(uid,password,name,email,admin) values(?,?,?,?,'FALSE')";
        conn = connectionMaker.makeNewConnection();
        try{
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,user.getUid());
            pstmt.setString(2,user.getPassword());
            pstmt.setString(3,user.getName());
            pstmt.setString(4,user.getEmail());
            pstmt.executeUpdate();
        } catch(SQLException e){
            e.printStackTrace();
        } finally{
           pstmt.close();
           conn.close();
        }
    }

    public User getUser(String uid) throws SQLException{ //내 정보 페이지 - 내 정보 보여주기
        conn = connectionMaker.makeNewConnection();
        User u = new User();
        try{
            pstmt = conn.prepareStatement("select * from usertable where uid = ?");
            pstmt.setString(1,uid);
            ResultSet rs = pstmt.executeQuery();
            rs.next();

            u.setUid(rs.getString("uid"));
            u.setPassword(rs.getString("password"));
            u.setName(rs.getString("name"));
            u.setEmail(rs.getString("email"));
            u.setAdmin(rs.getBoolean("admin"));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            pstmt.close();
            conn.close();
        }
        return u; //특정 유저정보 반환
    }

    public boolean login(String uid, String password) throws SQLException{ //로그인
        conn = connectionMaker.makeNewConnection();
        try{
            pstmt = conn.prepareStatement("select * from usertable where uid = ? and password = ?");
            pstmt.setString(1,uid);
            pstmt.setString(2,password);
            ResultSet rs = pstmt.executeQuery();
            if( !rs.isBeforeFirst() ){ // 쿼리 rs가 비었는지 판단
                return false;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            pstmt.close();
            conn.close();
        }
        return true;
    }

    public String findId(String name, String email) throws SQLException{ //로그인페이지 - 아이디 찾기
        conn = connectionMaker.makeNewConnection();
        String uid = "";
        try{
            pstmt = conn.prepareStatement("select * from usertable where name = ? and email = ?");
            pstmt.setString(1,name);
            pstmt.setString(2,email);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            uid = rs.getString("uid"); //입력된 이름과 이메일과 연관된 id 저장
        }catch (SQLException e) {
            e.printStackTrace();
        } finally{
            pstmt.close();
            conn.close();
        }
        return uid; //유저 아이디 반환
    }

    public String findPassword(String uid) throws SQLException{ //로그인 페이지 - 비밀번호 찾기
        conn = connectionMaker.makeNewConnection();
        String password = "";
        try{
            pstmt = conn.prepareStatement("select * from usertable where uid = ?");
            pstmt.setString(1,uid);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            password = rs.getString("password"); //id와 연관된 비밀번호 저장
        }catch (SQLException e) {
            e.printStackTrace();
        } finally{
            pstmt.close();
            conn.close();
        }
        return password; //비밀번호 반환
    }
}
