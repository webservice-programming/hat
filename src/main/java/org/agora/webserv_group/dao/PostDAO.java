package org.agora.webserv_group.dao;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

//import lombok.extern.slf4j.Slf4j;

import org.agora.webserv_group.model.Post;

import java.lang.reflect.Type;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

//@Slf4j
public class PostDAO {
    private ConnectionMaker connectionMaker;
    Type listType = new TypeToken<ArrayList<String>>() {}.getType();
    Gson gson;

    public PostDAO() {
        connectionMaker = new ConnectionMaker();
        gson = new Gson();
    }

    public void addPost(Post post) throws Exception {
        Connection conn = connectionMaker.makeNewConnection();
        String sql = "insert into post(writer, capacity, people, created_at, updated_at, category, title, introduction, content, location, is_end) values(?,?,?,CURRENT_TIMESTAMP(0),CURRENT_TIMESTAMP(0),?,?,?,?,?,false)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        Array array = conn.createArrayOf("VARCHAR",post.getPeople().toArray());
        try(conn; pstmt) {
            pstmt.setString(1, post.getWriter());
            pstmt.setInt(2, post.getCapacity());
            pstmt.setArray(3, array);
            pstmt.setString(4, post.getCategory());
            pstmt.setString(5, post.getTitle());
            pstmt.setString(6, post.getIntroduction());
            pstmt.setString(7, post.getContent());
            pstmt.setString(8, post.getLocation());
            pstmt.executeUpdate();
        }
    }

    public int getLastId() throws Exception {
        Connection conn = connectionMaker.makeNewConnection();
        String sql = "select scope_identity() as last_id from post";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery(sql);
        String lastId = rs.getString("last_id");

        return Integer.parseInt(lastId);
    }

    public List<Post> getPosts() throws Exception {
        Connection conn = connectionMaker.makeNewConnection();
        String sql = "select pid, writer, capacity, people, PARSEDATETIME(created_at,'yyyy-MM-dd HH:mm:ss') as created_at, PARSEDATETIME(updated_at,'yyyy-MM-dd HH:mm:ss') as updated_at, category, title, introduction, content, location, is_end from post";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        List<Post> posts = getPostsFromRs(rs);

        return posts;
    }

    public List<Post> getPostsByTitle(String title) throws SQLException {
        Connection conn = connectionMaker.makeNewConnection();

        String sql = "select pid, writer, capacity, people, PARSEDATETIME(created_at,'yyyy-MM-dd HH:mm:ss') as created_at, PARSEDATETIME(updated_at,'yyyy-MM-dd HH:mm:ss') as updated_at, category, title, introduction, content, location, is_end from post where title=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        ResultSet rs = pstmt.executeQuery();

        List<Post> posts = getPostsFromRs(rs);
        return posts;
    }


    public Post getPostById(int pid) throws SQLException {
        Connection conn = connectionMaker.makeNewConnection();
        String sql = "select pid, writer, capacity, people, PARSEDATETIME(created_at,'yyyy-MM-dd HH:mm:ss') as created_at, PARSEDATETIME(updated_at,'yyyy-MM-dd HH:mm:ss') as updated_at, category, title, introduction, content, location, is_end from post where pid=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, pid);
        ResultSet rs = pstmt.executeQuery();
        List<Post> posts = getPostsFromRs(rs);

        return posts.get(0);
    }

