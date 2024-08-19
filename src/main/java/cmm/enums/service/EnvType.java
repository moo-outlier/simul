package cmm.enums.service;

import cmmcloud.utils.CommonUtil;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;


/**
 * ===============
 *  환경 구분 코드
 * ===============
 *
 * 1. 환경 코드는 SELECT, TEXT인 경우로 나뉘며,
 *    CM_CODE 테이블에 CODE_CNTNTS 컬럼에 SELECT||~, TEXT||~ 형태로 저장되어 있다.
 */
public enum EnvType {

  SELECT("SELECT"),
  TEXT("TEXT"),
  NONE("NONE");

  private final String envType;

  EnvType(String envType) {
    this.envType = envType;
  }

  public String getEnvType() {
    return envType;
  }

  private static Map<String, EnvType> ByName = Stream.of(values())
      .collect(Collectors.toMap(EnvType::getEnvType, e -> e));

  public static EnvType valueOfName(String envType) {
    EnvType result = ByName.get(envType);
    return CommonUtil.isNullOrEmpty(result) ? NONE: result ;
  }

  public boolean isNone(){
    return NONE.equals(this);
  }

  public boolean isSelect(){
    return SELECT.equals(this);
  }

  public boolean isText(){
    return TEXT.equals(this);
  }

}
