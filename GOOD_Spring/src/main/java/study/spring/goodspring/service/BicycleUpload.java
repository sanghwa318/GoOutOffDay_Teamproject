package study.spring.goodspring.service;

import java.util.List;

import study.spring.goodspring.model.Bicycle;
import study.spring.goodspring.model.Bicycle.RentBikeStatus.Row;

public interface BicycleUpload {
	/** API DB에 저장 */
	public void collectBicycle(List<Row> row) throws Exception;
	
	/** API DB 조회 */
	public List<Bicycle> getBicycle(Bicycle input) throws Exception;
}
