package cbm.failure;

import cbm.failure.service.FailureService;
import cmmcloud.enums.error.RequestError;
import cmmcloud.response.ErrObj;
import cmmcloud.response.ResObj;
import cmmcloud.utils.CommonUtil;
import java.util.HashMap;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/main/failure")
public class FailureController {

  @Autowired
  FailureService failureService;

  /* 고장 이력 목록 조회 */
  @GetMapping("/history")
  public JSONObject getFailureHistoryList(@RequestHeader HttpHeaders headers,
                                          @RequestParam HashMap query) throws Exception{

    /* 헤더 검증 */
    ResObj checkResult = CommonUtil.checkHeaderAndPutRequestData(headers, query);
    if (checkResult.hasError){
      return checkResult.getObject();
    }

    /* 페이징 검색 조건 검증 (recodeSize, startNo) */
    ResObj convertResult = CommonUtil.convertIntegerByPagingCondition(query);
    if (convertResult.hasError) {
      return convertResult.getObject();
    }

    return failureService.getFailureList(query).getObject();
  }

  /* 고장 코드 상세 조회 */
  @GetMapping("/detail")
  public JSONObject getFailureCode(@RequestHeader HttpHeaders headers,
                                   @RequestParam HashMap query) throws Exception{

    /* 헤더 검증 */
    ResObj checkResult = CommonUtil.checkHeaderAndPutRequestData(headers, query);
    if (checkResult.hasError){
      return checkResult.getObject();
    }

    /* 필수값 검증 (failureUnqcode) */
    if (CommonUtil.isNullOrEmpty(query.get("failureUnqcode"))){
      return ErrObj.error(RequestError.NOT_ENOUGH_QUERY).getObject();
    }


    return failureService.getFailureCode(query).getObject();
  }

  @GetMapping("/category")
  public JSONObject getFailureCategory() throws Exception {
    return failureService.getFailureCategory().getObject();
  }


}
