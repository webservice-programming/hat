package org.agora.webserv_group.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
		String sql = "insert into review(title, content, score, pid, uid) values(?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		try(conn; pstmt) {
			pstmt.setString(1, review.getTitle());
			pstmt.setString(2, review.getContent());
			pstmt.setInt(3, review.getScore());
			pstmt.setInt(4, review.getPid());
			pstmt.setInt(5, review.getUid());
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
		
		String sql = "select rid, title, content, score from review where pid = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pid);
		ResultSet rs = pstmt.executeQuery();
		List<Review> reviews = getReviewsFromRs(rs);
		
		return reviews;
	}
	
	private List<Review> getReviewsFromRs(ResultSet rs) {
		List<Review> reviews = new ArrayList<>();
		try(rs) {
			while(rs.next()) {
				Review review = new Review();
				review.setRid(rs.getInt("rid"));
				review.setTitle(rs.getString("title"));
				review.setContent(rs.getContent("content"));
				review.setScore(rs.getScore("score"));
				reviews.add(review);
			}
			return reviews;
		}
	}
	
}