package cmm.enums.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * ====================== 포스관리이력/포스설치 공통코드 ====================== - 포스관리이력코드 = 포스 업체 라이센스구매, 설치, 이관
 * 등을 구분하는 코드 - 포스설치코드 = 포스 신규 및 재설치 관련 공통코드
 */
public enum PosInstCode {

  ADD_LICENSE_CODE("4020001"),  // 라이센스 구매 코드
  EXCLUSIVE_CORP_SALE_CODE("4020002"), // 총판 판매 코드
  EXCLUSIVE_CORP_BUY_CODE("4020003"), // 총판 구매 코드
  NEW_INSTALL_CODE("4020004"), // 신규 설치 코드
  CHANGE_CORP_CODE("4020005"), // 명의 변경 코드
  STORE_TRANSFER_CODE("4020006"), // 매장 이관 코드
  CERTIFICATE_EXPLANATION_CODE("4020007"), // 인증 소명 코드
  LICENSE_TRANSFER_CODE("4020008"), // 라이센스 이관 코드
  MONTH_CERTIFICATE_CODE("4020009"), // 월 인증 등록 코드
  AGENCY_CORP_GRATUITOUS_CODE("4020010"), // 대리점 무상 지원 코드
  AGENCY_CORP_SELF_BUY_CODE("4020011"), // 대리점 자체 구매 코드
  POS_INSTALL_WAITING_STATUS_CODE("7030001"), // 설치상태구분코드-설치대기중
  POS_NEW_INSTALL_STATUS_CODE("7030002"), // 설치상태구분코드-신규설치완료
  POS_REINSTALL_STATUS_CODE("7030003"), // 설치상태구분코드-재설치완료
  POS_INSTALL_CODE("7030004"), // 설치구분코드-신규설치
  POS_WINDOWS_ERROR_REINSTALL_CODE("7030005"), // 설치구분코드-윈도우오류
  POS_SW_ERROR_REINSTALL_CODE("7030006"), // 설치구분코드-S/W오류
  POS_HW_ERROR_REINSTALL_CODE("7030007"), // 설치구분코드-H/W오류
  POS_ETC_REINSTALL_CODE("7030008"); // 설치구분코드-기타

  private final String code;

  PosInstCode(String code) {
    this.code = code;
  }

  public String getCode() {
    return code;
  }

  public static Map<String, PosInstCode> InstlStatsCodeByName = Stream.of(values())
      .collect(Collectors.toMap(PosInstCode::getCode, e -> e));

  public boolean isInstlStatsCode(String code) {
    return code.equals(code);
  }

  public static boolean isInstlSeCode(String code) {
    return Stream.of(values()).collect(Collectors.toList())
        .stream()
        .anyMatch(value -> value.getCode().equals(code));
  }

}