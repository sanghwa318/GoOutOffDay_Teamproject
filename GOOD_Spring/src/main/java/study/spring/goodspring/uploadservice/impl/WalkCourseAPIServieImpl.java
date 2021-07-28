package study.spring.goodspring.uploadservice.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.WalkCourseAPI.SeoulGilWalkCourse.Row;
import study.spring.goodspring.uploadservice.WalkCourseUploadService;

@Slf4j
@Service
public class WalkCourseAPIServieImpl implements WalkCourseUploadService {

	// Mybatis 연동
	@Autowired
	SqlSession sqlSession;	

	@Override
	public void collectWalkCourse(List<Row> row) throws Exception {
		try {
			// 수집결과를 반복수행하면서 데이터를 저장
			for (Row item : row) {
				// 시작일자와 고유ID가 일치하는 데이터에대한 UPDATE를 시도
				if(sqlSession.update("WalkCourseAPIMapper.updateItem", item) == 0) {
					sqlSession.insert("WalkCourseAPIMapper.insertItem", item);
				}
			}
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
	}
}
