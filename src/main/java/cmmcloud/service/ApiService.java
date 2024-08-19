package cmmcloud.service;

import cmmcloud.utils.CommonUtil;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.apache.bcel.classfile.annotation.NameValuePair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Slf4j
@Service
public class ApiService<T> {

  @Autowired
  private RestTemplate restTemplate;

  public ResponseEntity<T> callApiEndPoint(String domain, String endPoint, HttpMethod httpMethod,
      HttpHeaders httpHeaders, Object body, Class<T> clazz) {

    if (httpHeaders == null) {
      HttpHeaders headers = new HttpHeaders();
      headers.set("Content-Type", "application/json");
      headers.set("Accept", "application/json");

      // TODO : 로컬 전용
      // local to server의 형태로 api call을 날릴 경우
      // GateWay에서 토큰이 없으면 401 접근 에러를 응답하므로
      // 토큰을 임의로 할당
      headers.set("CBM-AUTH-TOKEN", "");

      httpHeaders = headers;
    }
    else {
      // POSTMAN 기본 헤더로 인한 에러 방지
      HttpHeaders webClientHeader = new HttpHeaders();
      if (httpHeaders != null) {
        webClientHeader.add("X-Forwarded-For", httpHeaders.getFirst("X-Forwarded-For"));

        webClientHeader.add("CBM-AUTH-RULE", httpHeaders.getFirst("CBM-AUTH-RULE"));
        webClientHeader.add("CBM-AUTH-ID", httpHeaders.getFirst("CBM-AUTH-ID"));
        webClientHeader.add("CBM-AUTH-TOKEN", httpHeaders.getFirst("CBM-AUTH-TOKEN"));

        if (httpHeaders.get("x-real-ip") != null) {
          webClientHeader.add("x-real-ip", httpHeaders.getFirst("x-real-ip"));
        }

        httpHeaders = webClientHeader;
      }
    }

    log.info("Call Url => " + (domain + endPoint));

    ResponseEntity<T> result = restTemplate.exchange(
        domain + endPoint, httpMethod, new HttpEntity<>(body, httpHeaders), clazz);
    log.info("StatusCode => " + result.getStatusCode());
    log.info("StatusCodeValue => " + result.getStatusCodeValue());
    log.info("ResultBody => " + result.getBody().toString());

    return result;
  }

  private String mapToQueryString(HashMap<String, Object> map) {

    if (map == null || map.isEmpty()) {
      return "";
    }

    StringBuilder queryString = new StringBuilder();
    for (Map.Entry<String, Object> entry : map.entrySet()) {
      String key = entry.getKey();
      Object value = entry.getValue();
      if (value != null) {
        if (queryString.length() > 0) {
          queryString.append("&");
        }
        queryString.append(key).append("=").append(value);
      }
    }
    return "?" + queryString;
  }

  /**
   * ================ GET Api call ================
   */

  public ResponseEntity<T> get(String domain, String endPoint) {
    return callApiEndPoint(domain, endPoint, HttpMethod.GET, null, null, (Class<T>) Object.class);
  }

  public ResponseEntity<T> get(String domain, String endPoint, HashMap query) {
    return callApiEndPoint(domain, endPoint + mapToQueryString(query), HttpMethod.GET, null, null, (Class<T>) Object.class);
  }

  public ResponseEntity<T> get(String domain, String endPoint, HttpHeaders httpHeaders) {
    return callApiEndPoint(domain, endPoint, HttpMethod.GET, httpHeaders, null, (Class<T>) Object.class);
  }

  public ResponseEntity<T> get(String domain, String endPoint, HashMap query, HttpHeaders httpHeaders) {
    return callApiEndPoint(domain, endPoint + mapToQueryString(query), HttpMethod.GET, httpHeaders, null, (Class<T>) Object.class);
  }

  public ResponseEntity<T> get(String domain, String endPoint, HttpHeaders httpHeaders, Class<T> clazz) {
    return callApiEndPoint(domain, endPoint, HttpMethod.GET, httpHeaders, null, clazz);
  }

  public ResponseEntity<T> get(String domain, String endPoint, HashMap query, HttpHeaders httpHeaders, Class<T> clazz) {
    return callApiEndPoint(domain, endPoint + mapToQueryString(query), HttpMethod.GET, httpHeaders, null, clazz);
  }

  /**
   * ================ POST Api call ================
   */

  public ResponseEntity<T> post(String domain, String endPoint, Object body) {
    return callApiEndPoint(domain, endPoint, HttpMethod.POST, null, body, (Class<T>) Object.class);
  }

  public ResponseEntity<T> post(String domain, String endPoint, HttpHeaders headers, Object body) {
    return callApiEndPoint(domain, endPoint, HttpMethod.POST, headers, body, (Class<T>) Object.class);
  }

  public ResponseEntity<T> post(String domain, String endPoint, HttpHeaders headers, Object body, Class<T> clazz) {
    return callApiEndPoint(domain, endPoint, HttpMethod.POST, headers, body, clazz);
  }

  /**
   * ================ PUT Api call ================
   */

  public ResponseEntity<T> put(String domain, String endPoint, Object body) {
    return callApiEndPoint(domain, endPoint, HttpMethod.PUT, null, body, (Class<T>) Object.class);
  }

  public ResponseEntity<T> put(String domain, String endPoint, HttpHeaders headers, Object body) {
    return callApiEndPoint(domain, endPoint, HttpMethod.PUT, headers, body, (Class<T>) Object.class);
  }

  public ResponseEntity<T> put(String domain, String endPoint, HttpHeaders headers, Object body, Class<T> clazz) {
    return callApiEndPoint(domain, endPoint, HttpMethod.PUT, headers, body, clazz);
  }

  /**
   * ================ PATCH Api call ================
   */

  public ResponseEntity<T> patch(String domain, String endPoint, Object body) {
    return callApiEndPoint(domain, endPoint, HttpMethod.PATCH, null, body, (Class<T>) Object.class);
  }

  public ResponseEntity<T> patch(String domain, String endPoint, HttpHeaders headers, Object body) {
    return callApiEndPoint(domain, endPoint, HttpMethod.PATCH, headers, body, (Class<T>) Object.class);
  }

  public ResponseEntity<T> patch(String domain, String endPoint, HttpHeaders headers, Object body, Class<T> clazz) {
    return callApiEndPoint(domain, endPoint, HttpMethod.PATCH, headers, body, clazz);
  }

  /**
   * ================ DELETE Api call ================
   */

  public ResponseEntity<T> delete(String domain, String endPoint, Object body) {
    return callApiEndPoint(domain, endPoint, HttpMethod.DELETE, null, body, (Class<T>) Object.class);
  }

  public ResponseEntity<T> delete(String domain, String endPoint, HttpHeaders headers, Object body) {
    return callApiEndPoint(domain, endPoint, HttpMethod.DELETE, headers, body, (Class<T>) Object.class);
  }

  public ResponseEntity<T> delete(String domain, String endPoint, HttpHeaders headers, Object body, Class<T> clazz) {
    return callApiEndPoint(domain, endPoint, HttpMethod.DELETE, headers, body, clazz);
  }
}
