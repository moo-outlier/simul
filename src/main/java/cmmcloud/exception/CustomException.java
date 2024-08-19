package cmmcloud.exception;

import cmmcloud.response.ResObj;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.json.simple.JSONObject;

@Getter
@AllArgsConstructor
public class CustomException extends RuntimeException{

  private ResObj resObj;

  public JSONObject getObject() {
    return resObj.getObject();
  }
}
