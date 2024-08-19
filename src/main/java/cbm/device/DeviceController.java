package cbm.device;

import cbm.device.service.DeviceService;
import cmmcloud.enums.error.RequestError;
import cmmcloud.response.ErrObj;
import cmmcloud.response.ResObj;
import cmmcloud.utils.CommonUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/main/device")
public class DeviceController {

  private final DeviceService deviceService;

  // 장치 코드 전체 조회
  @GetMapping("")
  public JSONObject getAllDevices(@RequestParam HashMap query)
    throws Exception {

    if (query.containsKey("recordSize") || query.containsKey("startNo")) {
      ResObj convertResult = CommonUtil.convertIntegerByPagingCondition(query);
      if (convertResult.hasError) {
        return convertResult.getObject();
      }
    }

    return deviceService.getAllDevices(query).getObject();
  }

  // 장치 코드 전체 조회(코드)
  @GetMapping("/codes")
  public JSONObject getDeviceCodes(@RequestParam HashMap query)
    throws Exception {

    return deviceService.getDeviceCodes(query).getObject();
  }

  // 장치 코드 단일 조회
  @GetMapping("/detail")
  public JSONObject getDevice(@RequestParam HashMap query)
    throws Exception {

    if (CommonUtil.isNullOrEmpty(query.get("deviceCode"))) {
      return ErrObj.error(RequestError.NOT_ENOUGH_QUERY).getObject();
    }

    return deviceService.getDevice(query).getObject();
  }

  // 장치 코드 단일 추가
  @PostMapping("/singleness")
  public JSONObject addDevice(@RequestHeader HttpHeaders header,
      @RequestBody HashMap<String, Object> body) throws Exception {

    ResObj checkResult = CommonUtil.checkHeaderAndPutRequestData(header, body);
    if (checkResult.hasError){
      return checkResult.getObject();
    }

    if (CommonUtil.isNullOrEmpty(body.get("deviceCode"))
      || (CommonUtil.isNullOrEmpty(body.get("deviceNm")))
      || (CommonUtil.isNullOrEmpty(body.get("deviceNote")))) {
      return ErrObj.error(RequestError.NOT_ENOUGH_BODY).getObject();
    }

    return deviceService.addDevice(body).getObject();
  }

  // 장치 코드 다중 추가
  @PostMapping("")
  public JSONObject addDevices(@RequestHeader HttpHeaders header,
      @RequestBody HashMap<String, Object> body) throws Exception {

    ResObj checkResult = CommonUtil.checkHeaderAndPutRequestData(header, body);
    if (checkResult.hasError){
      return checkResult.getObject();
    }

    if (CommonUtil.isNullOrEmpty(body.get("devices"))) {
      return ErrObj.error(RequestError.NOT_ENOUGH_BODY).getObject();
    }

    List<HashMap<String, Object>> devices = (List<HashMap<String, Object>>) body.get("devices");
    for (HashMap<String, Object> device: devices) {
      if (CommonUtil.isNullOrEmpty(device.get("deviceCode"))
        || CommonUtil.isNullOrEmpty(device.get("deviceNm"))
        || CommonUtil.isNullOrEmpty(device.get("deviceNote"))) {
        return ErrObj.error(RequestError.NOT_ENOUGH_BODY).getObject();
      }
    }

    return deviceService.addDevices(body).getObject();
  }

  // 장치 코드 수정
  @PatchMapping("")
  public JSONObject updateDevice(@RequestHeader HttpHeaders header,
      @RequestBody HashMap<String, Object> body) throws Exception {

    ResObj checkResult = CommonUtil.checkHeaderAndPutRequestData(header, body);
    if (checkResult.hasError){
      return checkResult.getObject();
    }

    if (CommonUtil.isNullOrEmpty(body.get("deviceCode"))) {
      return ErrObj.error(RequestError.NOT_ENOUGH_QUERY).getObject();
    }

    return deviceService.updateDevice(body).getObject();
  }

  // 장치 코드 삭제
  @DeleteMapping("")
  public JSONObject deleteDevice(@RequestHeader HttpHeaders header,
      @RequestBody HashMap<String, Object> body) throws Exception {

    ResObj checkResult = CommonUtil.checkHeaderAndPutRequestData(header, body);
    if (checkResult.hasError){
      return checkResult.getObject();
    }

    if (CommonUtil.isNullOrEmpty(body.get("deviceCode"))) {
      return ErrObj.error(RequestError.NOT_ENOUGH_QUERY).getObject();
    }

    return deviceService.deleteDevice(body).getObject();
  }
}
