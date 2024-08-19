package cmm.enums.error;

import cmmcloud.enums.ErrorEnum;

public enum ImprmnError implements ErrorEnum {

  NOT_FOUND_MANUAL("0301", "해당 정비 매뉴얼을 찾을 수 없습니다."),
  ;

  private final String ImprmnStatus = "822";
  private final String ImprmnMessage = "정비 이력 및 매뉴얼 에러: ";
  private final String status;
  private final String message;

  ImprmnError(String status, String message) {
    this.status = ImprmnStatus + status;
    this.message = ImprmnMessage + message;
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
