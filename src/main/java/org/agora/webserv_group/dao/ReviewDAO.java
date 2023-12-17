package org.agora.webserv_group.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.agora.webserv_group.model.Post;
import org.agora.webserv_group.model.Review;

public class ReviewDAO {
	private ConnectionMaker connectionMaker;
	
	public ReviewDAO() {
		connectionMaker = new ConnectionMaker();
	}
	
	public void addReview(Review review) throws Exception {
		Connection conn = connectionMaker.makeNewConnection();
		String sql = "insert into review(title, content, score, pid, uid) "
				+ "values(?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		try(conn; pstmt) {
			pstmt.setString(1, review.getTitle());
			pstmt.setString(2, review.getContent());
			pstmt.setInt(3, review.getScore());
			pstmt.setInt(4, review.getPid());
			pstmt.setString(5, review.getUid());
			pstmt.executeUpdate();
		}
	}
	
	//리뷰 수정
    public void updateReview(Review review) throws SQLException {
        Connection conn = connectionMaker.makeNewConnection();
        int rid = review.getRid();
        String updateSql = "UPDATE review SET title = ?, content = ?, score = ?, WHERE rid = ?";
        PreparedStatement pstmt = conn.prepareStatement(updateSql);

        try (conn; pstmt) {
            pstmt.setString(1, review.getTitle());
            pstmt.setString(2, review.getContent());
            pstmt.setInt(3, review.getScore());
            pstmt.setInt(6,  rid);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    //리뷰 삭제
    public void delReview(int rid) throws SQLException {
        Connection conn = connectionMaker.makeNewConnection();
        String sql = "delete from review where rid = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        try(conn; pstmt) {
            pstmt.setInt(1, rid);
            // 삭제된 리뷰가 없을 경우
            if(pstmt.executeUpdate() == 0) {
                throw new SQLException("DB에러");
            }
        }
    }
    
	
    public int getLastId() throws Exception {
        Connection conn = connectionMaker.makeNewConnection();
        String sql = "select scope_identity() as last_id from review";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery(sql);
        String lastId = rs.getString("last_id");

        return Integer.parseInt(lastId);
    }
	
	public List<Review> getReviewsByPid(int pid) throws SQLException {
		Connection conn = connectionMaker.makeNewConnection();
		
		String sql = "select uid, pid, rid, title, content, score from review where pid = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pid);
		ResultSet rs = pstmt.executeQuery();
		List<Review> reviews = getReviewsFromRs(rs);
		
		return reviews;
	}
	
	private List<Review> getReviewsFromRs(ResultSet rs) throws SQLException {
		List<Review> reviews = new ArrayList<>();
		try(rs) {
			while(rs.next()) {
				Review review = new Review();
				review.setUid(rs.getString("uid"));
				review.setPid(rs.getInt("pid"));
				review.setRid(rs.getInt("rid"));
				review.setTitle(rs.getString("title"));
				review.setContent(rs.getString("content"));
				review.setScore(rs.getInt("score"));
				reviews.add(review);
			}
			return reviews;
		}
	}
	
}