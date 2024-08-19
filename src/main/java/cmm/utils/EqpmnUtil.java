package cmm.utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class EqpmnUtil {

  // List<Map> 안의 property로 distinct
  public static <T> Predicate<T> distinctByKey(Function<? super T, ?> keyExtractor) {
    Map<Object, Boolean> seen = new ConcurrentHashMap<>();
    return t -> seen.putIfAbsent(keyExtractor.apply(t), Boolean.TRUE) == null;
  }

  // 1depth json 리스트 구조 validation
  public static boolean validateJson(List<HashMap> list, String[] requiredKeys) {
    for (String key : requiredKeys) {
      List<HashMap> validList = list.stream()
          .filter(a -> a.containsKey(key))
          .collect(Collectors.toList());
      if (list.size() != validList.size()) {
        return false;
      }
    }
    return true;
  }

  // 1depth json 코드 중복 validation
  public static boolean validateCode(List<HashMap> list, String code) {
    List<HashMap> validCode = list.stream()
        .filter(distinctByKey(a -> a.get(code)))
        .collect(Collectors.toList());
    if (list.size() != validCode.size()) {
      return false;
    }
    return true;
  }

  // 1depth json 코드 있는 리스트 조회
  public static List<HashMap> getListWithCode(List<HashMap> list, String code) {
    return list.stream()
        .filter(a -> a.containsKey(code)
            && a.get(code) != null
            && !a.get(code).equals(""))
        .collect(Collectors.toList());
  }

  // 1depth json 코드 없는 리스트 조회
  public static List<HashMap> getListWithOutCode(List<HashMap> list, String code) {
    return list.stream()
        .filter(a -> !a.containsKey(code)
            || a.get(code) == null
            || a.get(code).equals(""))
        .collect(Collectors.toList());
  }

  // 1depth json - 코드 리스트 조회
  public static List<String> getCodeList(List<HashMap> list, String code) {
    return list.stream()
        .map(a -> a.get(code).toString())
        .collect(Collectors.toList());
  }

  // offset 계산
  public static String getOffset(Object recordSize, Object pageNo) {
    return String.valueOf((Integer.parseInt(pageNo.toString()) - 1) * Integer.parseInt(recordSize.toString()));
  }

  // String -> Json
  public static JSONObject getJsonFromString(String s) throws Exception {

    JSONParser parser = new JSONParser();
    Object obj = parser.parse(s);

    return (JSONObject) obj;
  }

  // Map -> Json
  public static JSONObject getJsonFromMap(HashMap map) throws Exception {

    return new JSONObject(map);
  }
}
