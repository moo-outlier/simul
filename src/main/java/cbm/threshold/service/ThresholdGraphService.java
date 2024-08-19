package cbm.threshold.service;

import cbm.threshold.dao.SelectThresholdGraphDAO;
import cbm.threshold.dao.ThresholdGraphDAO;
import cmmcloud.enums.error.DaoError;
import cmmcloud.enums.error.EtcError;
import cmmcloud.response.ErrObj;
import cmmcloud.response.ResObj;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class ThresholdGraphService {

  @Autowired
  SelectThresholdGraphDAO selectThresholdGraphDAO;
  @Autowired
  ThresholdGraphDAO thresholdGraphDAO;

  /* 임계치 진단 결과 그래프 목록 조회 */
  public ResObj getThresholdGraphList(HashMap query) throws Exception {

    /* 1. 날짜 검색조건 데이터 포맷 변경 */
    this.setDateDataFormat(query);

    /* 2. 그래프 목록 조회 */
    List<HashMap> thresholdGraph = selectThresholdGraphDAO.getThresholdGraphList(query);
    if (thresholdGraph.isEmpty()){
      return ErrObj.error(EtcError.NONE_SELECT_DATA);
    }

    /* 3. 경고,이상 비율 String으로 타입 변환 */
    for (HashMap map : thresholdGraph){

      map.replace("warnRt", map.get("warnRt").toString());
      map.replace("strangeRt", map.get("strangeRt").toString());

    }

    return new ResObj(thresholdGraph);
  }

  /* 임계치 진단 결과 그래프 더미 데이터 생성 */
  public ResObj createThresholdGraph() throws Exception {

    /* 1. 임계치 진단 결과 테이블 조회 */
    List<HashMap> thresholdList = selectThresholdGraphDAO.getThresholdResultList();
    if (thresholdList.isEmpty()){
      return ErrObj.error(EtcError.NONE_SELECT_DATA);
    }

    /* 2. 경고,이상 비율 난수 생성 - 두개의 합이 100이 넘지 않도록 하며, 정상 비율은 표시하지 않음 */
    for (HashMap threshold : thresholdList){

      // 랜덤한 정수값을 생성할 Random 객체 생성
      Random random = new Random();

      // 첫 번째 정수값 생성 (0부터 100 사이의 임의의 값)
      int firstNumber = random.nextInt(101);

      // 두 번째 정수값 생성 (0부터 (100 - firstNumber) 사이의 임의의 값)
      int secondNumber = random.nextInt(101 - firstNumber);

      // 두 정수값의 합이 100을 넘지 않도록 보정
      if (firstNumber + secondNumber > 100) {
        secondNumber = 100 - firstNumber;
      }

      threshold.put("warnRt", firstNumber);
      threshold.put("strangeRt", secondNumber);
    }

    /* 3. 더미 데이터 생성 */
    boolean isCreate = thresholdGraphDAO.createThresholdGraphDummy(thresholdList) > 0;
    if (!isCreate){
      return ErrObj.error(DaoError.DATA_NOT_CREATED);
    }

    return new ResObj();
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
