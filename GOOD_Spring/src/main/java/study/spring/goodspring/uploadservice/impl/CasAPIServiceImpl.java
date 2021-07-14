package study.spring.goodspring.uploadservice.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.CasAPIList.tvYeyakCOllect.Row;
import study.spring.goodspring.uploadservice.CasAPIUploadService;

@Slf4j
@Service
public class CasAPIServiceImpl implements CasAPIUploadService {

	// Mybatis 연동
	@Autowired
	SqlSession sqlSession;


	@Override
	public void collectCasOther(List<Row> list)
			throws Exception {
		try {
			// 수집결과를 반복수행하면서 데이터를 저장
			for (Row item : list) {
				// 시작일자와 고유ID가 일치하는 데이터에대한 UPDATE를 시도
				if(sqlSession.update("CasUploadMapper.updateItemOther", item) == 0) {
					sqlSession.insert("CasUploadMapper.insertItemOther", item);
				}
			}
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}

	}

}
