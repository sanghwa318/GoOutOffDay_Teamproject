package study.spring.goodspring.uploadservice.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.Bicycle;
import study.spring.goodspring.model.Member;
import study.spring.goodspring.model.Bicycle.RentBikeStatus.Row;
import study.spring.goodspring.uploadservice.BicycleUpload;

@Slf4j
@Service

public class BicycleServiceImpl implements BicycleUpload {
	
	// MyBatis 연동을 위한 객체 주입
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void collectBicycle(List<Row> row) throws Exception {
		try {
			// 수집 결과 수 만큼 반복을 수행하면서 데이터를 저장한다.
			for(Row item : row) {
				// 대여소ID가 일치하는 데이터에 대한 UPDATE를 시도한다.
				if(sqlSession.update("BicycleMapper.updateItem", item) == 0) {
					// 갱신된 결과가 0이면 조건이 일치하는 데이터가 없다는 의미이므로 INSERT 수행
				sqlSession.insert("BicycleMapper.insertItem", item);
				}
			}
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
	}
	
	// DB 데이터를 불러오는 기능
	@Override
	public List<Bicycle> getBicycle(Bicycle input) throws Exception {
		
		List<Bicycle> result = null;

		try {
			result = sqlSession.selectList("BicycleMapper.selectList", input);
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

}
