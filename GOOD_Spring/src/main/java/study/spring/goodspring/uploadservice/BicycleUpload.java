package study.spring.goodspring.uploadservice;

import java.util.List;

import study.spring.goodspring.model.Bicycle.RentBikeStatus.Row;

public interface BicycleUpload {
	public void collectBicycle(List<Row> row) throws Exception;
}
