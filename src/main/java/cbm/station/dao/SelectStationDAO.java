package cbm.station.dao;

import cmmcloud.config.database.annotations.Slave;
import java.util.HashMap;
import java.util.List;

@Slave
public interface SelectStationDAO {
  /* 역 목록 조회 */
  List<HashMap> getStationList() throws Exception;
}
