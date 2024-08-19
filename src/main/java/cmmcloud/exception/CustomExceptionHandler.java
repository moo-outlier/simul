package cmmcloud.exception;

import cmmcloud.enums.error.ExceptionError;
import cmmcloud.response.ResObj;
import cmmcloud.service.ApiService;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Enumeration;
import java.util.LinkedHashMap;
import javax.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.NestedRuntimeException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Slf4j
@RestControllerAdvice
public class CustomExceptionHandler {

//  @Value("${monitoring.isLocal}")
//  private boolean isLocal;

  @Autowired
  private ApiService apiService;

//  @Value("${service.domain.monitoring.url}")
//  private String monitoringServerUrl;
//
//  @Value("${monitoring.domainCode}")
//  private String domainCode;
//
//  @Value("${monitoring.errDomainNm}")
//  private String errDomainNm;

  private enum ExceptionType {
    SERVER,
    DATABASE
  }

  @ExceptionHandler()
  public JSONObject handleException(Exception ex, HttpServletRequest request) throws Exception {

    // Transaction을 위한 Custom Runtime Exception
    if (ex instanceof CustomException) {
      return ((CustomException) ex).getObject();
    }

    ex.printStackTrace();

    String errClass = ex.getClass().getSimpleName();

    ExceptionError exceptionError = ExceptionError.valueOfName(errClass);

    String status = exceptionError.getStatus();
    String errMsg = exceptionError.getMessage();

//    // 모니터링 메시지 전송
//    if (!isLocal) {
//      monitoringMessage(ex, request, status, errMsg);
//    }

    ResObj resObj = new ResObj();
    resObj.setError(status, errMsg);
    resObj.setErrorCode(errClass);

    return resObj.getObject();
  }

//  // 모니터링 메시지 전송
//  private void monitoringMessage(Exception ex, HttpServletRequest request, String status, String errMsg) throws Exception {
//
//    // IP 조회
//    String errIp = request.getHeader("X-REAL-IP");
//    if (errIp == null) {
//      errIp = request.getHeader("X-Forwarded-For");
//    }
//    if (errIp == null) {
//      errIp = request.getHeader("X-Forwarded-host");
//    }
//    if (errIp == null) {
//      errIp = request.getRemoteAddr();
//    }
//
//    // DB 예외 분류
//    ExceptionType exceptionType;
//
//    if (ex instanceof NestedRuntimeException) {
//      exceptionType = ExceptionType.DATABASE;
//    } else {
//      exceptionType = ExceptionType.SERVER;
//    }
//
//    // ex.printStackTrace() 정보
//    StringWriter sw = new StringWriter();
//    PrintWriter pw = new PrintWriter(sw);
//
//    ex.printStackTrace(pw);
//    String stackTrace = sw.toString();
//
//    String[] lines = stackTrace.split("\n");
//
//    // 예외 발생 위치 찾기
//    int line = -1;
//
//    for (int i = 0; i < lines.length; i++) {
//      if (lines[i].contains("cbm.")) {
//        line = i;
//        break;
//      }
//    }
//
//    String stackTraceLine = lines[line];
//    int startIdx = stackTraceLine.indexOf("(") + 1;
//    int endIdx = stackTraceLine.indexOf(")");
//
//    String errClassNm = stackTraceLine.substring(startIdx, endIdx);
//
//    // Request Header 생성
//    Enumeration<String> headerNames = request.getHeaderNames();
//    HttpHeaders headers = new HttpHeaders();
//
//    while (headerNames.hasMoreElements()) {
//
//      String headerName = headerNames.nextElement();
//      Enumeration<String> headerValues = request.getHeaders(headerName);
//
//      while (headerValues.hasMoreElements()) {
//        String headerValue = headerValues.nextElement();
//        headers.add(headerName, headerValue);
//      }
//    }
//
//    // Request Body 생성
//    LinkedHashMap requestBody = new LinkedHashMap();
//    requestBody.put("domainCode", domainCode);
//    requestBody.put("errDomainNm", errDomainNm);
//    requestBody.put("errTypeCode", exceptionType);
//    requestBody.put("errCode", status);
//    requestBody.put("errMsg", errMsg);
//    requestBody.put("errOccurSrc", errClassNm);
//    requestBody.put("errIp", errIp);
//    requestBody.put("errRequestMethod", request.getMethod());
//    requestBody.put("errUri", request.getRequestURI());
//
//    // 모니터링 서버 예외 전송
//    try {
//      log.info("예외 발생: {}, 발생 위치: {}, 예외 명: {}", errDomainNm, errClassNm, ex.getClass().getSimpleName());
//      ResponseEntity responseEntity = apiService.post(monitoringServerUrl, "/monitoring/error", headers, requestBody);
//    } catch (Exception e) {
////      e.printStackTrace();
//    }
//
//  }
}
