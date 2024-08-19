package cbm.threshold.dao;

import cmmcloud.config.database.annotations.Master;
import java.util.HashMap;
import java.util.List;

@Master
public interface ThresholdGraphDAO {
  /* 더미데이터 생성용 - 임계치 진단 결과 그래프 목록 조회 */
  int createThresholdGraphDummy(List<HashMap> list) throws Exception;
}
