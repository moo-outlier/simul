package cbm.dummy.service;

import cbm.dummy.dao.DummyDAO;
import cbm.dummy.dao.SelectDummyDAO;
import cmmcloud.response.ResObj;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class DummyService {

  private final DummyDAO dummyDAO;
  private final SelectDummyDAO selectDummyDAO;

  // 임계치 진단 결과 더미데이터 생성
  public ResObj addDummyThreshold() {

    List<HashMap> diviceInfos = selectDummyDAO.getDeviceInfos();
    List<HashMap> insertList = new ArrayList<>();

    Random random = new Random();

    for (int i = 0; i < 50; i++) {
      int randomIndex = random.nextInt(diviceInfos.size());
      HashMap device = diviceInfos.get(randomIndex);
      device.put("ocrncAt", getRandomTime());
      device.put("thrhldSeCode", getTestThresholdSeCode());
      insertList.add(device);
    }

    int addThresholdResultInt = dummyDAO.addThresholdDummy(insertList);
    log.info("addThresholdResultInt:{}", addThresholdResultInt);
    return new ResObj();
  }

  // 고장이력 더미데이터 생성
  public ResObj addDummyFailure() {

    List<HashMap> failureInfos = selectDummyDAO.getFailureInfos();
    List<HashMap> failureDeviceInfos = selectDummyDAO.getFailureDeviceInfos();
    List<HashMap> stationInfos = selectDummyDAO.getStationInfos();

    int createCnt = 50;
    List<HashMap> insertList = new ArrayList<>();

    for (int i = 0; i < createCnt; i++) {

      HashMap failureObj = new LinkedHashMap();

      failureObj.putAll(getRandomFailureObj(failureInfos));
      failureObj.putAll(getRandomFailureObj(failureDeviceInfos));
      failureObj.putAll(getRandomFailureObj(stationInfos));

      setFailureField(failureObj);

      insertList.add(failureObj);
    }

    int insertCnt = dummyDAO.addFailureHDummy(insertList);
    log.info("addFailureHDummy-insertCnt:{}", insertCnt);

    return new ResObj();
  }


  // =================== private Method ==================
  // 랜덤 시각
  private String getRandomTime() {
    LocalDate startDate = LocalDate.of(2024, 1, 1);
    LocalDate endDate = LocalDate.of(2024, 4, 17);

    long randomEpochDay = ThreadLocalRandom.current().nextLong(startDate.toEpochDay(), endDate.toEpochDay() + 1);
    LocalDate randomDate = LocalDate.ofEpochDay(randomEpochDay);

    LocalTime randomTime = createRandomTime();

    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    String result = randomDate.atTime(randomTime).format(formatter);

    return result;
  }

  /**
   * 검지시각 이후 소거시각 구하기 위한 메서드 오버로딩
   * */
  private String getRandomTime(String targetDate) {
    DateTimeFormatter targetDateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    LocalDateTime dateTime = LocalDateTime.parse(targetDate, targetDateFormatter).plusHours(12);

    LocalDate date = dateTime.toLocalDate();
    LocalTime time = dateTime.toLocalTime();

    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    String result = date.atTime(time).format(formatter);

    return result;
  }

  // 랜덤 시각 생성
  private LocalTime createRandomTime() {

    // 랜덤한 시간 생성
    int hour = ThreadLocalRandom.current().nextInt(0, 24); // 0부터 23 사이의 랜덤한 시간
    int minute = ThreadLocalRandom.current().nextInt(0, 60); // 0부터 59 사이의 랜덤한 분
    int second = ThreadLocalRandom.current().nextInt(0, 60); // 0부터 59 사이의 랜덤한 초
    LocalTime randomTime = LocalTime.of(hour, minute, second);

    return randomTime;
  }

  // 임계치 진단 구분코드 랜덤 값
  private int getTestThresholdSeCode() {
    int[] params = {0, 1, 2};
    int randomIndex = ThreadLocalRandom.current().nextInt(params.length);
    return params[randomIndex];
  }

  // 랜덤 시각 -> 일자로 변경
  private String getRandomDate(String randomTime) {
    String[] parts = randomTime.split(" ");
    String dateString = parts[0];

    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    LocalDate date = LocalDate.parse(dateString, formatter);

    String result = date.format(DateTimeFormatter.ofPattern("yyyyMMdd"));

    return result;
  }

  // 고장 이력 랜덤 객체 추출
  private HashMap getRandomFailureObj(List<HashMap> targetObjList) {

    int indexSize = targetObjList.size();
    int randomIndex = ThreadLocalRandom.current().nextInt(indexSize);

    HashMap randomTargetObj = targetObjList.get(randomIndex);

    return randomTargetObj;
  }

  // 고장 이력 랜덤 필드 정의
  private void setFailureField(HashMap failureObj) {

    String occurAt = getRandomTime();
    String occurDe = getRandomDate(occurAt);
    String eraseAt = getRandomTime(occurAt);
    double failureDstnc = ThreadLocalRandom.current().nextDouble(0, 1.5);
    double roundedFailureDstnc = Math.round(failureDstnc * 100.0) / 100.0;

    failureObj.put("occurAt", occurAt);
    failureObj.put("occurDe", occurDe);
    failureObj.put("eraseAt", eraseAt);
    failureObj.put("failureDstnc", roundedFailureDstnc);

  }
}
