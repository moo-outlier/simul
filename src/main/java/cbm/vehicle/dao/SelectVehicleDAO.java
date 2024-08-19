package cbm.vehicle.dao;

import cmmcloud.config.database.annotations.Slave;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

@Slave
public interface SelectVehicleDAO {
  /* 편성 고유코드 목록 조회 */
  List<String> getVehiclePvUnqcodes() throws Exception;
  /* 편성 고유번호 목록 조회 */
  List<String> getVehiclePvUnqnos() throws Exception;
  /* 편성 고유번호 중복검사 */
  int checkDuplicatePvUnqno(HashMap body) throws Exception;
  /* 다중 고유번호 중복검사 */
  int checkDuplicatePvUnqnos(HashMap body) throws Exception;
  /* 편성 고유코드 중복검사 */
  int checkDuplicatePvUnqcode(HashMap body) throws Exception;
  /* 다중 편성 고유코드 중복검사 */
  int checkDuplicatePvUnqcodes(HashMap body) throws Exception;
  /* 편성 총 갯수 조회 */
  int getVehicleScheduleCount(HashMap query) throws Exception;
  /* 편성 목록 리스트 조회 */
  List<HashMap> getVehicleScheduleList(HashMap query) throws Exception;
  /* 편성 목록 리스트 조회 - 엑셀 업로드용 */
  List<HashMap> getExcelVehicleScheduleList(HashMap query) throws Exception;
  /* 편성 상세 조회 */
  Optional<HashMap> getVehicleSchedule(HashMap body) throws Exception;
}
