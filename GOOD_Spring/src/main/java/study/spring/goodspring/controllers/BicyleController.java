package study.spring.goodspring.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import study.spring.goodspring.model.Bicycle.rentBikeStatus;
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
	public ModelAndView bicycle_index(Model model, HttpServletResponse response) {
		
		List<row> output = null;
		
		try {
			// 데이터 조회하기
			output = bicycleUpload.getBicycle(null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// View 처리
		model.addAttribute("output", output);
		return new ModelAndView("/bicyclePage/bicycle_index");

	}
@ResponseBody
	@RequestMapping(value = "/bicyclePage/bicycle_index_search.do", method = RequestMethod.GET)
	public Map<String, Object> bicycle_index_search(Model model,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) {

//		Bicycle.rentBikeStatus rentBikeStatus = bicycle.new rentBikeStatus();
//		rentBikeStatus.row input = rentBikeStatus.new row();
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
}
