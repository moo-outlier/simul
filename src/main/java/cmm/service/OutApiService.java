package cmm.service;

import cmmcloud.service.ApiService;
import java.util.HashMap;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class OutApiService {

  @Value("${service.domain.rule.url}")
  private String ruleDomain;
  @Value("${service.domain.common.url}")
  private String commonDomain;


  @Autowired
  private ApiService apiService;

  /**[포스서버]
   * 총판 디폴트 라이센스 등록
   */
    public HashMap addDstrbLicense(HttpHeaders headers, HashMap body) {
    String endPoint = "/pos/license/distributor";
    ResponseEntity response = apiService.post("TODO", endPoint, headers, body);
    HashMap map = (HashMap) response.getBody();
    return map;
  }
  /**[포스서버]
   * 대리점 디폴트 라이센스 등록
   */
  public HashMap addAgencyLicense(HttpHeaders headers, HashMap body) {
    String endPoint = "/pos/license/agency";
    ResponseEntity response = apiService.post("TODO", endPoint, headers, body);
    HashMap map = (HashMap) response.getBody();
    return map;
  }
  /**[포스서버]
   * 총판 라이센스 등록
   */
  public HashMap addDstrbLicenseH(HttpHeaders headers, HashMap body) {
    String endPoint = "/pos/license/distributor/history";
    ResponseEntity response = apiService.post("TODO", endPoint, headers, body);
    HashMap map = (HashMap) response.getBody();
    return map;
  }
  /**[포스서버]
   * 대리점 라이센스 등록
   */
  public HashMap addAgencyLicenseH(HttpHeaders headers, HashMap body) {
    String endPoint = "/pos/license/agency/history";
    ResponseEntity response = apiService.post("TODO", endPoint, headers, body);
    HashMap map = (HashMap) response.getBody();
    return map;
  }
  /**[포스서버]
   * 총판 라이센스 목록 조회
   */
  public HashMap getDstrbLicenses(HttpHeaders headers, HashMap query) {
    String endPoint = "/pos/license/distributor/history";
    ResponseEntity response = apiService.get("TODO", endPoint, query, headers);
    HashMap map = (HashMap) response.getBody();
    return map;
  }
  /**[포스서버]
   * 총판 라이센스 목록 상세 조회
   */
  public HashMap getDstrbLicenseDetails(HttpHeaders headers, HashMap query) {
    String endPoint = "/pos/license/distributor/history/detail";
    ResponseEntity response = apiService.get("TODO", endPoint, query, headers);
    HashMap map = (HashMap) response.getBody();
    return map;
  }
  /**[포스서버]
   * 대리점 라이센스 목록 조회
   */
  public HashMap getAgencyLicenses(HttpHeaders headers, HashMap query) {
    String endPoint = "/pos/license/agency/history";
    ResponseEntity response = apiService.get("TODO", endPoint, query, headers);
    HashMap map = (HashMap) response.getBody();
    return map;
  }
  /**[포스서버]
   * 대리점 라이센스 목록 상세 조회
   */
  public HashMap getAgencyLicenseDetails(HttpHeaders headers, HashMap query) {
    String endPoint = "/pos/license/agency/history/detail";
    ResponseEntity response = apiService.get("TODO", endPoint, query, headers);
    HashMap map = (HashMap) response.getBody();
    return map;
  }
  /**[포스서버]
   * 총판 라이센스 비고 수정
   */
  public HashMap updateDstrbLicenseNote(HttpHeaders headers, HashMap body) {
    String endPoint = "/pos/license/distributor/history";
    ResponseEntity response = apiService.patch("TODO", endPoint, headers, body);
    HashMap map = (HashMap) response.getBody();
    return map;
  }
    /**[포스서버]
     * 대리점 라이센스 비고 수정
     */
    public HashMap updateAgencyLicenseNote(HttpHeaders headers, HashMap body) {
      String endPoint = "/pos/license/agency/history";
      ResponseEntity response = apiService.patch("TODO", endPoint, headers, body);
      HashMap map = (HashMap) response.getBody();
      return map;
  }
  /**[포스서버]
   * 총판 및 대리점 라이센스, 라이센스 이력 부분 조회 -> 설치관리
   */
  public HashMap getAgencyLicenseAndHistory(HttpHeaders headers, HashMap query) {
    String endPoint = "/pos/license/install";
    ResponseEntity response = apiService.get("TODO", endPoint, query, headers);
    HashMap map = (HashMap) response.getBody();
    return map;
  }

  /**[포스서버]
   * 총판 및 대리점 업체현황 ASP, LOCAL 잔여건수 조회 -> 설치관리
   */
  public HashMap getDstrbAndAgencyRemainder(HttpHeaders headers, HashMap query) {
    String endPoint = "/pos/license/install/remainder";
    ResponseEntity response = apiService.get("TODO", endPoint, query, headers);
    HashMap map = (HashMap) response.getBody();
    return map;
  }

  /**[매장서버]
   * 이관관리 - 관리업체 매장 조회
   */
  public HashMap getMgmtStores(HttpHeaders headers, HashMap query) {
    String endPoint = "/store/output/operation/management";
    ResponseEntity response = apiService.get("TODO", endPoint, query, headers);
    HashMap map = (HashMap) response.getBody();
    return map;
  }

  /**[매장서버]
   * 이관관리 - 이출신청 매장 밸리데이션
   */
  public HashMap checkTrnsfStore(HttpHeaders headers, HashMap query) {
    String endPoint = "/store/output/auth/check";
    ResponseEntity response = apiService.get("TODO", endPoint, query, headers);
    HashMap map = (HashMap) response.getBody();
    return map;
  }

  /**[매장서버]
   * 매장이관 - 매장 관리업체 변경
   */
  public HashMap updateStroeMgmtCorp(HttpHeaders headers, HashMap body) {
    String endPoint = "/store/input/management";
    ResponseEntity response = apiService.patch("TODO", endPoint, headers, body);
    HashMap map = (HashMap) response.getBody();
    return map;
  }

  /**[포스서버]
   * 매장이관 라이센스 등록
   */
  public HashMap addStoreTrnsfLicense(HttpHeaders headers, HashMap body) {
    String endPoint = "/pos/license/store/transfer";
    ResponseEntity response = apiService.post("TODO", endPoint, headers, body);
    HashMap map = (HashMap) response.getBody();
    return map;
  }

  /**[포스서버]
   *총판 관리업체현황 조회 - license
   */
  public HashMap getCorpAuthLicense (HashMap query) {
    String endPoint = "/pos/msa/authentication/license";
    ResponseEntity response = apiService.get("TODO", endPoint, query);
    HashMap map = (HashMap) response.getBody();
    return map;
  }

  /**[매장서버]
   *총판대리점 포스사용현황 매장정보 조회
   */
  public HashMap getMgmtCorpStoreStatus (HashMap query) {
    String endPoint = "/store/output/main/pos";
    ResponseEntity response = apiService.get("TODO", endPoint, query);
    HashMap map = (HashMap) response.getBody();
    return map;
  }

  /**[포스서버]
   *총판대리점 포스사용현황 사용 포스 조회
   */
  public HashMap getUseStorePosCnt (HashMap query) {
    String endPoint = "/pos/msa/use/pos-status";
    ResponseEntity response = apiService.get("TODO", endPoint, query);
    HashMap map = (HashMap) response.getBody();
    return map;
  }

  /**[포스서버]
   * 재설치대상매장현황 포스정보 조회
   * */
  public HashMap getReauthenticationPosInfo(HttpHeaders headers) {
    String endPoint = "/pos/msa/reauthentication";
    ResponseEntity response = apiService.get("TODO", endPoint, headers);
    HashMap map = (HashMap) response.getBody();
    return map;
  }

  /**
   * [포스서버] - 설치의뢰 포스 업데이트
   * */
  public HashMap updateRequestInstlPos(HashMap query) {
    String endPoint = "/pos/msa/install";
    ResponseEntity response = apiService.get("TODO", endPoint, query);
    HashMap map = (HashMap) response.getBody();
    return map;
  }

  /**
   * [포스서버] - 월인증 라이센스 등록
   * */
  public HashMap addMonthLicenseInstall(HashMap body) {
    String endPoint = "/pos/license/month/install";
    ResponseEntity response = apiService.post("TODO", endPoint, body);
    HashMap map = (HashMap) response.getBody();
    return map;
  }

  /**
   * [권한서버] - 총판/대리점 생성 시 기본메뉴 권한부여
   * */
  public HashMap addDefaultMenuRule(HttpHeaders headers,HashMap body) {
    String endPoint = "/authority/menu/rule/agency/default";
    ResponseEntity response = apiService.post(ruleDomain, endPoint,headers, body);
    HashMap map = (HashMap) response.getBody();
    return map;
  }

  /**[매장서버]
   * 관리자페이지 설치현황통계 - 매장정보조회 (포스 설치일 기준)
   */
  public HashMap getPosInstlStores(HashMap query) {
    String endPoint = "/store/output/main/install";
    ResponseEntity response = apiService.get("TODO", endPoint, query);
    HashMap map = (HashMap) response.getBody();
    return map;
  }

  /**[포스서버]
   * 관리자페이지 설치현황통계 - 포스 마지막 로그인 이력 조회
   */
  public HashMap getPosInformation(HashMap query) {
    String endPoint = "/pos/msa/information";
    ResponseEntity response = apiService.post("TODO", endPoint, query);
    HashMap map = (HashMap) response.getBody();
    return map;
  }

  /**
   * [매장서버] mgmtVanCode, mgmtCorpCode, mgmtVanCode 조회
   * */
  public HashMap getStoreMgmtInfos(HashMap body) {
    String endPoint = "/store/output/management";
    ResponseEntity response = apiService.post("TODO", endPoint, body);
    HashMap map = (HashMap) response.getBody();
    return map;
  }


}
