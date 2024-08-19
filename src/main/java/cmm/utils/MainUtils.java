package cmm.utils;

import cmmcloud.response.ResObj;
import cmmcloud.utils.CommonUtil;
import com.google.gson.Gson;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.apache.tomcat.util.codec.binary.Base64;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.http.HttpHeaders;

@Slf4j
public class MainUtils {

  // HashMap -> jsonString -> AES 암호화
  public static String toJsonString(HashMap<String, Object> map) {
    Gson gson = new Gson();
    return gson.toJson(map);

  }

  // AES 복호화 -> jsonString -> HashMap
  public static HashMap<String, Object> toHashMap(String jsonString) {
    Gson gson = new Gson();
    HashMap<String, Object> map = gson.fromJson(jsonString, HashMap.class);
    return map;
  }

  public static boolean bodyIsNullOrEmpty(List<HashMap> bodys, String[] validate) {
    // list 값 체크
    if (bodys.size() == 0) {
      return true;
    }
    // map 내부 Parameter Validation
    for (HashMap body : bodys) {
      for (String obj : validate) {

        if (body.get(obj) == null || "".equals(body.get(obj))) {
          return true;
        }

      }
    }
    return false;
  }

  public static ResObj getOutApiErrorObj(HashMap resultOutApi) {
    HashMap error = (HashMap) resultOutApi.get("error");
    String errorCode = error.get("code").toString();
    String results = resultOutApi.get("results").toString();
    String errorStatus = resultOutApi.get("status").toString();

    ResObj errorObj = new ResObj();
    errorObj.setErrorCode(errorCode);
    errorObj.setError(errorStatus, results);

    return errorObj;
  }

  public static String getRoleCodeInJwt(HttpHeaders headers) throws Exception {
    List<String> userList = headers.get("GP-AUTH-TOKEN");
    String jwtTkn = userList.get(0);

    String[] split_string = jwtTkn.split("\\.");
    String base64EncodedBody = split_string[1];                         // Body

    Base64 base64Url = new Base64(true);
    String body = new String(base64Url.decode(base64EncodedBody));
    JSONParser jsonParser = new JSONParser();
    JSONObject jsonObject = (JSONObject) jsonParser.parse(body);
    HashMap map = (HashMap) jsonObject.get("userInfo");

    String roleCode = map.get("roleCode").toString();
    return roleCode;
  }

  public static String getUserNmInHeaders(HttpHeaders headers) throws ParseException {
    List<String> userList = headers.get("GP-AUTH-TOKEN");
    String jwtTkn = userList.get(0);

    String[] split_string = jwtTkn.split("\\.");
    String base64EncodedBody = split_string[1];                         // Body

    Base64 base64Url = new Base64(true);
    String body = new String(base64Url.decode(base64EncodedBody));
    JSONParser jsonParser = new JSONParser();
    JSONObject jsonObject = (JSONObject) jsonParser.parse(body);
    HashMap map = (HashMap) jsonObject.get("userInfo");

    String userNm = map.get("userNm").toString();

    return userNm;
  }

}
