package cmm.enums.error;

import cmmcloud.enums.ErrorEnum;

public enum DeviceError implements ErrorEnum {

  NOT_FOUND_DEVICE_CODE("0101", "요청하신 장비 코드를 찾을 수 없습니다."),
  IS_ALREADY_DEVICE_CODE("0102", "이미 존재하는 장치 코드가 있습니다."),
  DUPLICATE_DEVICE_CODES_REQUESTED("0103", "요청하신 장치 코드들 중 중복되는 값들이 존재합니다."),
  ;

  // TODO:
  private final String devicePreferStatus = "822";
  private final String devicePreferMessage = "열차 코드 관리 에러: ";
  private final String status;
  private final String message;

  DeviceError(String status, String message) {
    this.status = devicePreferStatus + status;
    this.message = devicePreferMessage + message;
  }

  @Override
  public String getStatus() {
    return status;
  }

  @Override
  public String getMessage() {
    return message;
  }

  @Override
  public String getError() {
    return this.toString();
  }
}