    public void addPeople(Post post, String uid) throws SQLException {
        Connection conn = connectionMaker.makeNewConnection();
        int pid = post.getPid();
        ArrayList<String> people = post.getPeople();

        String updateSql = "UPDATE post SET people = ?, updated_at = CURRENT_TIMESTAMP(0) WHERE pid = ?";
        PreparedStatement pstmt = conn.prepareStatement(updateSql);

        try (conn; pstmt) {
            people.add(uid);
            Array array = conn.createArrayOf("VARCHAR", people.toArray());
            pstmt.setArray(1, array);
            pstmt.setInt(2, pid);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        if (post.getCapacity() <= post.getPeople().size()) {
        	String updateIsEndSql = "UPDATE post SET is_end = true WHERE pid = ?";
        	
        	Connection conn1 = connectionMaker.makeNewConnection();
        	PreparedStatement pstmt1 = conn1.prepareStatement(updateIsEndSql);
//        	pstmt1.setBoolean(1, true);
        	pstmt1.setInt(1, pid);
        	pstmt1.executeUpdate();
        }
    }

    public void removePeople(Post post, String uid) throws SQLException {
        Connection conn = connectionMaker.makeNewConnection();
        int pid = post.getPid();
        ArrayList<String> people = post.getPeople();

        String updateSql = "UPDATE post SET people = ?, updated_at = CURRENT_TIMESTAMP(0) WHERE pid = ?";
        PreparedStatement pstmt = conn.prepareStatement(updateSql);

        try (conn; pstmt) {
            people.remove(uid);
            Array array = conn.createArrayOf("VARCHAR", people.toArray());
            pstmt.setArray(1, array);
            pstmt.setInt(2, pid);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void closePost(int pid) throws SQLException {
        Connection conn = connectionMaker.makeNewConnection();

        String updateSql = "UPDATE post SET is_end = true, updated_at = CURRENT_TIMESTAMP(0) WHERE pid = ?";
        PreparedStatement pstmt = conn.prepareStatement(updateSql);

        try (conn; pstmt) {
            pstmt.setInt(1, pid);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Post> getPostsByCategory(String category) throws SQLException {
        Connection conn = connectionMaker.makeNewConnection();
        String sql = "select pid, writer, capacity, people, PARSEDATETIME(created_at,'yyyy-MM-dd HH:mm:ss') as created_at, PARSEDATETIME(updated_at,'yyyy-MM-dd HH:mm:ss') as updated_at, category, title, introduction, content, location, is_end from post where category=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, category);
        ResultSet rs = pstmt.executeQuery();
        List<Post> posts = getPostsFromRs(rs);

        return posts;
    }

    public List<Post> getMyGroupPostsByUid(String uid) throws SQLException {
        Connection conn = connectionMaker.makeNewConnection();
        String uidStr = "%" + uid + "%";
        String sql = "select pid, writer, capacity, people, PARSEDATETIME(created_at,'yyyy-MM-dd HH:mm:ss') as created_at, PARSEDATETIME(updated_at,'yyyy-MM-dd HH:mm:ss') as updated_at, category, title, introduction, content, location, is_end from post where people LIKE ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, uidStr);
        ResultSet rs = pstmt.executeQuery();
        List<Post> posts = getPostsFromRs(rs);

        return posts;
    }

    public List<Post> getPostsByWriter(String writer) throws SQLException {
        Connection conn = connectionMaker.makeNewConnection();
        String sql = "select pid, writer, capacity, people, PARSEDATETIME(created_at,'yyyy-MM-dd HH:mm:ss') as created_at, PARSEDATETIME(updated_at,'yyyy-MM-dd HH:mm:ss') as updated_at, category, title, introduction, content, location, is_end from post where writer = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, writer);
        ResultSet rs = pstmt.executeQuery();
        List<Post> posts = getPostsFromRs(rs);

        return posts;
    }

    public void updatePost(Post post) throws SQLException {
        Connection conn = connectionMaker.makeNewConnection();
        int pid = post.getPid();
        String updateSql = "UPDATE post SET title = ?, content = ?, updated_at = CURRENT_TIMESTAMP(0) WHERE pid = ?";
        PreparedStatement pstmt = conn.prepareStatement(updateSql);

        try (conn; pstmt) {
            pstmt.setString(1, post.getTitle());
            pstmt.setString(2, post.getContent());
            pstmt.setInt(3, pid);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void delPost(int pid) throws SQLException {
        Connection conn = connectionMaker.makeNewConnection();
        String sql = "delete from post where pid = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        try(conn; pstmt) {
            pstmt.setInt(1, pid);
            // 삭제된 게시글이 없을 경우
            if(pstmt.executeUpdate() == 0) {
                throw new SQLException("DB에러");
            }
        }
    }


    private List<Post> getPostsFromRs(ResultSet rs) throws SQLException {
        List<Post> posts = new ArrayList<>();
        try(rs) {
            while(rs.next()) {
                Post post = new Post();
                post.setPid(rs.getInt("pid"));
                post.setWriter(rs.getString("writer"));
                post.setCapacity(rs.getInt("capacity"));
                post.setPeople(gson.fromJson(rs.getString("people"), listType));
                post.setCategory(rs.getString("category"));
                post.setTitle(rs.getString("title"));
                post.setIntroduction(rs.getString("introduction"));
                post.setContent(rs.getString("content"));
                post.setLocation(rs.getString("location"));
                post.setCreated_at(rs.getString("created_at"));
                post.setUpdated_at(rs.getString("updated_at"));
                post.setIs_end(rs.getBoolean("is_end"));
                posts.add(post);
            }
            return posts;
        }
    }
}