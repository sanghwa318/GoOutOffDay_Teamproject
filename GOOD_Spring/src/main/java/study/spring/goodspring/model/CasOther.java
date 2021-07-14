package study.spring.goodspring.model;

import lombok.Data;

@Data
public class CasOther {
	private String DIV_COL;
	private String SERVICE;
	private String GUBUN;
	private String SVCID;
	private String MAXCLASSNM;
	private String MINCLASSNM;
	private String SVCSTATNM;
	private String SVCNM;
	private String PAYATNM;
	private String PLACENM;
	private String USETGTINFO;
	private String SVCURL;
	private String X;
	private String Y;
	private String SVCOPNBGNDT;
	private String SVCOPNENDDT;
	private String RCPTBGNDT;
	private String RCPTENDDT;
	private String AREANM;
	private String IMGURL;
	private String DTLCONT;
	private String TELNO;
	private String VMAX;
	private String VMIN;
	private int REVSTDDAY;
	private String REVSTDDAYNM;
	private String regDate;
	private String editDate;
	
	/** [페이지 네이션] (static) */
	private static int offset;
	private static int listCount;
	
	public static int getOffset() {
		return offset;
	}
	public static void setOffset(int offset) {
		CasOther.offset = offset;
	}
	public static int getListCount() {
		return listCount;
	}
	public static void setListCount(int listCount) {
		CasOther.listCount = listCount;
	}
// [페이지 네이션] 종료
}
