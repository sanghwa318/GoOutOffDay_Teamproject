package study.spring.goodspring.uploadservice;

import java.util.List;

import study.spring.goodspring.model.Bicycle.rentBikeStatus.row;

public interface BicycleUpload {
	/** API DB에 저장 */
	public void collectBicycle(List<row> row) throws Exception;
	
	/** DB에 저장된 값 조회 */
	public List<row> getBicycle(row input) throws Exception;
}