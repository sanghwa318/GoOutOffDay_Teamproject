package study.spring.goodspring.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.UserTrafficLog;
import study.spring.goodspring.service.UserTrafficLogService;

@Service
@Slf4j
public class UserTrafficLogServiceImpl implements UserTrafficLogService{
	@Autowired
	SqlSession sqlSession;
	
	
	@Override
	public void pageIn(UserTrafficLog input) throws Exception {
		try {
			
		sqlSession.insert("UserTrafficLogMapper.pageIn", input);
		
		}catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		}catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}
	}

	@Override
	public void pageOut(UserTrafficLog input) throws Exception {
		try {
			
		sqlSession.insert("UserTrafficLogMapper.pageOut", input);
		
		}catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		}catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}
	}

	@Override
	public void enterBrowser(UserTrafficLog input) throws Exception {
		try {
			
		sqlSession.insert("UserTrafficLogMapper.enterBrowser", input);
		
		}catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		}catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}
	}

	@Override
	public void addBookmark(UserTrafficLog input) throws Exception {
		try {
			
		sqlSession.insert("UserTrafficLogMapper.addBookmark", input);
		
		}catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		}catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}
	}

	@Override
	public void removeBookmark(UserTrafficLog input) throws Exception {
		try {
			
		sqlSession.insert("UserTrafficLogMapper.removeBookmark", input);
		
		}catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		}catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}
	}

	@Override
	public void walkRecord(UserTrafficLog input) throws Exception {
		try {
			
		sqlSession.insert("UserTrafficLogMapper.walkRecord", input);
		
		}catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		}catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}
	}

	@Override
	public void casExLink(UserTrafficLog input) throws Exception {
		try {
			
		sqlSession.insert("UserTrafficLogMapper.casExLink", input);
		
		}catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		}catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}
	}

	@Override
	public void walkExLink(UserTrafficLog input) throws Exception {
		try {
			
		sqlSession.insert("UserTrafficLogMapper.walkExLink", input);
		
		}catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		}catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}
	}

	@Override
	public void userLogin(UserTrafficLog input) throws Exception {
		try {
			
		sqlSession.insert("UserTrafficLogMapper.userLogin", input);
		
		}catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		}catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}
	}

	@Override
	public void userLogout(UserTrafficLog input) throws Exception {
		try {
			
		sqlSession.insert("UserTrafficLogMapper.userLogout", input);
		
		}catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		}catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}
	}

}
