package cbm.imprmn.dao;

import cmmcloud.config.database.annotations.Master;

import java.util.HashMap;

@Master
public interface ImprmnDAO {

  // 이력 추가
  int addHistory(HashMap obj) throws Exception;

  // 매뉴얼 추가
  int addManual(HashMap obj) throws Exception;
}
