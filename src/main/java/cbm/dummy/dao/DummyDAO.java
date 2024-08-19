package cbm.dummy.dao;

import cbm.dummy.vo.VehicleDummyVO;
import cmmcloud.config.database.annotations.Master;
import java.util.List;

@Master
public interface DummyDAO {

  int addThresholdDummy(List list);
  int addFailureHDummy(List list);
  int updateLiveVehicles(List<VehicleDummyVO> list);

}
