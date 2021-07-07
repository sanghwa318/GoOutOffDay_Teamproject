package study.spring.goodspring.controllers;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import study.spring.goodspring.model.Crew;
import study.spring.goodspring.service.CrewService;

@RestController
public class CrewController {
	
	/*
	 * @Autowired private CrewService crewService;
	 * 
	 * 
	 * 
	 * @RequestMapping(value = "/commPage/comm_crew_est", method =
	 * RequestMethod.GET) public Map<String,Object> checkSignup(HttpServletRequest
	 * request) {
	 * 
	 * boolean result = crewService.getCrewNameCheck(request);
	 * 
	 * //결과 만들기
	 * 
	 * Map<String,Object> map = new HashMap<>(); map.put("result", result+"");
	 * return map;
	 * 
	 * }
	 */

	
}
