package com.kh.byulmee.image.model.service;

import java.util.ArrayList;

import com.kh.byulmee.image.model.vo.Image;

public interface ImageService {

	int insertImage(Image i);

	ArrayList<Image> selectList(int code);

	ArrayList<Image> selectImgList(Image i);

	int deleteImage(Image i);

	void delImg(Image deli);

	ArrayList<Image> selectImage(int acId);

	ArrayList<Image> selectReviewImage(int revImgNo);

	ArrayList<Image> selectProductImage(int pdId);

}
