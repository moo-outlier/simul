package cmm.enums.service;

import cmmcloud.utils.CommonUtil;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;


/**
 * ===============
 *  그룹 구분 코드
 * ===============
 *
 * 1. 그룹 코드는 CHECCK, BASIC인 경우로 나뉘며,
 *    CM_CODE 테이블에 CODE_CNTNTS 컬럼에 CHECK||~, BASIC||~ 형태로 저장되어 있다.
 */
public enum GroupType {

  CHECK("CHECK"),
  BASIC("BASIC"),
  NONE("NONE");

  private final String groupType;

  GroupType(String groupType) {
    this.groupType = groupType;
  }

  public String getGroupType() {
    return groupType;
  }

  private static Map<String, GroupType> ByName = Stream.of(values())
      .collect(Collectors.toMap(GroupType::getGroupType, e -> e));

  public static GroupType valueOfName(String groupType) {
    GroupType result = ByName.get(groupType);
    return CommonUtil.isNullOrEmpty(result) ? NONE: result ;
  }

  public boolean isNone(){
    return NONE.equals(this);
  }

  public boolean isCheck(){
    return CHECK.equals(this);
  }

  public boolean isBasic(){
    return BASIC.equals(this);
  }

}
