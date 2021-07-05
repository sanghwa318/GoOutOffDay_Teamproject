package study.spring.goodspring.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CasController {
	/** 문화체육 메인페이지 메서드 **/
	@RequestMapping(value = "/casPage/cas_index.do", method = RequestMethod.GET)
	public String cas_index() {
		// casPage/cas_index.jsp파일을 View로 지정 
		return "casPage/cas_index";
	}
	
	/** 문화체육 카테고리 리스트페이지 메서드 **/
	@RequestMapping(value = "/casPage/cas_themeList.do", method = RequestMethod.GET)
	public String cas_ThemeList(Model model,
			// GET 파라미터 받기
			@RequestParam(value = "cas", defaultValue = "") String cas,
			@RequestParam(value = "order", defaultValue = "") String order){
		String result = null;
		String iconurl = null;

		if (cas == null || cas.equals("")) {
			return "casPage/cas_index";
		}

		if (cas.equals("exp")) {
			result = "문화 창의 체험";
			iconurl = "'../assets/icon_img/창의 체험 아이콘.png'";
		} else if (cas.equals("showExh")) {
			result = "공연 전시";
			iconurl = "'../assets/icon_img/공연전시문화 아이콘.png'";
		} else if (cas.equals("imp")) {
			result = "교육 자기 계발";
			iconurl = "'../assets/icon_img/자기계발 아이콘.png'";
		} else if (cas.equals("sportsFac")) {
			result = "체육시설";
			iconurl = "'../assets/icon_img/체육시설 아이콘.png'";
		}
		
		// 파라미터 값을 View에게 전달
		model.addAttribute("cas", cas);
		model.addAttribute("result", result);
		model.addAttribute("iconurl", iconurl);
		model.addAttribute("order", order);
		return "casPage/cas_themeList";
	}
}
