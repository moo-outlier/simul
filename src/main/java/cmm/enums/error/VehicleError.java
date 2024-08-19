package cmm.enums.error;

import cmmcloud.enums.ErrorEnum;

public enum VehicleError implements ErrorEnum {

  DUPLICATE_PV_UNQCODE("0101", "이미 사용 중인 편성 고유코드 입니다."),
  NONE_SELECT_VEHICLE_SCHEDULE("0102", "해당 편성이 존재하지 않습니다."),
  NONE_SELECT_PV_UNQCODE("0103", "확인 되지 않은 편성 고유코드 입니다."),
  DUPLICATE_PV_UNQNO("0104", "이미 사용 중인 편성 고유번호 입니다."),
  DUPLICATE_TEXT_PV_UNQNO("0105", "동일한 편성 고유번호는 중복 입력할 수 없습니다."),
  DUPLICATE_TEXT_PV_UNQCODE("0106", "동일한 편성 고유코드는 중복 입력할 수 없습니다."),
  ;

  private final String VEHICLE_STATUS = "822";
  private final String VEHICLE_MESSAGE = "편성 코드 관리 에러: ";
  private final String STATUS;
  private final String MESSAGE;

  VehicleError(String status, String message) {
    this.STATUS = VEHICLE_STATUS + status;
    this.MESSAGE = VEHICLE_MESSAGE + message;
  }

  @Override
  public String getStatus() {
    return STATUS;
  }

  @Override
  public String getMessage() {
    return MESSAGE;
  }

  @Override
  public String getError() {
    return this.toString();
  }
}
