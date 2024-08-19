package cmm.utils;

import cmmcloud.response.ErrObj;
import cmmcloud.utils.CommonUtil;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.stream.Stream;
import lombok.extern.slf4j.Slf4j;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

@Slf4j
public class MemberMnUtils {

  public static Integer getNextCode(List<HashMap<String, Object>> codes, Integer defaultCode) {

    Collections.sort(codes, (map1, map2) -> {
      int a = Integer.parseInt((String) map1.get("codes"));
      int b = Integer.parseInt((String) map2.get("codes"));
      return a > b ? 1 : a < b ? -1 : 0;
    });

    Integer nextCode = defaultCode;
    for (HashMap code : codes) {
      Integer tempCode = Integer.parseInt((String) code.get("codes")) + 1;
      // 데이터가 없을 경우
      if (!codes.stream().anyMatch(e -> Integer.parseInt((String) e.get("codes")) == defaultCode)) {
        break;
      }

      // 마지막 번호까지 순차적으로 존재하는 경우
      if (codes.size() == codes.indexOf(code)) {
        nextCode = tempCode;
        break;
      }

      // 중간에 빠진 번호가 있는 경우
      if (!codes.stream().anyMatch(e -> Integer.parseInt((String) e.get("codes")) == tempCode)) {
        nextCode = tempCode;
        break;
      }
    }

    return nextCode;
  }

  public static boolean isNullOrEmptyMbrValid(HashMap<String, Object> member) {
    if (CommonUtil.isNullOrEmpty(member.get("mbrGrdCode"))
        || CommonUtil.isNullOrEmpty(member.get("koMbrNm"))
        || CommonUtil.isNullOrEmpty(member.get("regStoreNm"))
        || CommonUtil.isNullOrEmpty(member.get("gender"))
        || CommonUtil.isNullOrEmpty(member.get("mbrCelno"))
        || CommonUtil.isNullOrEmpty(member.get("shortNoSeCode"))
        || CommonUtil.isNullOrEmpty(member.get("emailRcvdAt"))
        || CommonUtil.isNullOrEmpty(member.get("smsRcvdAt"))
        || CommonUtil.isNullOrEmpty(member.get("dmRcvdAt"))
        || CommonUtil.isNullOrEmpty(member.get("useAt"))
    ) {
      return true;
    }
    return false;
  }

  // 페이징 처리
  public static HashMap<String, Object> getPageNums(HashMap map) {
    int mbrTtlCnt = Integer.parseInt(map.get("mbrTtlCnt").toString());// 전체 데이터 수
    int limitCnt = Integer.parseInt(map.get("limitCnt").toString());    // 한 페이지에 출력 될 데이터 수
    int ttlPageCnt;    // 전체 페이지 수
    int curPageNum;         // 현재 페이지 번호
    int srchNum = 0;   // 어디서 부터 검색 할 건지
    // 전체 데이터 수에서 페이지 데이터 출력수를 나눈 후 나머지 값이 0 이상이면 +1

    ttlPageCnt = (mbrTtlCnt / limitCnt);
    if ((mbrTtlCnt % limitCnt) > 0) {
      ttlPageCnt = ttlPageCnt + 1;
    }

    if (!CommonUtil.isNullOrEmpty(map.get("curPageNum"))) {
      curPageNum = Integer.parseInt(map.get("curPageNum").toString());
      srchNum = limitCnt * (Integer.parseInt(map.get("curPageNum").toString()) - 1);
    } else {
      curPageNum = 1;
    }

    map.put("ttlPageCnt", ttlPageCnt);
    map.put("curPageNum", curPageNum);
    map.put("srchNum", srchNum);

    return map;
  }

  // getLocalDate
  public static Integer getLocalDate() {
    LocalDate joinDate = LocalDate.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
    return Integer.parseInt(joinDate.format(formatter));
  }

  // map -> jsonString
  public static String toJsonString(HashMap<String, Object> map) {
    Gson gson = new Gson();

    String resultStr;
    resultStr = gson.toJson(map);

    return resultStr;
  }

  // jsonString -> HashMap
  public static HashMap<String, Object> toHashMap(String jsonString) {
    Gson gson = new Gson();
    HashMap<String, Object> map = gson.fromJson(jsonString, HashMap.class);
    return map;
  }
}
