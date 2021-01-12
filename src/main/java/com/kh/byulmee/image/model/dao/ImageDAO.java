package com.kh.byulmee.image.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.byulmee.image.model.vo.Image;

@Repository("iDAO")
public class ImageDAO {

	public int insertImage(SqlSessionTemplate sqlSession, Image i) {
		
		return sqlSession.insert("imageMapper.insertImage", i);
	}
	
}
