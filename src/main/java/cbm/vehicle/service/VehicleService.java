package cbm.vehicle.service;

import cbm.vehicle.dao.SelectVehicleDAO;
import cbm.vehicle.dao.VehicleDAO;
import cmm.enums.error.VehicleError;
import cmmcloud.enums.error.DaoError;
import cmmcloud.enums.error.EtcError;
import cmmcloud.response.ErrObj;
import cmmcloud.response.ResObj;
import cmmcloud.vo.PagingVO;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class VehicleService {

  @Autowired
  VehicleOutApiService outApiService;
  @Autowired
  VehicleDAO vehicleDAO;
  @Autowired
  SelectVehicleDAO selectVehicleDAO;

  /* 편성 고유코드 목록 조회 */
  public ResObj getVehiclePvUnqcodes() throws Exception  {

    /* 편성 고유코드 목록 조회 */
    List<String> vehiclePvUnqcodeList = selectVehicleDAO.getVehiclePvUnqcodes();
    if (vehiclePvUnqcodeList.isEmpty()){
      return ErrObj.error(EtcError.NONE_SELECT_DATA);
    }

    return new ResObj(vehiclePvUnqcodeList);
  }

  /* 편성 목록 */
  public ResObj getVehicleScheduleList(HashMap query) throws Exception {

    /* 1. 편성 총 갯수 조회 */
    int scheduleCount =  selectVehicleDAO.getVehicleScheduleCount(query);

    /* 2. 편성 목록 리스트 */
    List<HashMap> vehicleScheduleList = selectVehicleDAO.getVehicleScheduleList(query);
    if (vehicleScheduleList.isEmpty()) {
      return ErrObj.error(EtcError.NONE_SELECT_DATA);
    }

    return new ResObj(new PagingVO(scheduleCount, query), vehicleScheduleList);
  }

  /* 편성 목록 - 엑셀 업로드용 */
  public ResObj getExcelVehicleScheduleList(HashMap query) throws Exception {

    /* 1. 편성 목록 리스트 */
    List<HashMap> vehicleScheduleList = selectVehicleDAO.getExcelVehicleScheduleList(query);
    if (vehicleScheduleList.isEmpty()) {
      return ErrObj.error(EtcError.NONE_SELECT_DATA);
    }

    return new ResObj(vehicleScheduleList);
  }

  /* 편성 상세 조회 */
  public ResObj getVehicleSchedule(HashMap query) throws Exception {

    /* 1. 편성 상세 조회 */
    Optional<HashMap> vehicleSchedule = selectVehicleDAO.getVehicleSchedule(query);
    if (vehicleSchedule.isEmpty()){
      return ErrObj.error(VehicleError.NONE_SELECT_VEHICLE_SCHEDULE);
    }

    return new ResObj(vehicleSchedule);
  }

  /* 편성 생성 */
  public ResObj createVehicleSchedule(HashMap body) throws Exception {

    // TODO : 향후 수정 예정
    /* 1. ERP에 편성고유코드 존재 유무 체크 */
    ResObj result = outApiService.checkPvUnqcode(body);
    if (result.hasError){
      return result;
    }

    /* 2. 편성 고유번호 중복체크 */
    boolean isDuplicatePvUnqno = selectVehicleDAO.checkDuplicatePvUnqno(body) > 0;
    if (isDuplicatePvUnqno) {
      return ErrObj.error(VehicleError.DUPLICATE_PV_UNQNO);
    }

    /* 3. 편성 고유코드 중복체크 */
    boolean isDuplicatePvUnqcode = selectVehicleDAO.checkDuplicatePvUnqcode(body) > 0;
    if (isDuplicatePvUnqcode) {
      return ErrObj.error(VehicleError.DUPLICATE_PV_UNQCODE);
    }
    
    /* 4. 편성 생성 */
    boolean isAdd = vehicleDAO.createVehicleSchedule(body) > 0;
    if (!isAdd){
      return ErrObj.error(DaoError.DATA_NOT_CREATED);
    }

    return new ResObj();
  }

  /* 다중 편성 생성 */
  public ResObj createVehiclesSchedule(HashMap body) throws Exception {

    // TODO : 향후 수정 예정
    /* 1. ERP에 편성고유코드 존재 유무 체크 */
    ResObj result = outApiService.checkPvUnqcode(body);
    if (result.hasError){
      return result;
    }

    /* 2. 각 HashMap 객체의 pvUnqno와 pvUnqcode 중 중복 값이 있는지 체크 */
    List<HashMap> createList = (List<HashMap>) body.get("create");
    Set<String> duplicateCheck = new HashSet<>();
    for (HashMap create : createList){

      String pvUnqno = create.get("pvUnqno").toString();
      String pvUnqcode = create.get("pvUnqcode").toString();

      if (duplicateCheck.contains(pvUnqno)){
        return ErrObj.error(VehicleError.DUPLICATE_TEXT_PV_UNQNO);
      }
      if (duplicateCheck.contains(pvUnqcode)){
        return ErrObj.error(VehicleError.DUPLICATE_TEXT_PV_UNQCODE);
      }

      duplicateCheck.add(pvUnqno);
      duplicateCheck.add(pvUnqcode);
    }

    /* 3. 다중 편성 고유번호 중복체크 */
    boolean isDuplicatePvUnqnos = selectVehicleDAO.checkDuplicatePvUnqnos(body) > 0;
    if (isDuplicatePvUnqnos) {
      return ErrObj.error(VehicleError.DUPLICATE_PV_UNQNO);
    }

    /* 4. 다중 편성 고유코드 중복체크 */
    boolean isDuplicatePvUnqcodes = selectVehicleDAO.checkDuplicatePvUnqcodes(body) > 0;
    if (isDuplicatePvUnqcodes) {
      return ErrObj.error(VehicleError.DUPLICATE_PV_UNQCODE);
    }

    /* 5. 다중 편성 생성 */
    boolean isAdd = vehicleDAO.createVehiclesSchedule(body) > 0;
    if (!isAdd){
      return ErrObj.error(DaoError.DATA_NOT_CREATED);
    }

    return new ResObj();
  }

  /* 편성 수정 */
  public ResObj updateVehicleSchedule(HashMap body) throws Exception {

    // TODO : 향후 수정 예정
    /* 1. ERP에 편성고유코드 존재 유무 체크 */
    ResObj result = outApiService.checkPvUnqcode(body);
    if (result.hasError){
      return result;
    }

    /* 2. 편성 상세 조회 */
    Optional<HashMap> vehicleSchedule = selectVehicleDAO.getVehicleSchedule(body);
    if (vehicleSchedule.isEmpty()){
      return ErrObj.error(VehicleError.NONE_SELECT_VEHICLE_SCHEDULE);
    }

    HashMap vehicle = (HashMap) vehicleSchedule.get();
    boolean isContrainsKey = body.containsKey("pvUnqno");
    if (isContrainsKey){

      boolean isEquals = vehicle.get("pvUnqno").toString().equals(body.get("pvUnqno").toString());
      if (!isEquals){

        /* 3. 편성 고유번호 중복체크 */
        boolean isDuplicatePvUnqno = selectVehicleDAO.checkDuplicatePvUnqno(body) > 0;
        if (isDuplicatePvUnqno) {
          return ErrObj.error(VehicleError.DUPLICATE_PV_UNQNO);
        }

      }

    }

    /* 3. 편성 수정 */
    boolean isUpdate = vehicleDAO.updateVehicleSchedule(body) > 0;
    if (!isUpdate){
      return ErrObj.error(DaoError.DATA_NOT_UPDATED);
    }

    return new ResObj();
  }

  /* 편성 삭제 */
  public ResObj deleteVehicleSchedule(HashMap body) throws Exception {

    // TODO : 향후 수정 예정
    /* 1. ERP에 편성고유코드 존재 유무 체크 */
    ResObj result = outApiService.checkPvUnqcode(body);
    if (result.hasError){
      return result;
    }

    /* 2. 편성 상세 조회 */
    Optional<HashMap> vehicleSchedule = selectVehicleDAO.getVehicleSchedule(body);
    if (vehicleSchedule.isEmpty()){
      return ErrObj.error(VehicleError.NONE_SELECT_VEHICLE_SCHEDULE);
    }

    /* 3. 편성 삭제 */
    boolean isDelete = vehicleDAO.deleteVehicleSchedule(body) > 0;
    if (!isDelete){
      return ErrObj.error(DaoError.DATA_NOT_DELETED);
    }

    return new ResObj();
  }

}
