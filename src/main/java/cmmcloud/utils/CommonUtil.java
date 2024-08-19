package cmmcloud.utils;

import cmmcloud.enums.ErrorEnum;
import cmmcloud.enums.error.EtcError;
import cmmcloud.enums.error.RequestError;
import cmmcloud.exception.CustomException;
import cmmcloud.response.ErrObj;
import cmmcloud.response.ResObj;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.YearMonth;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.boot.autoconfigure.web.format.DateTimeFormatters;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class CommonUtil {

  private static final String[] dateFormats = {
      "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd", "yyyyMMdd", "yyyy-MM", "yyyyMM"
  };

  /**
   * =================================================================
   *                 Object Null or Empty 여부 return
   * =================================================================
   *
   * 설명 : Object가 Null 혹은 Empty 인지 return
   *
   * 1. 예시코드
   *
   *    // Body에 storeCode가 들어있는지 검사
   *    if(CommonUtil.isNullOrEmpty(map.get("storeCode")){
   *      return ErrObj.error(RequestError.NOT_ENOUGH_BODY).getObject();
   *    }
   */
  public static boolean isNullOrEmpty(Object obj) {

    return obj == null || "".equals(obj);
  }


  /**
   * =================================================================
   *                           메뉴 권한 여부
   * =================================================================
   *
   * 설명 : 메뉴 권한을 가지지 못한 경우 true, 가진 경우 false return
   *
   * 1. 헤더에서 권한 가져오기
   *
   * 2. 메뉴코드가 포함되어 있는지 검사
   *
   * 3. 예시코드
   *
   *    // 1510004 메뉴권한 없음
   *    if(CommonUtil.notHasMenuRule(headers, 1510004)){
   *      return ErrObj.error(AuthError.UNAUTHORIZED_ACCESS).getObject();
   *    }
   */

  //메뉴 권한을 가지지 못한경우 true, 가진경우 false 반환
  public static boolean notHasMenuRule(HttpHeaders headers, int menuCode) throws ParseException {

    List<String> headerList = headers.get("CBM-AUTH-RULE");

    String ruleStr = headerList.get(0);
    JSONParser parser = new JSONParser();
    JSONObject ruleJson = (JSONObject)parser.parse(ruleStr);

    ArrayList<Double> menuCodeList = (ArrayList<Double>)ruleJson.get("menuCode");
    return !menuCodeList.contains((double)menuCode);
  }

  /**
   * =================================================================
   *        이 API는 삭제될 예정입니다.
   *        checkHeaderAndPutRequestData 메소드를 사용해주세요.
   * =================================================================
   *
   *
   */
  @Deprecated
  public static ResObj checkHeaderAndPutData(HttpHeaders headers, HashMap map) throws ParseException {

    List<String> headerList = headers.get("CBM-AUTH-RULE");
    List<String> userList = headers.get("CBM-AUTH-ID");
    if (CommonUtil.isNullOrEmpty(headerList)
        || headerList.isEmpty()
        || CommonUtil.isNullOrEmpty(userList)
        || userList.isEmpty()){
      return ErrObj.error(RequestError.NOT_ENOUGH_HEADER);
    }

    String ruleStr = headerList.get(0);
    JSONParser parser = new JSONParser();
    JSONObject ruleJson = (JSONObject)parser.parse(ruleStr);

    log.info("CBM-AUTH-RULE : " + ruleJson.toJSONString());
    log.info("CBM-AUTH-ID : " + userList);
    log.info("Request Body & Param : " + map);

    String storeUnqcode = String.valueOf(ruleJson.get("storeUnqcode"));

    // TODO : instanceof 말고 다른 방법 찾기
    if (ruleJson.get("ruleCode") instanceof JSONArray){
      List ruleCodes = (JSONArray) ruleJson.get("ruleCode");
      map.put("ruleCode", ruleCodes);
    }

    if (ruleJson.get("menuCode") instanceof JSONArray) {
      List menuCodes = (JSONArray) ruleJson.get("menuCode");
      map.put("menuCode", menuCodes);
    }

    if (CommonUtil.isNullOrEmpty(storeUnqcode) || storeUnqcode.length() != 14 ) {
      return ErrObj.error(EtcError.WRONG_STORE_UNQCODE);
    }

    // body, param에 fchqCode, storeCode가 있는 경우
    // 중복되어 덮어써지므로 로그인한 유저의 정보를 넣지 않음
    boolean isExistsCode =
        map.containsKey("fchqCode")
        || map.containsKey("storeCode")
        || map.containsKey("storeUnqcode");

    if (!isExistsCode) {
      String fchqCode = storeUnqcode.substring(0, 7);
      String storeCode = storeUnqcode.substring(7, 14);
      map.put("storeUnqcode", storeUnqcode);
      map.put("fchqCode", fchqCode);
      map.put("storeCode", storeCode);
    }

    String userId = userList.get(0);
    map.put("creator", userId);
    map.put("updater", userId);

    return new ResObj(map);
  }

  /**
   * =================================================================
   *         헤더 체크 및 권한코드, 메뉴코드, 매장 고유코드, ID 삽입
   * =================================================================
   *
   * 설명 : 인증 권한, ID 헤더 체크 후 권한코드, 메뉴코드, 매장 고유코드, ID 삽입
   *
   * 1. 헤더에서 권한, ID 가져오기
   *
   * 2. 매장고유코드가 있는지 검사
   *
   * 3. 권한코드, 메뉴코드, 매장 고유코드 , ID를 Map에 넣고 리턴
   *
   * 4. 예시코드
   *
   *    ResObj checkResult = CommonUtil.checkHeaderAndPutData(headers, query);
   *    if(checkResult.hasError){
   *      return checkResult;
   *    }
   */
  public static ResObj checkHeaderAndPutRequestData(HttpHeaders headers, HashMap map)
      throws ParseException {

    List<String> headerList = headers.get("CBM-AUTH-RULE");
    List<String> userList = headers.get("CBM-AUTH-ID");
    if (CommonUtil.isNullOrEmpty(headerList)
        || headerList.isEmpty()
        || CommonUtil.isNullOrEmpty(userList)
        || userList.isEmpty()){
      return ErrObj.error(RequestError.NOT_ENOUGH_HEADER);
    }

    String ruleStr = headerList.get(0);
    JSONParser parser = new JSONParser();
    JSONObject ruleJson = (JSONObject)parser.parse(ruleStr);

    // TODO : instanceof 말고 다른 방법 찾기
    if (ruleJson.get("ruleCode") instanceof JSONArray){
      List ruleCodes = (JSONArray) ruleJson.get("ruleCode");
      map.put("userRuleCode", ruleCodes);
    }

    if (ruleJson.get("menuCode") instanceof JSONArray) {
      List menuCodes = (JSONArray) ruleJson.get("menuCode");
      map.put("userMenuCode", menuCodes);
    }

    String userId = userList.get(0);

    map.put("creator", userId);
    map.put("updater", userId);

    return new ResObj(map);
  }

  /**
   * =================================================================
   *                페이징 검색조건 Integer 타입으로 변경
   * =================================================================
   *
   * 설명 : 페이징 검색조건을 Integer 타입으로 변경
   *       (필수) recordSize - 검색줄수, 한 페이지에 보이는 데이터 갯수
   *       (필수) startNo - 몇번째 데이터부터 보여줄 것인지 데이터의 시작 번호
   *
   * 1. 쿼리 파라미터에서 recordSize, startNo 가져오기
   *
   * 2. recordSize, startNo 검사
   *
   * 3. Integer 타입으로 변경
   *
   * 4. 예시 코드
   *
   *    ResObj convertResult = CommonUtil.convertIntegerByPagingCondition(query);
   *    if(convertResult.hasError){
   *      return convertResult;
   *    }
   */
  public static ResObj convertIntegerByPagingCondition(HashMap query) {

    // recordSize, startNo null인 경우
    if (isNullOrEmpty(query.get("recordSize")) || isNullOrEmpty(query.get("startNo"))) {
      return ErrObj.error(RequestError.NOT_ENOUGH_QUERY_PAGING_FIELD);
    }

    try{
      int recordSize = Integer.parseInt(query.get("recordSize").toString());
      int startNo = Integer.parseInt(query.get("startNo").toString());

      // recordSize가 0이면 페이지에서 보여지는 개수 0개
      if (recordSize == 0){
        return ErrObj.error(RequestError.WRONG_PAGING_FIELD);
      }

      query.put("recordSize", recordSize);
      query.put("startNo", startNo);
    } catch (NumberFormatException e) {
      return ErrObj.error(RequestError.WRONG_PAGING_FIELD);
    }

    return new ResObj();
  }

  /**
   * =================================================================
   *                     Date(DateTime) 포맷 검증
   * =================================================================
   *
   * 설명 : 날짜형식이 다음과 같은지 검사
   * -> yyyy-MM-dd HH:mm:ss
   * -> yyyy-MM-dd
   * -> yyyyMMdd
   *
   * 형식에 맞으면 true, 아니면 false
   *
   * 예시 코드)
   *    if (!CommonUtil.isDateTimeFormat(body.get("startDe")) {
   *      return ErrObj.error(EtcError.IS_NOT_DATE_FORMAT).getObject();
   *    }
   */
  public static boolean isDateTimeFormat(Object obj) {

    String date = String.valueOf(obj);
    boolean isMatchFormat = false;

    for (String format : dateFormats) {
      try{
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(format);

        // Year Month Format 검사
        if (date.length() <= 7) {
          YearMonth.parse(date, formatter);
        }
        // Date Format 검사
        else if (date.length() <= 10) {
          LocalDate.parse(date, formatter);
        }
        // DateTime Format 검사
        else {
          LocalDateTime.parse(date, formatter);
        }

        // Format 에러발생 안한 경우 break
        isMatchFormat = true;
        break;
      } catch (DateTimeParseException e) {
      }
    }

    return isMatchFormat;
  }

  /**
   * =================================================================
   *                   두 Date(DateTime) 데이터 비교
   * =================================================================
   *
   * 설명 : 첫번째 입력받은 값이 두번째 입력받은 값보다 작은지 비교
   *
   * 예시 코드)
   *    ResObj checkDateTime = CommonUtil.compareDateTime(body.get("startDe"), body.get("endDe"));
   *    if (checkDateTime.hasError) {
   *      return checkDateTime.getObject();
   *    }
   */
  public static ResObj compareDateTime(Object obj1, Object obj2) {

    if (!isDateTimeFormat(obj1) || !isDateTimeFormat(obj2)) {
      return ErrObj.error(EtcError.IS_NOT_DATE_FORMAT);
    }

    String date1 = String.valueOf(obj1);
    String date2 = String.valueOf(obj2);

    if (date1.length() != date2.length()) {
      log.error("입력받은 두 값이 길이가 다릅니다.");
      return ErrObj.error(EtcError.TWO_VALUES_DIFFERENT_LENGTH);
    }

    boolean isAfter = false;

    for (String format : dateFormats) {
      try{
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(format);

        // Year Month 검사
        if (date1.length() <= 7) {
          YearMonth yearMonth1 = YearMonth.parse(date1, formatter);
          YearMonth yearMonth2 = YearMonth.parse(date1, formatter);
          isAfter = yearMonth1.isAfter(yearMonth2);
          break;
        }
        // Date Format 검사
        if (date1.length() <= 10) {
          LocalDate localDate1 = LocalDate.parse(date1, formatter);
          LocalDate localDate2 = LocalDate.parse(date2, formatter);
          isAfter = localDate1.isAfter(localDate2);
          break;
        }
        // DateTime Format 검사
        else {
          LocalDateTime localDateTime1 = LocalDateTime.parse(date1, formatter);
          LocalDateTime localDateTime2 = LocalDateTime.parse(date2, formatter);
          isAfter = localDateTime1.isAfter(localDateTime2);
          break;
        }
      } catch (DateTimeParseException e) {
      }
    }

    return isAfter ? ErrObj.error(EtcError.START_DATE_GREATER_THAN_END_DATE) : new ResObj();
  }

  /**
   * =================================================================
   *                    현재 일자 가져오기 (yyyyMMdd)
   * =================================================================
   *
   * 설명 : 현재 일자를 yyyyMMdd 포맷으로 int형으로 가져온다.
   *
   * 예시 코드)
   *    int nowDe = CommonUtil.getNowDe();
   */
  public static int getNowDe() {

    LocalDate now = LocalDate.now(ZoneId.of("Asia/Seoul"));
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");

    return Integer.parseInt(now.format(formatter));
  }

  /**
   * =================================================================
   *               현재 시각 가져오기 (yyyy-MM-dd HH:mm:ss)
   * =================================================================
   *
   * 설명 : 현재 시각을 yyyy-MM-dd HH:mm:ss 포맷으로 String 형으로 가져온다.
   *
   * 예시 코드)
   *    String nowDt = CommonUtil.getNowDt();
   */
  public static String getNowDt() {

    LocalDateTime now = LocalDateTime.now(ZoneId.of("Asia/Seoul"));
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    return now.format(formatter);
  }

  /**
   * =================================================================
   *               현재 시각 가져오기 (yyyyMMddHHmmssSSS)
   * =================================================================
   *
   * 설명 : 현재 시각을 yyyyMMddHHmmssSSS 포맷으로 String 형으로 가져온다.
   *
   * 예시 코드)
   *    String nowDt = CommonUtil.getNowDts();
   */
  public static String getNowDts() {

    LocalDateTime now = LocalDateTime.now(ZoneId.of("Asia/Seoul"));
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS");

    return now.format(formatter);
  }

  /**
   * =================================================================
   *                    다중 삽입시 중복된 데이터 검사
   * =================================================================
   *
   * 설명 : 다중 삽입시 Body에 중복된 key가 있는지, 기존 데이터와 중복된 key가 있는지 검사한다.
   * 1. 중복 검사에 사용할 HashSet 선언
   *    (HashSet은 중복된 key가 들어가지 않으므로 중복 검사에 사용)
   *
   * 2. bodyData에서 중복된 key가 있는지 검사
   *    key 리스트를 추출하고 Set에 add
   *
   * 3. selectKeyData와 중복된 key가 있는지 검사
   *    bodyData와 selectKeyData를 합친 후 Set에 add
   *
   * 예시 코드) ex.사원 정보를 추가하기 전 검사
   *    List<HashMap> bodyData = (List<HashMap>) body.get("list");    // body에서 list 꺼내기
   *    List<String> selectKeyData = staffDao.getAllStaffCode(body);  // key 데이터 Select
   *
   *    // 기본 Error 반환할 경우
   *    ResObj checkResult = CheckDuplicateKeyAtInsert(
   *      bodyData, selectKeyData, staffCode);
   *
   *    // 커스텀 Error 반환할 경우 (오버로딩 메소드 사용)
   *    ResObj checkResult = CheckDuplicateKeyAtInsert(
   *      bodyData, selectKeyData, staffCode, StaffError.DUPLICATE_STAFF_CODE);
   */
  public static ResObj CheckDuplicateKeyAtInsert(
      List<HashMap> bodyData,
      List<String> selectKeyData,
      String keyColNm){

    // 1. 중복 검사에 사용할 HashSet 선언
    Set<String> keySet = new HashSet<>();

    // 2. bodyData에서 중복된 key가 있는지 검사
    List<String> bodyKeyData = bodyData.stream()
        .map(obj -> obj.get(keyColNm).toString())
        .collect(Collectors.toList());
    for (String key : bodyKeyData) {
      if (!keySet.add(key)){
        return ErrObj.error(EtcError.DUPLICATED_DATA_IN_BODY);
      }
    }

    // 3. selectKeyData와 중복된 key가 있는지 검사
    keySet.clear();
    bodyKeyData.addAll(selectKeyData);
    for (String key : bodyKeyData) {
      if (!keySet.add(key)){
        return ErrObj.error(EtcError.DUPLICATED_DATA_IN_BODY);
      }
    }

    return new ResObj();
  }

  /**
   * 각 서비스에서 사용할 에러 Enum 적용 오버로딩 메소드
   */
  public static ResObj CheckDuplicateKeyAtInsert(
      List<HashMap> bodyData,
      List<String> selectKeyData,
      String keyColNm,
      ErrorEnum error){

    // 1. 중복 검사에 사용할 HashSet 선언
    Set<String> keySet = new HashSet<>();

    // 2. bodyData에서 중복된 key가 있는지 검사
    List<String> bodyKeyData = bodyData.stream()
        .map(obj -> obj.get(keyColNm).toString())
        .collect(Collectors.toList());
    for (String key : bodyKeyData) {
      if (!keySet.add(key)){
        return ErrObj.error(EtcError.DUPLICATED_DATA_IN_BODY);
      }
    }

    // 3. selectKeyData와 중복된 key가 있는지 검사
    keySet.clear();
    bodyKeyData.addAll(selectKeyData);
    for (String key : bodyKeyData) {
      if (!keySet.add(key)){
        return ErrObj.error(error);
      }
    }

    return new ResObj();
  }

  /**
   * =================================================================
   *                  다중 수정, 삭제시 중복된 데이터 검사
   * =================================================================
   *
   * 설명 : 다중 수정, 삭제시 Body에 중복된 key가 있는지, 기존 데이터에 요청한 key가 있는지 검사한다.
   * 1. 중복 검사에 사용할 HashSet 선언
   *    (HashSet은 중복된 key가 들어가지 않으므로 중복 검사에 사용)
   *
   * 2. bodyData에서 중복된 key가 있는지 검사
   *    key 리스트를 추출하고 Set에 add
   *
   * 3. selectKeyData에 존재하는 key인지 검사
   *    bodyData에서 selectKeyData를 지운 후 Empty 검사
   *    
   * 예시 코드) ex.사원 정보를 수정하기 전 검사
   *    List<HashMap> bodyData = (List<HashMap>) body.get("list");    // body에서 list 꺼내기
   *    List<String> selectKeyData = staffDao.getAllStaffCode(body);  // key 데이터 Select
   *    
   *    // 기본 Error 반환할 경우
   *    ResObj checkResult = CheckDuplicateKeyAtUpdateOrDelete(
   *      bodyData, selectKeyData, staffCode);  
   *
   *    // 커스텀 Error 반환할 경우 (오버로딩 메소드 사용)
   *    ResObj checkResult = CheckDuplicateKeyAtUpdateOrDelete(
   *      bodyData, selectKeyData, staffCode, StaffError.NOT_EXIST_STAFF);
   */
  public static ResObj CheckDuplicateKeyAtUpdateOrDelete(
      List<HashMap> bodyData,
      List<String> selectKeyData,
      String keyColNm){

    // 1. 중복 검사에 사용할 HashSet 선언
    Set<String> keySet = new HashSet<>();

    // 2. bodyData에서 중복된 key가 있는지 검사
    List<String> bodyKeyData = bodyData.stream()
        .map(obj -> obj.get(keyColNm).toString())
        .collect(Collectors.toList());
    for (String key : bodyKeyData) {
      if (!keySet.add(key)){
        return ErrObj.error(EtcError.DUPLICATED_DATA_IN_BODY);
      }
    }

    // 3. selectKeyData에 존재하는 key인지 검사
    keySet.clear();
    bodyKeyData.removeAll(selectKeyData);
    if (!bodyKeyData.isEmpty()) {
      return ErrObj.error(EtcError.NOT_EXIST_DATA_IN_BODY);
    }

    return new ResObj();
  }

  /**
   * 각 서비스에서 사용할 에러 Enum 적용 오버로딩 메소드
   */
  public static ResObj CheckDuplicateKeyAtUpdateOrDelete(
      List<HashMap> bodyData,
      List<String> selectKeyData,
      String keyColNm,
      ErrorEnum error){

    // 1. 중복 검사에 사용할 HashSet 선언
    Set<String> keySet = new HashSet<>();

    // 2. bodyData에서 중복된 key가 있는지 검사
    List<String> bodyKeyData = bodyData.stream()
        .map(obj -> obj.get(keyColNm).toString())
        .collect(Collectors.toList());
    for (String key : bodyKeyData) {
      if (!keySet.add(key)){
        return ErrObj.error(EtcError.DUPLICATED_DATA_IN_BODY);
      }
    }

    // 3. selectKeyData에 존재하는 key인지 검사
    keySet.clear();
    bodyKeyData.removeAll(selectKeyData);
    if (!bodyKeyData.isEmpty()) {
      return ErrObj.error(error);
    }

    return new ResObj();
  }
}
