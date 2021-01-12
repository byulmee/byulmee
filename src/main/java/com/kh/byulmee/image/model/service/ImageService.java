package com.kh.byulmee.image.model.service;

import java.util.ArrayList;

import com.kh.byulmee.image.model.vo.Image;

public interface ImageService {

	int insertImage(Image i);

	ArrayList<Image> selectImage(int acId);

}
