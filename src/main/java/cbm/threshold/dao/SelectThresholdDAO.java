package cbm.threshold.dao;

import cmmcloud.config.database.annotations.Slave;
import java.util.HashMap;
import java.util.List;

@Slave
public interface SelectThresholdDAO {
  // 임계치 진단 결과 조회
  int getThresholdCnt(HashMap map);
  List<HashMap> getThreshold(HashMap map);
}
