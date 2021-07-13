package study.spring.goodspring.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data
public class CasAPIList {
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
