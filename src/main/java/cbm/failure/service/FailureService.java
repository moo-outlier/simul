package cbm.failure.service;

import cbm.failure.dao.FailureDAO;
import cbm.failure.dao.SelectFailureDAO;
import cmm.enums.error.VehicleError;
import cmmcloud.enums.error.EtcError;
import cmmcloud.response.ErrObj;
import cmmcloud.response.ResObj;
import cmmcloud.vo.PagingVO;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class FailureService {

  @Autowired
  SelectFailureDAO selectFailureDAO;
  @Autowired
  FailureDAO failureDAO;

  /* 고장 이력 목록 조회 */
  public ResObj getFailureList(HashMap query) throws Exception {

    /* 1. 날짜 검색조건 데이터 포맷 변경 */
    this.setDateDataFormat(query);

    /* 2. 고장 이력 총 갯수 조회 */
    int failureCount =  selectFailureDAO.getFailureCount(query);

    /* 3. 고장 이력 목록 리스트 */
    List<HashMap> failureList = selectFailureDAO.getFailureList(query);
    if (failureList.isEmpty()) {
      return ErrObj.error(EtcError.NONE_SELECT_DATA);
    }

    /* 4. - 고장이력 PID(failureHPid) -> failureUnqcode로 변경
    *     - 거리 데이터 타입 int -> String 변경
    *     - 차량구분코드 두자리로  -> 01 과 같이 변경
    * */
    for (HashMap failure : failureList){
      String failureHPid = failure.get("failureHPid").toString();
      failure.put("failureUnqcode", failureHPid);
      failure.remove("failureHPid");

      String failureDstnc = failure.get("failureDstnc").toString();
      failure.replace("failureDstnc", failureDstnc);

      String carSeCode = failure.get("carSeCode").toString();
      if (carSeCode.length() < 2){
        String renameCarSeCode = "0" + carSeCode;
        failure.replace("carSeCode", renameCarSeCode);
      }
    }

    PagingVO pagingVO = new PagingVO(failureCount, query);
    return new ResObj(pagingVO, failureList);
  }

  /* 고장 코드 상세 조회 */
  public ResObj getFailureCode(HashMap query) throws Exception {

    /* 1. 고장 코드 상세 조회 */
    Optional<HashMap> failure = selectFailureDAO.getFailureCode(query);
    if (failure.isEmpty()){
      return ErrObj.error(EtcError.NONE_SELECT_DATA);
    }

    /* 2. 차량구분코드 두자리로 수정 */
    HashMap failureCode = failure.get();
    String carSeCode = failureCode.get("carSeCode").toString();
    if (carSeCode.length() < 2){
      String renameCarSeCode = "0" + carSeCode;
      failureCode.replace("carSeCode", renameCarSeCode);
    }

    return new ResObj(failure);
  }

  /* 고장코드 카테고리 조회 */
  public ResObj getFailureCategory() throws Exception {

    List<String> pvUnqcodeList = selectFailureDAO.getPvUnqcodeCategory();
    List<String> deviceCodeList = selectFailureDAO.getDeviceCodeCategory();
    List<String> failureCodeList = selectFailureDAO.getFailureCodeCategory();

    HashMap categoryList = new HashMap();
    categoryList.put("pvUnqcodeList", pvUnqcodeList);
    categoryList.put("deviceCodeList", deviceCodeList);
    categoryList.put("failureCodeList", failureCodeList);

    return new ResObj(categoryList);
  }

  /* 날짜 검색조건 데이터 포맷 변경 */
  private void setDateDataFormat(HashMap query) throws Exception {

    boolean isStartDe = query.containsKey("startDe");
    boolean isEndDe = query.containsKey("endDe");
    if (isStartDe
        && isEndDe){

      String startDe = query.get("startDe").toString();
      String endDe = query.get("endDe").toString();

      /* 주어진 형식의 날짜 문자열을 Date 객체로 파싱 */
      SimpleDateFormat originalFormat = new SimpleDateFormat("yyyyMMdd");
      Date startDate = originalFormat.parse(startDe);
      Date endDate = originalFormat.parse(endDe);

      /* 원하는 날짜 형식으로 포맷 */
      SimpleDateFormat desiredFormat = new SimpleDateFormat("yyyy-MM-dd");
      String formatStartDe = desiredFormat.format(startDate);
      String formatEndDe = desiredFormat.format(endDate);

      query.replace("startDe", formatStartDe + " 00:00:00");
      query.replace("endDe", formatEndDe + " 23:59:59");

    }

  }
}
