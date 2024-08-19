package cbm.failure.dao;

import cmmcloud.config.database.annotations.Slave;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

@Slave
public interface SelectFailureDAO {
  /* 고장 이력 총 갯수 조회 */
  int getFailureCount(HashMap query) throws Exception;
  /* 고장 이력 목록 리스트 */
  List<HashMap> getFailureList(HashMap query) throws Exception;
  /* 고장 코드 상세 조회 */
  Optional<HashMap> getFailureCode(HashMap query) throws Exception;
  /* 편성고유코드 카테고리 조회 */
  List<String> getPvUnqcodeCategory() throws Exception;
  /* 장치코드 카테고리 조회 */
  List<String> getDeviceCodeCategory() throws Exception;
  /* 고장코드 카테고리 조회 */
  List<String> getFailureCodeCategory() throws Exception;
}
