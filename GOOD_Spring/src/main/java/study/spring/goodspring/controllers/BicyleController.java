package study.spring.goodspring.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



import study.spring.goodspring.helper.WebHelper;
import study.spring.goodspring.model.Bicycle.rentBikeStatus.row;
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
	
	/**
	 * 자전거 메인 페이지
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/bicyclePage/bicycle_index.do", method = RequestMethod.GET)
	public ModelAndView bicycle_index(Model model, HttpServletResponse response) {
		
		return new ModelAndView("/bicyclePage/bicycle_index");

	}
	
	/**
	 * 자전거 대여소 검색
	 * @param model
	 * @param keyword
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/bicyclePage/bicycle_index_search.do", method = RequestMethod.GET)
	public Map<String, Object> bicycle_index_search(Model model,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) {

		row input = new row();
		input.setStationName(keyword);

		List<row> output = null;

		try {
			output = bicycleUpload.getBicycle(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("keyword", keyword);
		data.put("item", output);
		return webHelper.getJsonData(data);

	}
	
	/**
	 * 실시간 자전거 현황 지도
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/bicyclePage/bicycle_index_map", method = RequestMethod.GET)
	public Map<String, Object> bicycle_index_map() {
		row input = new row();
		List<row> output = null;
		
		try {
			output = bicycleUpload.getBicycle(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("item", output);
		return webHelper.getJsonData(data);
	}
}
