package study.spring.goodspring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.WalkSetGoal;
import study.spring.goodspring.service.WalkSetGoalService;

@Service
@Slf4j
public class WalkSetGoalServiceImpl implements WalkSetGoalService {
	@Autowired
	SqlSession sqlSession;

	@Override
	public void addGoalItem(WalkSetGoal input) throws Exception {
		try {
			sqlSession.insert("WalkSetGoalMapper.insertSetGoal", input);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
	}

	@Override
	public WalkSetGoal getGoalItem(WalkSetGoal input) throws Exception {
		WalkSetGoal output = null;
		try {
			output = sqlSession.selectOne("WalkSetGoalMapper.selectSetGoal", input);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return output;
	}

	@Override
	public List<WalkSetGoal> getGoalList(WalkSetGoal input) throws Exception {
		List<WalkSetGoal> output = null;
		try {
			output = sqlSession.selectList("WalkSetGoalMapper.selectSetGoalList", input);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return output;
	}

	@Override
	public WalkSetGoal editAchieve(WalkSetGoal input) throws Exception {
		WalkSetGoal output = null;
		int result =0;
		try {
			result= sqlSession.update("WalkSetGoalMapper.updateAchieve", input);
			output = sqlSession.selectOne("WalkSetGoalMapper.selectSetGoal", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}
		return output;
	}
}
