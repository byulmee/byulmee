package com.kh.byulmee.image.model.service;

import java.util.ArrayList;

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

	@Override
	public ArrayList<Image> selectList(int code) {
		
		return iDAO.selectList(sqlSession, code);
	}

	@Override
	public ArrayList<Image> selectImgList(Image i) {
		
		return iDAO.selectImgList(sqlSession, i);
	}

	@Override
	public int deleteImage(Image i) {
		
		return iDAO.deleteImage(sqlSession, i);
	}

	@Override
	public void delImg(Image deli) {
		
		iDAO.delImg(sqlSession, deli);
	}

	

	public ArrayList<Image> selectImage(int acId) {
		return iDAO.selectImage(sqlSession, acId);
	}

	@Override
	public ArrayList<Image> selectReviewImage(int revImgNo) {
		return iDAO.selectReviewImage(sqlSession, revImgNo);
	}

}
