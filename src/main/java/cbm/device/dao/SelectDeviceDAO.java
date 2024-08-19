package cbm.device.dao;

import cmmcloud.config.database.annotations.Slave;

import java.util.HashMap;
import java.util.List;

@Slave
public interface SelectDeviceDAO {

  // 장치 총 갯수
  int getCountDevices(HashMap obj) throws Exception;

  // 장치 코드 중복 확인
  boolean isDeviceCodeDuplicated(HashMap obj) throws Exception;

  // 장치 코드 전체 조회(코드만)
  List<String> getAllDeviceCodes();

  // 장치 코드 전체 조회(테이블)
  List<HashMap> getAllDevices(HashMap obj) throws Exception;

  // 장치 코드로 장치 단일 조회
  HashMap getDeviceByCode(HashMap obj) throws Exception;

  // 장치 코드 상세 정보 전체 조회
  List<HashMap> getAllDeviceDetail(HashMap obj) throws Exception;

  // 장치 코드로 장치 코드 상세 정보 단일 조회
  HashMap getDeviceDetailByCode(HashMap obj) throws Exception;

}
