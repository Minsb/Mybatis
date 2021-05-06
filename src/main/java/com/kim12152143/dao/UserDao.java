package com.kim12152143.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import com.kim12152143.model.User;
import com.kim12152143.model.Rank;
import com.kim12152143.util.DBUtil;

public class UserDao {
private SqlSession sqlSession;
	
	public UserDao() {
		sqlSession = DBUtil.getSqlSession();
	}
	
	public int insertUser(User user){
		sqlSession.close();
		sqlSession = DBUtil.getSqlSession();
		int result = 0;
		try {
		result = sqlSession.insert("UserMapper.insertUser",user);
		sqlSession.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;		
	}
	
	public User loginUser(String id){
		sqlSession.close();
		sqlSession = DBUtil.getSqlSession();
		User result = null;
		try {
			result = sqlSession.selectOne("UserMapper.loginUser", id);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
	public List<User> allUser(){
		sqlSession.close();
		sqlSession = DBUtil.getSqlSession();
		List<User> result = null;
		try {
			result = sqlSession.selectList("UserMapper.allUser");
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
	public int deleteUser(String uid){
		int result = 0;
		try {
			result = sqlSession.insert("UserMapper.deleteUser", uid);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
	public int updateUser(String category, String newvalue, String uid){
		sqlSession.close();
		sqlSession = DBUtil.getSqlSession();
		
		HashMap<String, String> updateHash = new HashMap<String, String>(); 
		updateHash.put("userid", uid);
		updateHash.put("newvalue", newvalue);
		
		int categoryidx = Integer.parseInt(category);

		int result = 0;
		try {
			switch (categoryidx) {
            case 1:  result = sqlSession.insert("UserMapper.updateUserpw", updateHash);
					 sqlSession.commit();
                     break;
            case 2:  result = sqlSession.insert("UserMapper.updateUsernick", updateHash);
			 		 sqlSession.commit();
			 		 break;
            case 3:  result = sqlSession.insert("UserMapper.updateUseremail", updateHash);
			 		 sqlSession.commit();
			 		 break;
            default:
            		 break;
            }
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	public int insertRank(String userid, String name, String score, String stage){
		sqlSession.close();
		sqlSession = DBUtil.getSqlSession();
		int result = 0;
		
		int sc = Integer.parseInt(score);
		int st = Integer.parseInt(stage);
		
		System.out.println(userid);
		
		HashMap<String, Object> hash = new HashMap<String, Object>(); 
		hash.put("userid", userid);
		hash.put("nickname", name);
		hash.put("score", sc);
		hash.put("stage", st);
		
		try {
		result = sqlSession.insert("UserMapper.insertRank",hash);
		sqlSession.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;		
	}
	
	public List<Rank> showRank(){
		sqlSession.close();
		sqlSession = DBUtil.getSqlSession();
		List<Rank> result = null;
		try {
			result = sqlSession.selectList("UserMapper.showRank");
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
	public String findUserId(String email){
		sqlSession.close();
		sqlSession = DBUtil.getSqlSession();
		String result = "";
		try {
			result = sqlSession.selectOne("UserMapper.findUserId", email);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
	public String findUserPw(String userid){
		sqlSession.close();
		sqlSession = DBUtil.getSqlSession();
		String result = "";
		try {
			result = sqlSession.selectOne("UserMapper.findUserPw", userid);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
	public String findUserQuest(String userid){
		String result = "";
		try {
			result = sqlSession.selectOne("UserMapper.findUserQuest", userid);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
	public String findUserAnswer(String userid){
		String result = "";
		try {
			result = sqlSession.selectOne("UserMapper.findUserAnswer", userid);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
}
