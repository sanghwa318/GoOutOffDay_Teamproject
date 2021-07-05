package study.spring.goodspring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import retrofit2.Call;
import study.spring.goodspring.model.CasAPIList;
import study.spring.goodspring.model.CasAPIList.SJWPerform.row;
import study.spring.goodspring.service.CasAPIService;

@Slf4j
@Service
public class CasAPIServiceImpl implements CasAPIService {
	
	// Mybatis 연동
	@Autowired SqlSession sqlSession;
	
	@Override
	public Call<CasAPIList> getCasAPIList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void collectCasShowExh(List<row> list) throws Exception {
		try {
			// 수집결과를 반복수행하면서 데이터를 저장
			for (row item : list) {
				sqlSession.insert("CasShowExhMapper.insertItem", item);
			}
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
	}

}
