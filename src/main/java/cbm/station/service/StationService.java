package cbm.station.service;

import cbm.station.dao.SelectStationDAO;
import cmmcloud.enums.error.EtcError;
import cmmcloud.response.ErrObj;
import cmmcloud.response.ResObj;
import java.util.HashMap;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class StationService {

  @Autowired
  SelectStationDAO selectStationDAO;

  /* 역 목록 조회 */
  public ResObj getStationList() throws Exception {

    List<HashMap> stationList = selectStationDAO.getStationList();
    if (stationList.isEmpty()) {
      return ErrObj.error(EtcError.NONE_SELECT_DATA);
    }

    return new ResObj(stationList);
  }

}
