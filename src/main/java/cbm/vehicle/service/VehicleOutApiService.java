package cbm.vehicle.service;

import cmm.enums.error.VehicleError;
import cmmcloud.response.ErrObj;
import cmmcloud.response.ResObj;
import cmmcloud.service.ApiService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class VehicleOutApiService {

  @Autowired
  ApiService apiService;

  // TODO : 향후에 수정 예정
//  private final String DOMAIN = "www.cbm260.co.kr";

  /* TODO : ERP에 편성고유코드가 존재하는지 체크 */
  public ResObj checkPvUnqcode(HashMap map) throws Exception {

    // TODO : 향후에 수정 예정
    /* TODO : ERP와 연계시 다중, 단일 편성고유코드 조회 구현해야함 */
//    String endPoint = "/erp";
//    ResponseEntity response = apiService.get(DOMAIN, endPoint, query, null);
//    HashMap map = (HashMap) response.getBody();
//    return map;

    // TODO : 향후에 삭제 예정
    /* TODO : 다중 편성고유코드 조회 */
    boolean isContainsKey = map.containsKey("create");
    if (isContainsKey){

      List<HashMap> createList = (List<HashMap>) map.get("create");
      for (HashMap create :  createList){

        String pvUnqcode = create.get("pvUnqcode").toString();
        int parsePvUnqcode = Integer.parseInt(pvUnqcode);

        if (parsePvUnqcode < 1100 || parsePvUnqcode > 1400) {
          return ErrObj.error(VehicleError.NONE_SELECT_PV_UNQCODE);
        }

      }

      return new ResObj();
    }

    // TODO : 향후에 삭제 예정
    /* TODO : 단일 편성고유코드 조회 */
    String pvUnqcode = map.get("pvUnqcode").toString();
    int parsePvUnqcode = Integer.parseInt(pvUnqcode);

    if (parsePvUnqcode < 1100 || parsePvUnqcode > 1400) {
      return ErrObj.error(VehicleError.NONE_SELECT_PV_UNQCODE);
    }

    return new ResObj();
  }

}
