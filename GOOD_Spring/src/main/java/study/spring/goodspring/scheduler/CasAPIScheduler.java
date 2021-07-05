package study.spring.goodspring.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.helper.RetrofitHelper;

@Slf4j
@Controller
public class CasAPIScheduler {
	/** 통신처리에 필요한 객체 주입 **/
	@Autowired RetrofitHelper retrofitHelper;
	
	/**
	 * 공연전시 API를 수집하여 DB에 저장하기 위한 메서드
	 */
	@ResponseBody
	@RequestMapping(value = "/cas_api_scheduler", method = RequestMethod.GET)
	public void collectCasShowExh() {
		// 아니 왜안되는건데
	}
}
