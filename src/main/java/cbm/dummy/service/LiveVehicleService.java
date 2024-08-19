package cbm.dummy.service;

import cbm.dummy.dao.DummyDAO;
import cbm.dummy.dao.SelectDummyDAO;
import cbm.dummy.vo.VehicleDummyVO;
import cmmcloud.response.ResObj;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.junit.Ignore;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class LiveVehicleService {

  private final DummyDAO dummyDAO;
  private final SelectDummyDAO selectDummyDAO;

  // 실시간 열차 위치 정보 조회
  public ResObj getLiveVehicle() {

    List<VehicleDummyVO> liveVehicles = selectDummyDAO.getLiveVehicles();

    return new ResObj(liveVehicles);
  }

//  @Scheduled(cron = "*/2 * * * * *")
  public void addLiveVehicle() {

    Random random = ThreadLocalRandom.current();
    DecimalFormat decimalFormat = new DecimalFormat("#.0");

    // 열차 데이터 조회
    List<VehicleDummyVO> liveVehicles = selectDummyDAO.getLiveVehicles();

    for (VehicleDummyVO vehicle : liveVehicles) {
      // 위치값 변경
      changeLocation(vehicle, decimalFormat);
      // 상태값 변경
      changeStatus(vehicle, random);
    }

    // 열차 상태 업데이트
    dummyDAO.updateLiveVehicles(liveVehicles);

  }


  /**
   * ==================== private method ====================
   * */

  // 열차 위치값 변경
  private void changeLocation(VehicleDummyVO vehicle, DecimalFormat decimalFormat) {

    double changeDoubleValue = 0.1;
    int stopCnt = vehicle.getStopCnt();
    double location = vehicle.getLocation();
    String locationSeCode = vehicle.getLocationSeCode();

    // 상행선 끝 위치인지 확인
    boolean isTopLocation = locationSeCode.equals("0") && location == 1;
    // 하행선 끝 위치인지 확인
    boolean isBottomLocation = locationSeCode.equals("1") && location == 51;
    // 정수인지 구분 (역 정차 시)
    boolean isStopLocation = (location - Double.valueOf(location).intValue()) == 0;

    // 상행선 끝이면 하행선으로 변경
    if (isTopLocation) {
      vehicle.setLocationSeCode("1");
    }

    // 하행선 끝이면 상행선으로 변경
    if (isBottomLocation) {
      vehicle.setLocationSeCode("0");
    }

    locationSeCode = vehicle.getLocationSeCode();

    // stopCnt가 9 초과 시
    if (stopCnt > 9) {
      vehicle.setStopCnt(0);
    }

    // stopCnt가 1 ~ 9 사이면
    if (stopCnt > 0 && stopCnt < 10) {
      vehicle.setStopCnt(stopCnt + 1);
      return;
    }

    if (isStopLocation && stopCnt == 0) {
      vehicle.setStopCnt(1);
      return;
    }

    // 상행선의 경우 doubleValue 음수로 변경
    if (locationSeCode.equals("0")) {
      changeDoubleValue = -changeDoubleValue;
    }

    double calcLocation = location + changeDoubleValue;

    String formattedValue = decimalFormat.format(calcLocation);
    double resultLocation = Double.parseDouble(formattedValue);

    vehicle.setLocation(resultLocation);
  }

  // 열차 상태 변경
  private void changeStatus(VehicleDummyVO vehicle, Random random) {

    String statusSeCode = vehicle.getStatusSeCode();
    int failureStatusCnt = vehicle.getFailureStatusCnt();

    boolean isFailure = statusSeCode.equals("1") && failureStatusCnt > 0;

    // 고장 카운트가 10 이상일 경우 정상으로 변환 후 Return
    if (failureStatusCnt > 9) {
      vehicle.setStatusSeCode("0");
      vehicle.setFailureStatusCnt(0);
      return;
    }

    // 고장 상태인 경우 count +1 후 return
    if (isFailure) {
      vehicle.setFailureStatusCnt(failureStatusCnt + 1);
      return;
    }

    boolean isFailureStatus = random.nextInt(150) == 0 && statusSeCode.equals("0");

    if (isFailureStatus) {
      vehicle.setStatusSeCode("1");
      vehicle.setFailureStatusCnt(1);
    }

  }

}
