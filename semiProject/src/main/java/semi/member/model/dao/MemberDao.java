package semi.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static semi.common.JDBCTemplate.*;

import semi.common.model.vo.PageInfo;
import semi.member.model.vo.Member;


public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member loginMember(Connection conn, String mId, String mPwd) {
		Member m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mId);
			pstmt.setString(2, mPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("M_NO"),
							   rset.getString("M_NAME"),
							   rset.getString("M_ID"),
							   rset.getString("M_NICKNAME"),
							   rset.getString("M_PWD"),
							   rset.getString("M_RRN"),
							   rset.getString("M_PHONE"),
							   rset.getString("M_EMAIL"),
							   rset.getString("M_ADDRESS"),
							   rset.getDate("M_DATE"),
							   rset.getDate("M_MODIFY"),
							   rset.getString("M_STATUS"),
							   rset.getInt("M_REPORT"),
							   rset.getString("M_GRADE"),
							   rset.getString("M_PROFILE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}

	public int insertMember(Connection conn, Member m) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getmName());
			pstmt.setString(2, m.getmId());
			pstmt.setString(3, m.getmNickname());
			pstmt.setString(4, m.getmPwd());
			pstmt.setString(5, m.getmRrn());
			pstmt.setString(6, m.getmPhone());
			pstmt.setString(7, m.getmEmail());
			pstmt.setString(8, m.getmAddress());
			pstmt.setString(9, m.getmProfile());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
		
		

	public int selectMemberCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemberCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public ArrayList<Member> selectList(Connection conn, PageInfo pi) {
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getInt("M_NO"),
								   rset.getString("M_NAME"),
								   rset.getString("M_ID"),
								   rset.getString("M_NICKNAME"),
								   rset.getString("M_PWD"),
								   rset.getString("M_RRN"),
								   rset.getString("M_PHONE"),
								   rset.getString("M_EMAIL"),
								   rset.getString("M_ADDRESS"),
								   rset.getDate("M_DATE"),
								   rset.getDate("M_MODIFY"),
								   rset.getString("M_STATUS"),
								   rset.getInt("M_REPORT"),
								   rset.getString("M_GRADE"),
								   rset.getString("M_PROFILE"))
						);
			}

		} catch (SQLException e) {
		
			e.printStackTrace();

		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	
	}

	
	public Member selectMember(Connection conn, String mId) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member(rset.getInt("M_NO"),
						   rset.getString("M_NAME"),
						   rset.getString("M_ID"),
						   rset.getString("M_NICKNAME"),
						   rset.getString("M_PWD"),
						   rset.getString("M_RRN"),
						   rset.getString("M_PHONE"),
						   rset.getString("M_EMAIL"),
						   rset.getString("M_ADDRESS"),
						   rset.getDate("M_DATE"),
						   rset.getDate("M_MODIFY"),
						   rset.getString("M_STATUS"),
						   rset.getInt("M_REPORT"),
						   rset.getString("M_GRADE"),
						   rset.getString("M_PROFILE"));
		}
		} catch (SQLException e) {
			 
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}

	public int blockMember(Connection conn, int mNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("blockMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,mNo);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public Member findMemberById(Connection conn, String mId) {
	    Member m = null;
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    String sql = prop.getProperty("findMemberById");

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, mId);

	        rset = pstmt.executeQuery();

	        if (rset.next()) {
	            m = new Member(
	                rset.getInt("M_NO"),
	                rset.getString("M_NAME"),
	                rset.getString("M_ID"),
	                rset.getString("M_NICKNAME"),
	                rset.getString("M_PWD"),
	                rset.getString("M_RRN"),
	                rset.getString("M_PHONE"),
	                rset.getString("M_EMAIL"),
	                rset.getString("M_ADDRESS"),
	                rset.getDate("M_DATE"),
	                rset.getDate("M_MODIFY"),
	                rset.getString("M_STATUS"),
	                rset.getInt("M_REPORT"),
	                rset.getString("M_GRADE"),
	                rset.getString("M_PROFILE")
	            );
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rset);
	        close(pstmt);
	    }

	    return m;
	}
	
	public String insertMember1(Connection conn, Member m) {
        String newMemberId = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;

        String sql = prop.getProperty("insertMember1");

        try {
            pstmt = conn.prepareStatement(sql, new String[] {"M_ID"}); 
            pstmt.setString(1, m.getmName());
            pstmt.setString(2, m.getmId());
            pstmt.setString(3, m.getmNickname());
            pstmt.setString(4, m.getmPwd());
            pstmt.setString(5, m.getmRrn());
            pstmt.setString(6, m.getmPhone());
            pstmt.setString(7, m.getmEmail());
            pstmt.setString(8, m.getmAddress());
            pstmt.setString(9, m.getmProfile());

            int result = pstmt.executeUpdate();

            if (result > 0) {
                rset = pstmt.getGeneratedKeys(); // 생성된 키를 가져옴
                if (rset.next()) {
                    newMemberId = rset.getString(1);  // 첫 번째 열의 값을 가져옴 (M_ID)
                }
                commit(conn);
            } else {
                rollback(conn);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            rollback(conn);
        } finally {
            close(rset);
            close(pstmt);
        }

        return newMemberId;
    }
	
}
