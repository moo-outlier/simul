package cmmcloud.data;

import java.util.LinkedHashMap;
import java.util.regex.Pattern;
import org.springframework.jdbc.support.JdbcUtils;

public class CamelLinkedHashMap extends LinkedHashMap {

  @Override
  public Object put (Object key, Object value) {

    Pattern pattern = Pattern.compile("^[a-zA-Z]+[a-zA-Z0-9]*$");
    boolean isCamelCase = pattern.matcher((String) key).matches();

    if (isCamelCase) {
      return super.put(key, value);
    }
    else {
      return super.put(JdbcUtils.convertUnderscoreNameToPropertyName((String) key), value);
    }
  }
}
