package cbm.imprmn.dao;

import cmmcloud.config.database.annotations.Slave;

import java.util.HashMap;
import java.util.List;

@Slave
public interface SelectImprmnDAO {

  // 정비 이력 총 개수
  int countAllHistory(HashMap query) throws Exception;

  // 정비 이력 전체 조회
  List<HashMap<String, Object>> getAllHistory(HashMap query) throws Exception;

  // 정비 이력 편성 번호(편성고유코드) 전체 조회
  List<String> getAllPvUnqcodes() throws Exception;

  // 정비 이력 장치 코드 전체 조회
  List<String> getAllHistoryDeviceCodes() throws Exception;

  // 정비 매뉴얼 총 개수
  int countAllmanual(HashMap query) throws Exception;

  // 정비 매뉴얼 전체 조회
  List<HashMap<String, Object>> getAllmanual(HashMap query) throws Exception;

  // 정비 매뉴얼 장치 코드 전체 조회
  List<String> getAllManualDeviceCodes() throws Exception;

  // 정비 매뉴얼 PDF 다운로드 경로 조회
  HashMap<String, Object> getManualFileUrl(HashMap query) throws Exception;
}
