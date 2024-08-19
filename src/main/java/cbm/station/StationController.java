package cbm.station;

import cbm.station.service.StationService;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/main/station")
public class StationController {

  @Autowired
  StationService stationService;

  /* 역 생성 */
  @GetMapping
  public JSONObject getStationList() throws Exception{
    return stationService.getStationList().getObject();
  }

}
