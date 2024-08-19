package cbm.dummy.vo;

import java.util.Random;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class VehicleDummyVO {

  String pvUnqcode; // 열차번호
  Double location; // 위치값 범위: 2.0~52.0
  String locationSeCode; // 상하행선 구분 코드 0=상행, 1=하행
  String statusSeCode; // 상태값 일반=0, 고장=1
  int failureStatusCnt; // 고장시 API 호출 횟수
  int stopCnt; // 정차시 API 호출 횟수

  // VO 데이터 초기화
  public void resetData() {
    this.location = 0.0;
    this.locationSeCode = "0";
    this.statusSeCode = "0";
  }
}
