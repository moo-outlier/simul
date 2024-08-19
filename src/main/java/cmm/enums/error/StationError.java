package cmm.enums.error;

import cmmcloud.enums.ErrorEnum;

public enum StationError implements ErrorEnum {
  ;

  private final String STATION_STATUS = "822";
  private final String STATION_MESSAGE = "역 정보 관리 에러: ";
  private final String STATUS;
  private final String MESSAGE;

  StationError(String status, String message) {
    this.STATUS = STATION_STATUS + status;
    this.MESSAGE = STATION_MESSAGE + message;
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
