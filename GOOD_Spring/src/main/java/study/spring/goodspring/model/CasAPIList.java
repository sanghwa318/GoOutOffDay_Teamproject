package study.spring.goodspring.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data
public class CasAPIList {
	@SerializedName("SJWPerform")
	private SJWPerform SJWPerform;

	@Data
	public class SJWPerform {
		@SerializedName("list_total_count")
		private int list_total_count;
		@SerializedName("RESULT")
		private RESULT RESULT;
		@SerializedName("row")
		private List<row> row;

		@Data
		public class RESULT {
			@SerializedName("CODE")
			private String CODE;
			@SerializedName("MESSAGE")
			private String MESSAGE;
		}

		/** 실질적으로 사용하는 공연전시 API 데이터 **/
		@Data
		public class row {

			private String service_tag;
			private String regDate;
			private String editDate;

			@SerializedName("PERFORM_CODE")
			private String PERFORM_CODE;
			@SerializedName("TITLE")
			private String TITLE;
			@SerializedName("START_DATE")
			private String START_DATE;
			@SerializedName("END_DATE")
			private String END_DATE;
			@SerializedName("PLACE_NAME")
			private String PLACE_NAME;
			@SerializedName("PLAY_TIME")
			private String PLAY_TIME;
			@SerializedName("AGE")
			private String AGE;
			@SerializedName("PLAN_COMPANY")
			private String PLAN_COMPANY;
			@SerializedName("INQUIRY_PHONE")
			private String INQUIRY_PHONE;
			@SerializedName("INQUIRY_EMAIL")
			private String INQUIRY_EMAIL;
			@SerializedName("TICKET_INFO")
			private String TICKET_INFO;
			@SerializedName("DISCOUNT_INFO")
			private String DISCOUNT_INFO;
			@SerializedName("DISCOUNT_CHARGED")
			private String DISCOUNT_CHARGED;
			@SerializedName("GENRE_NAME")
			private String GENRE_NAME;
			@SerializedName("ISOPEN")
			private String ISOPEN;
			@SerializedName("ISOPENNM")
			private String ISOPENNM;
			@SerializedName("FILE_URL_MI")
			private String FILE_URL_MI;
			@SerializedName("FILE_URL_TI")
			private String FILE_URL_TI;
			@SerializedName("INFO")
			private String INFO;
			@SerializedName("DETAIL")
			private String DETAIL;
			@SerializedName("CAST_INFO")
			private String CAST_INFO;

		}
	}
	
	
	@SerializedName("tvYeyakCOllect")
	private tvYeyakCOllect tvYeyakCOllect;

	@Data
	public class tvYeyakCOllect {
		@SerializedName("list_total_count")
		private int list_total_count;
		@SerializedName("RESULT")
		private RESULT RESULT;

		@Data
		public class RESULT {
			@SerializedName("CODE")
			private String CODE;
			@SerializedName("MESSAGE")
			private String MESSAGE;
		}
	
		@SerializedName("row")
		private List<Row> row;
		/** 실직적으로사용하는 문화체육 / 체육시설 / 자기계발 데이터 **/
		@Data
		public class Row {
			
			@SerializedName("DIV")
			private String DIV;
			@SerializedName("SERVICE")
			private String SERVICE;
			@SerializedName("GUBUN")
			private String GUBUN;
			@SerializedName("SVCID")
			private String SVCID;
			@SerializedName("MAXCLASSNM")
			private String MAXCLASSNM;
			@SerializedName("MINCLASSNM")
			private String MINCLASSNM;
			@SerializedName("SVCSTATNM")
			private String SVCSTATNM;
			@SerializedName("SVCNM")
			private String SVCNM;
			@SerializedName("PAYATNM")
			private String PAYATNM;
			@SerializedName("PLACENM")
			private String PLACENM;
			@SerializedName("USETGTINFO")
			private String USETGTINFO;
			@SerializedName("SVCURL")
			private String SVCURL;
			@SerializedName("X")
			private String X;
			@SerializedName("Y")
			private String Y;
			@SerializedName("SVCOPNBGNDT")
			private String SVCOPNBGNDT;
			@SerializedName("SVCOPNENDDT")
			private String SVCOPNENDDT;
			@SerializedName("RCPTBGNDT")
			private String RCPTBGNDT;
			@SerializedName("RCPTENDDT")
			private String RCPTENDDT;
			@SerializedName("AREANM")
			private String AREANM;
			@SerializedName("IMGURL")
			private String IMGURL;
			@SerializedName("DTLCONT")
			private String DTLCONT;
			@SerializedName("TELNO")
			private String TELNO;
			@SerializedName("V_MAX")
			private String V_MAX;
			@SerializedName("V_MIN")
			private String V_MIN;
			@SerializedName("REVSTDDAY")
			private int REVSTDDAY;
			@SerializedName("REVSTDDAYNM")
			private String REVSTDDAYNM;
		}
	}
}
