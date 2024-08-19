package cbm.device.service;

import cbm.device.dao.DeviceDAO;
import cbm.device.dao.SelectDeviceDAO;
import cmm.enums.error.DeviceError;
import cmmcloud.enums.error.DaoError;
import cmmcloud.enums.error.EtcError;
import cmmcloud.response.ErrObj;
import cmmcloud.response.ResObj;
import cmmcloud.utils.CommonUtil;
import cmmcloud.vo.PagingVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
@Service
public class DeviceService {

  private final DeviceDAO deviceDAO;
  private final SelectDeviceDAO selectDeviceDAO;

  // 장치 코드 전체 조회(테이블)
  public ResObj getAllDevices(HashMap<String, Object> obj) throws Exception {

    List<HashMap> getAllDevices = selectDeviceDAO.getAllDevices(obj);
    if (getAllDevices.size() < 1) {
      return ErrObj.error(EtcError.NONE_SELECT_DATA);
    }

    int countAllDevices = selectDeviceDAO.getCountDevices(obj);

    return obj.containsKey("recordSize") || obj.containsKey("startNo")
      ? new ResObj(new PagingVO(countAllDevices, obj), getAllDevices)
      : new ResObj(getAllDevices);
  }

  // 장치 코드 전체 조회(코드)
  public ResObj getDeviceCodes(HashMap<String, Object> obj) throws Exception {

    List<String> getAllDeviceCodes = selectDeviceDAO.getAllDeviceCodes();
    if (getAllDeviceCodes.size() < 1) {
      return ErrObj.error(EtcError.NONE_SELECT_DATA);
    }

    return new ResObj(getAllDeviceCodes);
  }

  // 장치 코드 단일 조회
  public ResObj getDevice(HashMap<String, Object> obj) throws Exception {

    HashMap getDevice = selectDeviceDAO.getDeviceByCode(obj);
    if (getDevice == null) {
      return ErrObj.error(DeviceError.NOT_FOUND_DEVICE_CODE);
    }
  
    return new ResObj(getDevice);
  }

  // 장치 코드 단일 추가
  public ResObj addDevice(HashMap<String, Object> obj) throws Exception {

    boolean isDeviceAdded = deviceDAO.addDevice(obj) > 0;
    if (!isDeviceAdded) {
      return ErrObj.error(DaoError.DATA_NOT_CREATED);
    }

//    boolean isDeviceDetailAdded = deviceDAO.addDeviceDetail(obj) > 0;
//    if (!isDeviceDetailAdded) {
//      return ErrObj.error(DaoError.DATA_NOT_CREATED);
//    }

    return new ResObj();
  }

  // 장치 코드 다중 추가
  public ResObj addDevices(HashMap<String, Object> obj) throws Exception {

    // 장치 코드들 간 중복 체크
    boolean checkReqDeviceCodesDuplicated =
      checkDuplicateDeviceCodeInList((List<HashMap<String, Object>>) obj.get("devices"));
    if (checkReqDeviceCodesDuplicated) {
      return ErrObj.error(DeviceError.DUPLICATE_DEVICE_CODES_REQUESTED);
    }

    boolean isDeviceCodeDuplicated = selectDeviceDAO.isDeviceCodeDuplicated(obj);
    if (isDeviceCodeDuplicated) {
      return ErrObj.error(DeviceError.IS_ALREADY_DEVICE_CODE);
    }

    boolean isDevicesAdded = deviceDAO.addDevices(obj) > 0;
    if (!isDevicesAdded) {
      return ErrObj.error(DaoError.DATA_NOT_CREATED);
    }

    return new ResObj();
  }

  // 장치 코드 수정
  public ResObj updateDevice(HashMap<String, Object> obj) throws Exception {

    HashMap getDevice = selectDeviceDAO.getDeviceByCode(obj);
    if (CommonUtil.isNullOrEmpty(getDevice)) {
      return ErrObj.error(DeviceError.NOT_FOUND_DEVICE_CODE);
    }

    boolean isDeviceAdded = deviceDAO.updateDevice(obj) > 0;
    if (!isDeviceAdded) {
      return ErrObj.error(DaoError.DATA_NOT_UPDATED);
    }
  
    return new ResObj();
  }

  // 장치 코드 삭제
  public ResObj deleteDevice(HashMap<String, Object> obj) throws Exception {

    HashMap getDevice = selectDeviceDAO.getDeviceByCode(obj);
    if (getDevice == null) {
      return ErrObj.error(DeviceError.NOT_FOUND_DEVICE_CODE);
    }

    boolean isDeviceAdded = deviceDAO.deleteDevice(obj) > 0;
    if (!isDeviceAdded) {
      return ErrObj.error(DaoError.DATA_NOT_DELETED);
    }
  
    return new ResObj();
  }

  // 장치 코드 다중 추가 시 각 map 마다 중복되는 장치 코드가 있는지 검증
  private boolean checkDuplicateDeviceCodeInList(List<HashMap<String, Object>> mapList) {

    HashMap<String, Object> keyCheckMap = new HashMap<>();

    for (HashMap<String, Object> map : mapList) {
      if (!keyCheckMap.containsKey(map.get("deviceCode").toString())) {
        keyCheckMap.put(map.get("deviceCode").toString(), map.get("deviceCode"));
      }
      else {
        return true;
      }
    }

    return false;
  }
}
