package cbm.device.dao;

import cmmcloud.config.database.annotations.Master;

import java.util.HashMap;

@Master
public interface DeviceDAO {

  // 장치 코드 단일 추가
  int addDevice(HashMap obj) throws Exception;

  // 장치 코드 다중 추가
  int addDevices(HashMap obj) throws Exception;

  // 장치 코드 수정
  int updateDevice(HashMap obj) throws Exception;

  // 장치 코드 삭제
  int deleteDevice(HashMap obj) throws Exception;

  // 장치 코드 상세 정보 단일 추가
  int addDeviceDetail(HashMap obj) throws Exception;

  // 장치 코드 상세 정보 다중 추가
  int addDevicesDetail(HashMap obj) throws Exception;

  // 장치 코드 상세 정보 수정
  int updateDeviceDetail(HashMap obj) throws Exception;

  // 장치 코드 상세 정보 삭제
  int deleteDeviceDetail(HashMap obj) throws Exception;
}
