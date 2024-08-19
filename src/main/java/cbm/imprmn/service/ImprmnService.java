package cbm.imprmn.service;

import cbm.imprmn.dao.ImprmnDAO;
import cbm.imprmn.dao.SelectImprmnDAO;
import cmm.enums.error.ImprmnError;
import cmmcloud.enums.error.DaoError;
import cmmcloud.enums.error.EtcError;
import cmmcloud.response.ErrObj;
import cmmcloud.response.ResObj;
import cmmcloud.utils.CommonUtil;
import cmmcloud.vo.PagingVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.MessageFormat;
import java.util.HashMap;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
@Service
public class ImprmnService {

  private final ImprmnDAO imprmnDAO;
  private final SelectImprmnDAO selectImprmnDAO;

  /*
  *  ================================= 정비 이력 =================================
  */

  // 정비 이력 전체 조회
  public ResObj getAllHistory(HashMap<String, Object> obj) throws Exception {
  
    int countAllHistory = selectImprmnDAO.countAllHistory(obj);

    List<HashMap<String, Object>> getAllHistory = selectImprmnDAO.getAllHistory(obj);
    if (getAllHistory.size() < 0) {
      return ErrObj.error(EtcError.NONE_SELECT_DATA);
    }
  
    return new ResObj(new PagingVO(countAllHistory, obj), getAllHistory);
  }

  // 정비 이력 추가
  public ResObj addHistory(HashMap<String, Object> obj) throws Exception {
  
    boolean isHistoryAdded = imprmnDAO.addHistory(obj) > 0;
    if (!isHistoryAdded) {
      return ErrObj.error(DaoError.DATA_NOT_CREATED);
    }
  
    return new ResObj();
  }

  // 정비 이력 편성 번호(편성고유코드) 전체 조회
  public ResObj getAllPvUnqcodes() throws Exception {

    List<String> getAllPvUnqcodes = selectImprmnDAO.getAllPvUnqcodes();
    if (getAllPvUnqcodes.size() < 1) {
      return ErrObj.error(EtcError.NONE_SELECT_DATA);
    }

    return new ResObj(getAllPvUnqcodes);
  }

  // 정비 이력 장치 코드 전체 조회
  public ResObj getAllHistoryDeviceCodes() throws Exception {

    List<String> getAllHistoryDeviceCodes = selectImprmnDAO.getAllHistoryDeviceCodes();
    if (getAllHistoryDeviceCodes.size() < 1) {
      return ErrObj.error(EtcError.NONE_SELECT_DATA);
    }

    return new ResObj(getAllHistoryDeviceCodes);
  }

  /*
   *  ================================= 정비 매뉴얼 =================================
   */

  // 정비 매뉴얼 전체 조회
  public ResObj getAllManual(HashMap<String, Object> obj) throws Exception {

    int countAllmanual = selectImprmnDAO.countAllmanual(obj);

    List<HashMap<String, Object>> getAllmanual = selectImprmnDAO.getAllmanual(obj);
    if (getAllmanual.size() < 0) {
      return ErrObj.error(EtcError.NONE_SELECT_DATA);
    }

    return new ResObj(new PagingVO(countAllmanual, obj), getAllmanual);
  }

  // 정비 매뉴얼 추가
  public ResObj addManual(HashMap<String, Object> obj) throws Exception {

    boolean isManualAdded = imprmnDAO.addManual(obj) > 0;
    if (!isManualAdded) {
      return ErrObj.error(DaoError.DATA_NOT_CREATED);
    }

    return new ResObj();
  }

  // 정비 매뉴얼 장치 코드 전체 조회
  public ResObj getAllManualDeviceCodes() throws Exception {

    List<String> getAllManualDeviceCodes = selectImprmnDAO.getAllManualDeviceCodes();
    if (getAllManualDeviceCodes.size() <0) {
      return ErrObj.error(EtcError.NONE_SELECT_DATA);
    }

    return new ResObj(getAllManualDeviceCodes);
  }

  // 정비 매뉴얼 첨부 파일(PDF) 다운로드
  public ResponseEntity<?> downloadManualPdf(HashMap<String, Object> query)
    throws Exception {

    HashMap<String, Object> fileUrl = selectImprmnDAO.getManualFileUrl(query);
    if (CommonUtil.isNullOrEmpty(fileUrl)) {
      return ResponseEntity.badRequest().body(ImprmnError.NOT_FOUND_MANUAL.getMessage());
    }

    File file = new File(fileUrl.get("fileUrl").toString());
    FileInputStream fileInputStream = new FileInputStream(file);
    InputStreamResource resource = new InputStreamResource(fileInputStream);

    return ResponseEntity.ok()
      .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + file.getName())
      .contentType(MediaType.APPLICATION_OCTET_STREAM)
      .contentLength(file.length())
      .body(resource);
  }
}
