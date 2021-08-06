package study.spring.goodspring.service;

import java.util.List;

import study.spring.goodspring.model.WalkSetGoal;

public interface WalkSetGoalService {
	/**
	 * 사용자가 입력한 값을 데이터로 추가하는 메서드
	 * @param input
	 * @throws Exception
	 */
	public void addGoalItem(WalkSetGoal input) throws Exception;
	/**
	 * 사용자의 가장 최근 목표 데이터를 조회하는 메서드
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public WalkSetGoal getGoalItem(WalkSetGoal input) throws Exception;

	
	/**
	 * 사용자의 목표 데이터 전체를 조회하는 메서드
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public List<WalkSetGoal> getGoalList(WalkSetGoal input) throws Exception;
	
	/**
	 * 사용자의 목표 데이터 성취율을 업데이트 한다.
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public WalkSetGoal editAchieve(WalkSetGoal input) throws Exception;
}