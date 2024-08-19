package cmm.utils;

import cmm.enums.service.FchqCode;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.List;

public class FchqUtil {

  private static final int maxCodeDigits = 5;
  private static final int codeNumberingIdx = 1;
  private static final int demoCodeNumberingIdx = 2;
  private static final String startNumberCode = FchqCode.START_NUMBER_CODE.getFchqCodeCode();
  private static final String startNumberDemoCode = FchqCode.START_NUMBER_DEMO_CODE.getFchqCodeCode();
  private static final String startAlphabetCode = FchqCode.START_ALPHABET_CODE.getFchqCodeCode();
  private static final String startAlphabetDemoCode = FchqCode.START_ALPHABET_DEMO_CODE.getFchqCodeCode();

  private static final byte startNumAscii = 48;
  private static final byte endNumAscii = 57;

  private static final byte startAlphabetAscii = 65;
  private static final byte endAlphabetAscii = 90;


  // ASCII 기준으로 코드 리스트 정렬
  private static int compareAscii(String a, String b) {
    byte[] bytes1 = a.getBytes(StandardCharsets.US_ASCII);
    byte[] bytes2 = b.getBytes(StandardCharsets.US_ASCII);

    int result = 0;

    for (int idx = 0; idx < maxCodeDigits; idx++) {
      result = bytes1[idx] > bytes2[idx] ? 1 : bytes1[idx] < bytes2[idx] ? -1 : 0;
      boolean isSame = result == 0;
      if (!isSame) {
        break;
      }
    }

    return result;
  }

  // 숫자 아스키코드 여부
  private static boolean isNumberAscii(byte code) {

    return code >= startNumAscii && code <= endNumAscii;
  }

  // 마지막 아스키코드 여부
  private static boolean isEndAscii(byte code) {

    return code == endNumAscii || code == endAlphabetAscii;
  }

  private static String plusAscii(byte[] bytes, boolean isDemo) {

    int numberingIdx = isDemo ? demoCodeNumberingIdx : codeNumberingIdx;

    boolean isPrevEndAscii = false;
    boolean isAllEndAscii = false;

    for (int idx = maxCodeDigits - 1; idx >= numberingIdx; idx--) {

      boolean isEndAscii = isEndAscii(bytes[idx]);
      boolean isNumberAscii = isNumberAscii(bytes[idx]);

      if (isPrevEndAscii) {
        // ?9일때, ?99일때
        if (!isEndAscii) {
          bytes[idx]++;
          break;
        }
        // 모든 코드가 Z일때
        if (!isNumberAscii && idx == numberingIdx) {
          isAllEndAscii = true;
        }

        bytes[idx] = isNumberAscii ? startNumAscii : startAlphabetAscii;
      }

      if (!isEndAscii) {
        bytes[idx]++;
        break;
      }

      bytes[idx] = isNumberAscii ? startNumAscii : startAlphabetAscii;
      isPrevEndAscii = true;
    }

    String code = new String(bytes);
    FchqCode fchqCode = FchqCode.valueOfName(code);

    if (isAllEndAscii) {
      code = FchqCode.ERROR_CODE.getFchqCodeCode();
    }

    // 99, 999일때 숫자 -> 영어 코드로 진행
    if (fchqCode.isEndCode() || fchqCode.isEndDemoCode()) {
      code = isDemo ? startAlphabetCode : startAlphabetDemoCode;
    }

    return code;
  }

  public static String getNextCode(List<String> codes, boolean isDemo) {

    if (codes.isEmpty()) {
      return isDemo ? startNumberDemoCode : startNumberCode;
    }

    Collections.sort(codes, (a, b) -> compareAscii(a, b));

    String lastCode = codes.get(codes.size() - 1);

    byte[] bytes = lastCode.getBytes(StandardCharsets.US_ASCII);

    return plusAscii(bytes, isDemo);
  }
}
