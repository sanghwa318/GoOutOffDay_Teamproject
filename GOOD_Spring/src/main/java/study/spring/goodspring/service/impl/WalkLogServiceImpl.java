package study.spring.goodspring.service.impl;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.WalkLog;
import study.spring.goodspring.service.WalkLogService;
@Slf4j
@Service
public class WalkLogServiceImpl implements WalkLogService {
	@Autowired
	SqlSession sqlSession;

	@Override
	public void addWalkLog(WalkLog input) throws Exception {
		//List<WalkLog> output=null;
		int result = 0;

		try {
			result = sqlSession.insert("WalkLogMapper.insertWalkLog", input);
			//output= sqlSession.selectList("WalkLogMapper.selectWalkLogList", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}

		return;
	}

}
