package cmmcloud.utils;

import cmmcloud.enums.error.ExceptionError;
import cmmcloud.response.ResObj;

public class ExceptionUtil {

  /**
   * =================================================================
   *          Exception을 ResObj로 바꿔주는 단독 에러처리 메소드
   * =================================================================
   *
   * 설명 : 보통 Exception이 발생했을때 RestControllerAdvice가 잡아서 바로 ResObj가 리턴되지만,
   *       Exception이 발생했을때 추가 로직이 진행된 후 ResObj가 리턴되어야 할 경우를 위해
   *       단독으로 사용할 수 있는 메소드
   *
   * 예시 코드)
   *    try {
   *      ...
   *    }
   *    catch(Exception ex){
   *      // 추가 로직 작성
   *      return getResObjByException(ex);
   *    }
   */
  public static ResObj getResObjByException(Exception ex) {

    ex.printStackTrace();

    String errClass = ex.getClass().getSimpleName();

    ExceptionError exceptionError = ExceptionError.valueOfName(errClass);

    String status = exceptionError.getStatus();
    String errMsg = exceptionError.getMessage();

    ResObj resObj = new ResObj();
    resObj.setError(status, errMsg);
    resObj.setErrorCode(errClass);

    return resObj;
  }
}
