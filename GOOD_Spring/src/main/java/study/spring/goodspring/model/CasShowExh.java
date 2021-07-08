package study.spring.goodspring.model;

import lombok.Data;

@Data
public class CasShowExh {
	
	private String PERFORM_CODE;
	private String TITLE;
	private String START_DATE;
	private String END_DATE;
	private String PLACE_NAME;
	private String PLAY_TIME;
	private String AGE;
	private String PLAN_COMPANY;
	private String INQUIRY_PHONE;
	private String INQUIRY_EMAIL;
	private String TICKET_INFO;
	private String GENRE_NAME;
	private String ISOPEN;
	private String FILE_URL_MI;
	private String FILE_URL_TI;
	private String INFO;
	private String service_tag;
	private String regDate;
	private String editDate;
	
	/** [페이지 네이션] (static) */
	private static int offset;
	private static int listCount;
	
	public static int getOffset() {
		return offset;
	}
	public static void setOffset(int offset) {
		CasShowExh.offset = offset;
	}
	public static int getListCount() {
		return listCount;
	}
	public static void setListCount(int listCount) {
		CasShowExh.listCount = listCount;
	}
// [페이지 네이션] 종료
	
}
