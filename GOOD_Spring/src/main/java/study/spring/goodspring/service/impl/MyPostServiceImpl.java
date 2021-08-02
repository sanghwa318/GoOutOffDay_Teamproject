package study.spring.goodspring.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.CrewPost;
import study.spring.goodspring.model.MyCourses;
import study.spring.goodspring.service.MyPostService;

@Slf4j
@Service
public class MyPostServiceImpl implements MyPostService {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<MyCourses> getMyCoursePost(int input) throws Exception {
		List<MyCourses> output = null;

		try {
			output = sqlSession.selectList("MyCourseMapper.selectMycoursePostList", input);
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
	public List<CrewPost> getCrewPost(int input) throws Exception {
		List<CrewPost> output = null;

		try {
			output = sqlSession.selectList("CrewPostMapper.selectCrewPostList", input);
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
	public List<Object> sortPost(List<MyCourses> mycourse, List<CrewPost> crewpost) throws Exception {

		List<Object> list = new ArrayList<Object>();
		int a = mycourse.size();
		int b = crewpost.size();
		
		
		if (a == 0 && b != 0) {
			for(int i=0; i<a; i++) {
				crewpost.get(i).setDtype("crewpost");
				list.add(crewpost.get(i));
				log.error(i + "번째 크루포스트 추가");
			}
			return list;
		} else if (a != 0 && b == 0) {
			for(int i=0; i<a; i++) {
			mycourse.get(i).setDtype("mycourse");
			list.add(mycourse.get(i));
			log.error(i + "번째 나만의코스 추가");
			}
			return list;
		} else if (a == 0 && b == 0) {
			return null;
		} else if (a != 0 && b != 0) {
			int i = 0;
			int j = 0;
			boolean result = true;
			log.error("나만의코스 사이즈 : " + a);
			log.error("크루포스트 사이즈 : " + b);
			while (result) {

				try {
					SimpleDateFormat input_format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 입력포멧

					MyCourses m_tmp = mycourse.get(i);

					CrewPost c_tmp = crewpost.get(j);

					Date mycourse_t = input_format.parse(m_tmp.getMycourse_createdate());
					Date crewpost_t = input_format.parse(c_tmp.getPost_createdate());

					long mt = mycourse_t.getTime();
					long ct = crewpost_t.getTime();

					if (mt < ct) {
						m_tmp.setDtype("mycourse");
						list.add(m_tmp);
						log.error(i + "번째 나만의코스 추가");
						i++;
					}
					if (mt > ct) {
						c_tmp.setDtype("crewpost");
						list.add(c_tmp);
						log.error(j + "번째 크루포스트 추가");
						j++;
					}
					if (i == a) {
						for (int k = j; k < b; k++) {
							crewpost.get(k).setDtype("crewpost");
							list.add(crewpost.get(k));
							log.error(k + "번째 크루포스트 추가");
						}
						result = false;
						break;
					}
					if (j == b) {
						for (int l = i; l < a; l++) {
							mycourse.get(l).setDtype("mycourse");
							list.add(mycourse.get(l));
							log.error(l + "번째 나만의코스 추가");
						}
						result = false;
						break;
					}
				} catch (ParseException e) {
					log.error(e.getLocalizedMessage());
					throw new Exception("조회된 데이터가 없습니다.");
				}
			}

		}
			return list;

	}

}
