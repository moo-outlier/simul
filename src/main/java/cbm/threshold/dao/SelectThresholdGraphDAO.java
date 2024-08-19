package cbm.threshold.dao;

import cmmcloud.config.database.annotations.Slave;
import java.util.HashMap;
import java.util.List;

@Slave
public interface SelectThresholdGraphDAO {
  /* 임계치 진단 결과 그래프 목록 조회 */
  List<HashMap> getThresholdGraphList(HashMap query) throws Exception;
  /* 더미데이터 생성용 - 임계치 진단 결과 테이블 조회 */
  List<HashMap> getThresholdResultList() throws Exception;
}
