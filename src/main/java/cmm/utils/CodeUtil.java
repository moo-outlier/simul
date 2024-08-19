package cmm.utils;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class CodeUtil {

  public final static String defaultCode = "0000000";

  /**
   * =================================================================
   *                  코드 리스트에서 마지막 코드 가져오기
   * =================================================================
   *
   * 설명 : 코드 리스트에서 가장 마지막 코드값 가져오기(숫자 코드 기준)
   *
   * 1. 코드 리스트가 비어있으면 0000000 리턴
   *
   * 2. 숫자기준으로 정렬
   *
   * 3. 가장 마지막 코드값 리턴
   *
   * 4. 예시코드
   *
   *    String lastCode = CodeUtil.getLastCode(codes);
   */
  public static String getLastCode(List<String> codes) {

    if (codes.isEmpty()){
      return defaultCode;
    }

    Collections.sort(codes, Comparator.comparingInt(Integer::parseInt));

    return codes.get(codes.size() - 1);
  }

  /**
   * =================================================================
   *                        다음 코드 가져오기
   * =================================================================
   *
   * 설명 : 다음 코드값 가져오기(숫자 코드 기준)
   *
   * 1. 코드 리스트가 비어있으면 0000000 리턴
   *
   * 2. 숫자기준으로 정렬
   *
   * 3. 가장 마지막 코드값에 +1
   *
   * 4. 예시코드
   *
   *    String nextCode = CodeUtil.getNextCode(codes);
   */
  public static String getNextCode(List<String> codes) {

    if (codes.isEmpty()){
      return defaultCode;
    }

    Collections.sort(codes, Comparator.comparingInt(Integer::parseInt));

    int nextCode = Integer.parseInt(codes.get(codes.size() - 1)) + 1;
    return String.valueOf(nextCode);
  }

  public static String getNextCode(List<String> codes, String defaultCode) {

    if (codes.isEmpty()){
      return defaultCode;
    }

    Collections.sort(codes, Comparator.comparingInt(Integer::parseInt));

    int nextCode = Integer.parseInt(codes.get(codes.size() - 1)) + 1;
    if (nextCode < 10) {
      return "00" + nextCode;
    }
    else if (nextCode < 100) {
      return "0" + nextCode;
    }
    else {
      return String.valueOf(nextCode);
    }
  }
}
