package cbm.dummy;

import cbm.dummy.service.DummyService;
import cbm.dummy.service.LiveVehicleService;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController()
@RequestMapping("/main/dummy")
@RequiredArgsConstructor
public class DummyController {

  private final DummyService dummyService;
  private final LiveVehicleService liveVehicleService;

  // 임계치 진단 결과 더미데이터 생성 1회 호출 = 50개 insert
  @PostMapping("/threshold")
  public JSONObject addDummyThreshold() {
    return dummyService.addDummyThreshold().getObject();
  }

  // 고장이력 더미데이터 생성 1회 호출 = 50개 insert
  @PostMapping("/failure")
  public JSONObject addDummyFailure() {
    return dummyService.addDummyFailure().getObject();
  }

  // 실시간 열차 이동정보 조회
  @GetMapping("/live/vehicle")
  public JSONObject getLiveVehicle() {
    return liveVehicleService.getLiveVehicle().getObject();
  }

}
