package study.spring.goodspring.uploadservice;

import java.util.List;

import study.spring.goodspring.model.WalkCourse.SeoulGilWalkCourse.Row;


public interface WalkCourseUploadService {
	/** API DB에 저장 */
	public void collectWalkCourse(List<Row> row) throws Exception;
}
