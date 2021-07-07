package study.spring.goodspring.service;

import java.util.List;

import study.spring.goodspring.model.Bicycle.RentBikeStatus.Row;

public interface BicycleUpload {
	public void collectBicycle(List<Row> row) throws Exception;
}
