package com.tech.blog.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entites.Categories;
import com.tech.blog.entites.Posts;
public class PostDao {
	Connection con;

	public PostDao() {
		
	}

	public PostDao(Connection con) {
		this.con = con;
	}
	
	public ArrayList<Categories> getAllCategories(){
		ArrayList<Categories> list = new ArrayList<Categories>();
			
		try {
			String query = "select * from categories";
			Statement st = con.createStatement();
			ResultSet set = st.executeQuery(query);
			
			while(set.next()) {
				int cid = set.getInt("cId");
				String name = set.getString("cName");
				String description = set.getString("cDescription");
				
				Categories c =  new Categories(cid,name,description);
				list.add(c);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean savePost(Posts post) {
		boolean f = false;
		try {
			String query = "INSERT INTO POSTS(pTitle,pContent,pCode,pPic,catId,userId) VALUES(?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setString(1,post.getpTitle());
			pstmt.setString(2,post.getpContent());
			pstmt.setString(3,post.getpCode());
			pstmt.setString(4,post.getpPic());
			pstmt.setInt(5,post.getCatId());
			pstmt.setInt(6,post.getUserId());
			
			pstmt.executeUpdate();
			f=true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

//	Get All The Posts
	public List<Posts> getAllPosts(){
		List<Posts> list = new ArrayList<Posts>();
//		fetch all the post
		try {
			PreparedStatement p = con.prepareStatement("SELECT * FROM POSTS ORDER BY pID DESC");
			ResultSet set = p.executeQuery();
			
			while(set.next()) {
				int pid = set.getInt("pID");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");
				int catId = set.getInt("catId");
				int userId = set.getInt("userId");
				Posts p1 = new Posts(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
				
				list.add(p1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;		
	}
	
	public List<Posts> getPostByCatId(int catId){
		List<Posts> list = new ArrayList<Posts>();
		
		try {
			PreparedStatement p = con.prepareStatement("SELECT * FROM POSTS WHERE CATID=?");
			p.setInt(1, catId);
			ResultSet set = p.executeQuery();
			
			while(set.next()) {
				int pid = set.getInt("pID");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");
				int userId = set.getInt("userId");
				Posts p1 = new Posts(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
				
				list.add(p1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Posts getPostByPostId(int postid) {
		String query = "SELECT * FROM POSTS WHERE pID = ?";
		
		Posts post = null;
		
		PreparedStatement pstmt=null;
		try {
			pstmt = this.con.prepareStatement(query);
			pstmt.setInt(1, postid);
		
			ResultSet set = pstmt.executeQuery();
			
			if(set.next()) {
				
				int pid = set.getInt("pID");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");
				int catId = set.getInt("catId");
				int userId = set.getInt("userId");
				
				post = new Posts(pid, pTitle, pContent, pCode, pPic, date, catId, userId);	
			}
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return post;	
	}

}
