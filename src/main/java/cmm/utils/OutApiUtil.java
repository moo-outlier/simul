package cmm.utils;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.stream.Collectors;

public class OutApiUtil {
  /**
   * =================================================================
   *    Main, Pos 서버 간 라이센스 데이터(List<HashMap>) 병합 메소드
   * =================================================================
   *
   * 설명 : POS 서버에서 수신된 총판 라이센스(이력) + 대리점 라이센스(이력)의
   *       List<HashMap> 데이터를 MAIN 서버의 총판 및 대리점의 List<HashMap>
   *       데이터와 병합.
   * 참고: corpCode 매핑되는 총판, 대리점 컬럼은 서로 다른 값.
   *      corpCode -> 총판: dstrb_code(총판코드)
   *                  대리점: agency_unqcode(대리점 고유코드)
   */
  public static void mergeListMap(List<HashMap> firstMap, List<HashMap> secondMap, List<HashMap> mergedMaps) {

    for(HashMap<String, Object> map1 : firstMap) {
      String keyCorpCode1 = (String) map1.get("corpCode");

      for(HashMap<String, Object> map2 : secondMap) {
        String keyCorpCode2 = (String) map2.get("corpCode");

        if(keyCorpCode1 != null
            && keyCorpCode2 != null
            && keyCorpCode1.equals(keyCorpCode2)) {
          LinkedHashMap<String, Object> mapForMerging = new LinkedHashMap();
          mapForMerging.putAll(map1);
          mapForMerging.putAll(map2);
          mapForMerging.replace("corpNm", map1.get("corpNm"));
          mergedMaps.add(mapForMerging);
        }
      }
    }
  }
}
