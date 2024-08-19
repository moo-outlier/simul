package cbm.imprmn;

import cbm.imprmn.service.ImprmnService;
import cmmcloud.enums.error.RequestError;
import cmmcloud.response.ErrObj;
import cmmcloud.response.ResObj;
import cmmcloud.utils.CommonUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/main/imprmn")
public class ImprmnController {

  private final ImprmnService imprmnService;

  // 정비 이력 전체 조회
  @GetMapping("/history")
  public JSONObject getAllHistory(@RequestParam HashMap<String, Object> query)
    throws Exception {

    ResObj convertResult = CommonUtil.convertIntegerByPagingCondition(query);
    if (convertResult.hasError) {
      return convertResult.getObject();
    }

    return imprmnService.getAllHistory(query).getObject();
  }

  // 정비 이력 추가
  @PostMapping("/history")
  public JSONObject addHistory(@RequestHeader HttpHeaders headers,
    @RequestBody HashMap<String, Object> body) throws Exception {

    ResObj checkResult = CommonUtil.checkHeaderAndPutRequestData(headers, body);
    if (checkResult.hasError){
      return checkResult.getObject();
    }

    if (CommonUtil.isNullOrEmpty(body.get("history"))) {
      return ErrObj.error(RequestError.NOT_ENOUGH_BODY).getObject();
    }

    return imprmnService.addHistory(body).getObject();
  }

  // 정비 이력 편성 번호(편성고유코드) 전체 조회
  @GetMapping("/history/organization/code")
  public JSONObject getAllPvUnqcodes() throws Exception {

    return imprmnService.getAllPvUnqcodes().getObject();
  }

  // 정비 이력 장치 코드 전체 조회
  @GetMapping("/history/device/code")
  public JSONObject getAllHistoryDeviceCodes() throws Exception {

    return imprmnService.getAllHistoryDeviceCodes().getObject();
  }

  // 정비 매뉴얼 전체 조회
  @GetMapping("/manual")
  public JSONObject getAllManual(@RequestParam HashMap<String, Object> query)
    throws Exception {

    ResObj convertResult = CommonUtil.convertIntegerByPagingCondition(query);
    if (convertResult.hasError) {
      return convertResult.getObject();
    }
    
    return imprmnService.getAllManual(query).getObject();
  }

  // 정비 매뉴얼 추가
  @PostMapping("/manual")
  public JSONObject addManual(@RequestHeader HttpHeaders headers,
    @RequestBody HashMap<String, Object> body) throws Exception {

    ResObj checkResult = CommonUtil.checkHeaderAndPutRequestData(headers, body);
    if (checkResult.hasError){
      return checkResult.getObject();
    }

    if (CommonUtil.isNullOrEmpty(body.get("manuals"))) {
      return ErrObj.error(RequestError.NOT_ENOUGH_BODY).getObject();
    }

    return imprmnService.addManual(body).getObject();
  }

  // 정비 매뉴얼 장치 코드 전체 조회
  @GetMapping("/manual/device/code")
  public JSONObject getAllManualDeviceCodes() throws Exception {

    return imprmnService.getAllManualDeviceCodes().getObject();
  }

  // 정비 매뉴얼 첨부 파일(PDF) 다운로드
  @GetMapping("/manual/download")
  public ResponseEntity<?> downloadManualPdf(@RequestParam HashMap<String, Object> query)
    throws Exception {

    if (CommonUtil.isNullOrEmpty(query.get("deviceCode"))) {
      return ResponseEntity.badRequest().body(RequestError.NOT_ENOUGH_QUERY.getMessage());
    }

    return imprmnService.downloadManualPdf(query);
  }
}
