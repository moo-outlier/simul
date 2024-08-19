package cbm.vehicle.dao;

import cmmcloud.config.database.annotations.Master;
import java.util.HashMap;

@Master
public interface VehicleDAO {
  /* 편성 생성 */
  int createVehicleSchedule(HashMap body) throws Exception;
  /* 다중 편성 생성 */
  int createVehiclesSchedule(HashMap body) throws Exception;
  /* 편성 수정 */
  int updateVehicleSchedule(HashMap body) throws Exception;
  /* 편성 삭제 */
  int deleteVehicleSchedule(HashMap body) throws Exception;
}
