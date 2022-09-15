package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

// BI => DAO 여러개 통합해서 사용
@Service
public class GoodsService {
	@Autowired
	private GoodsAllDAO aDao;

	@Autowired
	private GoodsBestDAO bDao;
	
	@Autowired
	private GoodsNewDAO nDao;
	
	@Autowired
	private GoodsSpecialDAO sDao;
	
	public List<GoodsVO> goodsAllListData(Map map) {
		return aDao.goodsAllListData(map);
	}

	public List<GoodsVO> goodsBestListData(Map map) {
		return bDao.goodsBestListData(map);
	}
	
	public List<GoodsVO> goodsNewListData(Map map) {
		return nDao.goodsNewListData(map);
	}
	
	public List<GoodsVO> goodsSpecialListData(Map map) {
		return sDao.goodsSpecialListData(map);
	}
	
	public GoodsVO goodsAllDetailData(int no) {
		return aDao.goodsAllDetailData(no);
	}
	
	public GoodsVO goodsBestDetailData(int no) {
		return bDao.goodsBestDetailData(no);
	}
	
	public GoodsVO goodsNewDetailData(int no) {
		return nDao.goodsNewDetailData(no);
	}
	
	public GoodsVO goodsSpecialDetailData(int no) {
		return sDao.goodsSpecialDetailData(no);
	}
	
	public int goodsAllTotalPage() {
		return aDao.goodsAllTotalPage();
	}

	public int goodsBestTotalPage() {
		return bDao.goodsBestTotalPage();
	}

	public int goodsSpecialTotalPage() {
		return sDao.goodsSpecialTotalPage();
	}

	public int goodsNewTotalPage() {
		return nDao.goodsNewTotalPage();
	}
}
