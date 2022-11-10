package common;

import javax.servlet.ServletContext;

public class MemberDAO extends JDBConnect{
	
	public MemberDAO(ServletContext application) {
		super(application);
	}
	
	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		
		String query = "SELECT * FROM member WHERE id=? AND pass=?";
		
		try {
			
			  psmt = conn.prepareStatement(query); 
			  psmt.setString(1, uid);
			  psmt.setString(2, upass); 
			  rs = psmt.executeQuery();
			 
		
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
	}
	catch(Exception e) {
		e.printStackTrace();
	}
		return dto;
		
}
	public int newMemberCreate(String id, String pw, String name){
		
		String query = "SELECT * FROM member WHERE id=? AND pass=?";
		try {
			psmt = conn.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			rs = psmt.executeQuery();
			if(rs.next()) {
				
				return 0;
			}else {
				String query2 = "INSERT INTO member(id, pass, name) VALUES (?, ?, ?)";
				
				psmt = conn.prepareStatement(query2);
				psmt.setString(1, id); 
				psmt.setString(2, pw); 
				psmt.setString(3, name); 
				psmt.executeUpdate();
				
				return 1;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
//	delete문 ver.1
	public Boolean deleteUser(String id,String pw) {
		
		String query = "SELECT * FROM member WHERE id=? AND pass=?";
		try {
			 psmt = conn.prepareStatement(query); 
			 psmt.setString(1, id); 
			 psmt.setString(2, pw); 
			 rs = psmt.executeQuery();
			 if(rs.next()) {
				String query2 = "DELETE FROM member WHERE id=? AND pass=?";
				
				psmt = conn.prepareStatement(query2);
				psmt.setString(1, id); 
				psmt.setString(2, pw); 
				int result = psmt.executeUpdate();
				
				return true;
			 }else {
				 return false;
			 }
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
//	delete문 ver.2
//	public int deleteUserVer2(String id, String pw){
//		String sql = "SELECT * FROM member WHERE id=? AND pass=?";
//		int result = 0;
//		try {
//			psmt = conn.prepareStatement(sql);
//			psmt.setString(1, id);
//			psmt.setString(2, pw);
//			result = psmt.executeUpdate();
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//		}
//		return result;
//	}
	
}
