package cmm.enums.service;

import cmmcloud.utils.CommonUtil;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public enum FchqCode {

  CODE_START_CHAR("H"),
  DEMO_CODE_START_CHAR("DH"),
  START_NUMBER_CODE("H000001"),
  START_NUMBER_DEMO_CODE("DH00001"),
  START_ALPHABET_CODE("HAAAAAA"),
  START_ALPHABET_DEMO_CODE("DHAAAAA"),
  END_CODE("H000000"),
  END_DEMO_CODE("DH00000"),
  ERROR_CODE("XXXXXXX");

  private final String fchqCode;

  FchqCode(String fchqCode) {
    this.fchqCode = fchqCode;
  }

  public String getFchqCodeCode() {
    return fchqCode;
  }

  private static Map<String, FchqCode> ByName = Stream.of(values())
      .collect(Collectors.toMap(FchqCode::getFchqCodeCode, e -> e));

  public static FchqCode valueOfName(String fchqCode) {
    FchqCode result = ByName.get(fchqCode);
    return CommonUtil.isNullOrEmpty(result) ? ERROR_CODE: result ;
  }

  public static boolean isDemoCode (String code) {
    
    return code.startsWith(DEMO_CODE_START_CHAR.fchqCode);
  }
  
  public boolean isErrorCode(){
    return ERROR_CODE.equals(this);
  }

  public boolean isEndCode(){
    return END_CODE.equals(this);
  }

  public boolean isEndDemoCode(){
    return END_DEMO_CODE.equals(this);
  }

}
