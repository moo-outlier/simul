package cbm.threshold;

import cbm.threshold.service.ThresholdGraphService;
import cmmcloud.response.ResObj;
import cmmcloud.utils.CommonUtil;

import java.util.HashMap;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/main/threshold/graph")
public class ThresholdGraphController {

  @Autowired
  ThresholdGraphService graphService;

  /* 임계치 진단 결과 그래프 목록 */
  @GetMapping
  public JSONObject getThresholdGraphList(@RequestHeader HttpHeaders headers,
                                          @RequestParam HashMap query) throws Exception {

    /* 헤더 검증 */
    ResObj checkResult = CommonUtil.checkHeaderAndPutRequestData(headers, query);
    if (checkResult.hasError) {
      return checkResult.getObject();
    }

    return graphService.getThresholdGraphList(query).getObject();
  }

  /* 임계치 진단 결과 그래프 더미 데이터 생성 */
  @PostMapping("/dummy")
  public JSONObject createThresholdGraph() throws Exception {
    return graphService.createThresholdGraph().getObject();
  }

}
