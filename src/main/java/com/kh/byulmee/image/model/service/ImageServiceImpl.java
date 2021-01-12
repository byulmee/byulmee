package com.kh.byulmee.image.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.byulmee.image.model.dao.ImageDAO;
import com.kh.byulmee.image.model.vo.Image;

@Service("iService")
public class ImageServiceImpl implements ImageService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ImageDAO iDAO;

	@Override
	public int insertImage(Image i) {
		
		return iDAO.insertImage(sqlSession, i);
	}
}