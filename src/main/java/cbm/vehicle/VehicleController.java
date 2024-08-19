package cbm.vehicle;

import static cmmcloud.utils.CommonUtil.isNullOrEmpty;

import cbm.vehicle.service.VehicleService;
import cmmcloud.enums.error.RequestError;
import cmmcloud.response.ErrObj;
import cmmcloud.response.ResObj;
import cmmcloud.utils.CommonUtil;
import java.util.HashMap;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/main/vehicle")
public class VehicleController {

  @Autowired
  VehicleService vehicleService;

  /* 편성고유코드 목록 조회 */
  @GetMapping("/nos")
  public JSONObject getVehiclePvUnqnos() throws Exception{
    return vehicleService.getVehiclePvUnqcodes().getObject();
  }

  /* 편성 목록 */
  @GetMapping
  public JSONObject getVehicleScheduleList(@RequestHeader HttpHeaders headers,
                                           @RequestParam HashMap query) throws Exception{

    /* 헤더 검증 */
    ResObj checkResult = CommonUtil.checkHeaderAndPutRequestData(headers, query);
    if (checkResult.hasError){
      return checkResult.getObject();
    }

    // recordSize, startNo이 null인 경우 - 엑셀 업로드
    if (isNullOrEmpty(query.get("recordSize")) && isNullOrEmpty(query.get("startNo"))) {
      return vehicleService.getExcelVehicleScheduleList(query).getObject();
    }

    /* 페이징 검색 조건 검증 (recodeSize, startNo) */
    ResObj convertResult = CommonUtil.convertIntegerByPagingCondition(query);
    if (convertResult.hasError) {
      return convertResult.getObject();
    }

    return vehicleService.getVehicleScheduleList(query).getObject();
  }

  /* 편성 상세 조회 */
  @GetMapping("/detail")
  public JSONObject getVehicleSchedule(@RequestHeader HttpHeaders headers,
                                       @RequestParam HashMap query) throws Exception{

    /* 헤더 검증 */
    ResObj checkResult = CommonUtil.checkHeaderAndPutRequestData(headers, query);
    if (checkResult.hasError){
      return checkResult.getObject();
    }

    /* 필수값 검증 (편성 고유코드) */
    if (isNullOrEmpty(query.get("pvUnqcode"))){
      return ErrObj.error(RequestError.NOT_ENOUGH_QUERY).getObject();
    }

    return vehicleService.getVehicleSchedule(query).getObject();
  }

  /* 편성 생성 */
  @PostMapping
  public JSONObject createVehicleSchedule(@RequestHeader HttpHeaders headers,
                                          @RequestBody HashMap body) throws Exception{

    /* 헤더 검증 */
    ResObj checkResult = CommonUtil.checkHeaderAndPutRequestData(headers, body);
    if (checkResult.hasError){
      return checkResult.getObject();
    }

    /* 다중 생성의 경우 */
    boolean isContainsKey = body.containsKey("create");
    if (isContainsKey){

      /* 필수값 검증 (편성 고유번호, 편성 고유코드) */
      List<HashMap> createList = (List<HashMap>) body.get("create");
      for (HashMap create : createList){
        if (isNullOrEmpty(create.get("pvUnqno"))
            || isNullOrEmpty(create.get("pvUnqcode"))){
          return ErrObj.error(RequestError.NOT_ENOUGH_BODY).getObject();
        }
      }

      return vehicleService.createVehiclesSchedule(body).getObject();
    }

    /* 단일 생성의 경우, 필수값 검증 (편성 고유번호, 편성 고유코드) */
    if (isNullOrEmpty(body.get("pvUnqno"))
        || isNullOrEmpty(body.get("pvUnqcode"))) {
      return ErrObj.error(RequestError.NOT_ENOUGH_BODY).getObject();
    }

    return vehicleService.createVehicleSchedule(body).getObject();
  }

  /* 편성 수정 */
  @PatchMapping
  public JSONObject updateVehicleSchedule(@RequestHeader HttpHeaders headers,
                                          @RequestBody HashMap body) throws Exception{

    /* 헤더 검증 */
    ResObj checkResult = CommonUtil.checkHeaderAndPutRequestData(headers, body);
    if (checkResult.hasError){
      return checkResult.getObject();
    }

    /* 필수값 검증 (편성 고유코드) */
    if (isNullOrEmpty(body.get("pvUnqcode"))) {
      return ErrObj.error(RequestError.NOT_ENOUGH_BODY).getObject();
    }

    /* 선택값 검증 - (pvUnqno, lineNo, stationNo, carCnt, lastReceiveDt) 하나라도 없으면 에러 */
    if (isNullOrEmpty(body.get("pvUnqno"))
        && isNullOrEmpty(body.get("lineNo"))
        && isNullOrEmpty(body.get("stationNo"))
        && isNullOrEmpty(body.get("carCnt"))
        && isNullOrEmpty(body.get("lastReceiveDt"))){
      return ErrObj.error(RequestError.NOT_ENOUGH_REQUIRED_FIELD).getObject();
    }

    return vehicleService.updateVehicleSchedule(body).getObject();
  }

  /* 편성 삭제 */
  @DeleteMapping
  public JSONObject deleteVehicleSchedule(@RequestHeader HttpHeaders headers,
                                          @RequestBody HashMap body) throws Exception{

    /* 헤더 검증 */
    ResObj checkResult = CommonUtil.checkHeaderAndPutRequestData(headers, body);
    if (checkResult.hasError){
      return checkResult.getObject();
    }

    /* 필수값 검증 (편성 고유코드) */
    if (isNullOrEmpty(body.get("pvUnqcode"))) {
      return ErrObj.error(RequestError.NOT_ENOUGH_BODY).getObject();
    }

    return vehicleService.deleteVehicleSchedule(body).getObject();
  }

}
