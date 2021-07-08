package study.spring.goodspring.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import study.spring.goodspring.helper.WebHelper;
import study.spring.goodspring.model.Bicycle.RentBikeStatus.Row;
import study.spring.goodspring.uploadservice.BicycleUpload;

@Controller

/**
 * 자전거 메인 페이지
 */
public class BicyleController {
	@Autowired
	WebHelper webHelper;
	@Autowired
	BicycleUpload bicycleUpload;
	
	@RequestMapping(value = "/bicyclePage/bicycle_index.do", method = RequestMethod.GET)
	public String bicycle_index() {
		
		return "/bicyclePage/bicycle_index";
	}
	
	@RequestMapping(value = "/bicyclePage/bicycle_index_search.do", method = RequestMethod.POST)
	public Map<String, Object> bicycle_index_search(
			@RequestParam(required = false, defaultValue = "") String keyword) {
			Row input = new Row();
			input.setStationName(keyword);
			
			List<Row> output = null;
			
			try {
				output = bicycleUpload.getBicycle(input);
			} catch (Exception e) {
				return webHelper.getJsonError(e.getLocalizedMessage());
			}
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("item", data);
		return webHelper.getJsonData(data);
	}
}
