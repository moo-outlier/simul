package cbm.dummy.dao;

import cbm.dummy.vo.VehicleDummyVO;
import cmmcloud.config.database.annotations.Slave;
import java.util.HashMap;
import java.util.List;

@Slave
public interface SelectDummyDAO {

  // 장치 정보 조회
  List<HashMap> getDeviceInfos();

  // 고장이력 등록 고장정보 조회
  List<HashMap> getFailureInfos();

  // 고장이력 등록 장치 정보 조회
  List<HashMap> getFailureDeviceInfos();

  // 고장이력 등록 역정보 조회
  List<HashMap> getStationInfos();

  List<VehicleDummyVO> getLiveVehicles();

}
