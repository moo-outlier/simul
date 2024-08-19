package cbm.threshold.service;

import cbm.threshold.dao.SelectThresholdDAO;
import cmmcloud.response.ResObj;
import cmmcloud.vo.PagingVO;
import java.util.HashMap;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class ThresholdService {

  private final SelectThresholdDAO selectThresholdDAO;

  // 임계치 진단 결과 조회
  public ResObj getThreshold(HashMap map) {

    int thresholdCnt = selectThresholdDAO.getThresholdCnt(map);
    List<HashMap> thresholds = selectThresholdDAO.getThreshold(map);

    PagingVO pagination = new PagingVO(thresholdCnt, map);

    return new ResObj(pagination, thresholds);
  }

}
