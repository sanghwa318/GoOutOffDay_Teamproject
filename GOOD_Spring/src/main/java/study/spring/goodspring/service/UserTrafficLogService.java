package study.spring.goodspring.service;

import java.util.List;

import study.spring.goodspring.model.Member;
import study.spring.goodspring.model.UserTrafficLog;

public interface UserTrafficLogService {

	public void pageIn(UserTrafficLog input) throws Exception;
	
	public void pageOut(UserTrafficLog input) throws Exception;
	
	public void enterBrowser(UserTrafficLog input) throws Exception;
	
	public void addBookmark(UserTrafficLog input) throws Exception;
	
	public void removeBookmark(UserTrafficLog input) throws Exception;
	
	public void walkRecordStart(UserTrafficLog input) throws Exception;

	public void walkRecordEnd(UserTrafficLog input) throws Exception;
	
	public void casExLink(UserTrafficLog input) throws Exception;
	
	public void walkExLink(UserTrafficLog input) throws Exception;
	
	public void userLogin(UserTrafficLog input) throws Exception;
	
	public void userLogout(UserTrafficLog input) throws Exception;
	
	public void addKeyword(UserTrafficLog input) throws Exception;
	
	public int login_count(UserTrafficLog input) throws Exception;

	public List<UserTrafficLog> loginHourCount(UserTrafficLog input) throws Exception;

	public List<UserTrafficLog> loginCountInterval(UserTrafficLog input) throws Exception;
	
	public int join_count(Member input) throws Exception;

	public List<UserTrafficLog> joinHourCount(UserTrafficLog input) throws Exception;
	
	public UserTrafficLog TopSearchKeyword(UserTrafficLog input) throws Exception;
	
	public List<UserTrafficLog> Top10SearchKeyword(UserTrafficLog input) throws Exception;

	
}
