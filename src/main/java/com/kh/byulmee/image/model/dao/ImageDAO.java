package com.kh.byulmee.image.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.byulmee.image.model.vo.Image;

@Repository("iDAO")
public class ImageDAO {

	public int insertImage(SqlSessionTemplate sqlSession, Image i) {
		
		return sqlSession.insert("imageMapper.insertImage", i);
	}


	public ArrayList<Image> selectList(SqlSessionTemplate sqlSession, int code) {
		
		return (ArrayList)sqlSession.selectList("imageMapper.selectList", code);
	}

	public ArrayList<Image> selectImgList(SqlSessionTemplate sqlSession, Image i) {
		
		return (ArrayList)sqlSession.selectList("imageMapper.selectImgList", i);
	}

	public int deleteImage(SqlSessionTemplate sqlSession, Image i) {
		
		return sqlSession.delete("imageMapper.deleteImage", i);
	}

	public void delImg(SqlSessionTemplate sqlSession, Image deli) {
    
		sqlSession.delete("imageMapper.delImg", deli);
	}	

	public ArrayList<Image> selectImage(SqlSessionTemplate sqlSession, int acId) {
    
		return (ArrayList)sqlSession.selectList("imageMapper.selectImage", acId);
	}

	public ArrayList<Image> selectReviewImage(SqlSessionTemplate sqlSession, int revImgNo) {
    
		return (ArrayList)sqlSession.selectList("imageMapper.selectReviewImage", revImgNo);
	}

	public ArrayList<Image> selectProductImage(SqlSessionTemplate sqlSession, int pdId) {
		return (ArrayList)sqlSession.selectList("imageMapper.selectProductImage", pdId);
	}
	
}
