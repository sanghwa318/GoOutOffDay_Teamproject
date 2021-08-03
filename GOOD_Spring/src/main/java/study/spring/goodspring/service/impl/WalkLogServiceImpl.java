package study.spring.goodspring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.WalkLog;
import study.spring.goodspring.service.WalkLogService;

@Slf4j
@Service
public class WalkLogServiceImpl implements WalkLogService {
	@Autowired
	SqlSession sqlSession;

	@Override
	public void addWalkLog(WalkLog input) throws Exception {
		// List<WalkLog> output=null;
		int result = 0;

		try {
			result = sqlSession.insert("WalkLogMapper.insertWalkLog", input);
			// output= sqlSession.selectList("WalkLogMapper.selectWalkLogList", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}

		return;
	}

	@Override
	public void startRecord(WalkLog input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("WalkLogMapper.startRecord", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}

		return;
	}

	@Override
	public void endRecord(WalkLog input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("WalkLogMapper.endRecord", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}

		return;
	}

	@Override
	public void updateCourseName(WalkLog input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("WalkLogMapper.updateCourseName", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}

		return;
	}

	@Override
	public List<WalkLog> getLoc(WalkLog input) throws Exception {
		List<WalkLog> result = null;

		try {
			result = sqlSession.selectList("WalkLogMapper.selectLocationList", input);
			if (result == null) {
				throw new NullPointerException("output =null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public List<WalkLog> getCoureName(WalkLog input) throws Exception {
		List<WalkLog> result = null;
		try {
			result = sqlSession.selectList("WalkLogMapper.selectCourseNameList", input);
			if (result == null) {
				throw new NullPointerException("output =null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public void courseNameUniqueCheck(WalkLog input) throws Exception {
		int result = 0;
		try {
			result = sqlSession.selectOne("WalkLogMapper.courseNameUniqueCheck", input);
			if (result > 0) {
				throw new Exception("result=" + result);
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}
	}

	@Override
	public List<WalkLog> getLoc2(WalkLog input) throws Exception {
		List<WalkLog> result = null;

		try {
			result = sqlSession.selectList("WalkLogMapper.selectLocationList2", input);
			if (result == null) {
				throw new NullPointerException("output =null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public void deleteNull(WalkLog input) throws Exception {
		try {
			sqlSession.delete("WalkLogMapper.deleteNull", input);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}
	}

	@Override
	public List<WalkLog> getLatLonList(WalkLog input) throws Exception {
		List<WalkLog> output = null;
		try {
			output = sqlSession.selectList("WalkLogMapper.selectLogByCourse", input);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return output;
	}

	@Override
	public double distance(double lat1, double lon1, double lat2, double lon2, String unit) {

		double theta = lon1 - lon2;
		double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2))
				+ Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));

		dist = Math.acos(dist);
		dist = rad2deg(dist);
		dist = dist * 60 * 1.1515;

		if (unit == "kilometer") {
			dist = dist * 1.609344;
		} else if (unit == "meter") {
			dist = dist * 1609.344;
		}

		return (dist);
	}

	@Override
	// This function converts decimal degrees to radians
	public double deg2rad(double deg) {
		return (deg * Math.PI / 180.0);
	}

	@Override
	// This function converts radians to decimal degrees
	public double rad2deg(double rad) {
		return (rad * 180 / Math.PI);
	}

	@Override
	public WalkLog getTime(WalkLog input) throws Exception {
		WalkLog result = null;
		try {
			result = sqlSession.selectOne("WalkLogMapper.selectLogTime", input);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

}
