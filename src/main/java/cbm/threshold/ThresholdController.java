package cbm.threshold;

import cbm.threshold.service.ThresholdService;
import cmmcloud.enums.error.RequestError;
import cmmcloud.response.ErrObj;
import cmmcloud.response.ResObj;
import cmmcloud.utils.CommonUtil;
import java.util.HashMap;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import org.json.simple.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/main/threshold")
public class ThresholdController {

  private final ThresholdService thresholdService;
  private final CommonUtil commonUtil;

  // 임계치 진단 결과 조회
  @GetMapping()
  public JSONObject getThreshold(@RequestParam HashMap map, @RequestHeader HttpHeaders headers)
      throws Exception {

    // 헤더값 검증
    ResObj checkResult = commonUtil.checkHeaderAndPutRequestData(headers, map);
    if (checkResult.hasError) {
      return checkResult.getObject();
    }

    ResObj convertResult = CommonUtil.convertIntegerByPagingCondition(map);
    if (convertResult.hasError) {
      return convertResult.getObject();
    }

    if (CommonUtil.isNullOrEmpty(map.get("startDe"))
        || CommonUtil.isNullOrEmpty(map.get("endDe"))
        || CommonUtil.isNullOrEmpty(map.get("deviceCode"))) {
      return ErrObj.error(RequestError.NOT_ENOUGH_QUERY).getObject();
    }

    return thresholdService.getThreshold(map).getObject();
  }

}
