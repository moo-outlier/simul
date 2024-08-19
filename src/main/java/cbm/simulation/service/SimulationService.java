package cbm.simulation.service;

import cbm.simulation.dao.SimulationDao;
import cmmcloud.response.ResObj;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Objects;

@Slf4j
@Service
@RequiredArgsConstructor
public class SimulationService {

    private final SimulationDao simulationDao;

    public ResObj getLiveTrainInfo(HashMap map) {

        HashMap<String, Object> reponseTestHashMap = new HashMap<>();

        HashMap hashMaps = simulationDao.selectTotalRaceFlag(map);
        reponseTestHashMap.put("RACE_FLAG_1", hashMaps.get("RACE_FLAG_1").toString());
        reponseTestHashMap.put("RACE_FLAG_2", hashMaps.get("RACE_FLAG_2").toString());
        reponseTestHashMap.put("RACE_FLAG_3", hashMaps.get("RACE_FLAG_3").toString());

        int count = simulationDao.selectLiveFailure(map);
        reponseTestHashMap.put("LIVE_FAILURE", String.valueOf(count));

        HashMap failureFlag = simulationDao.selectFailureFlag(map);
        reponseTestHashMap.put("FAILURE_FLAG_1", failureFlag.get("FAILURE_FLAG_1").toString());
        reponseTestHashMap.put("FAILURE_FLAG_2", failureFlag.get("FAILURE_FLAG_2").toString());
        reponseTestHashMap.put("FAILURE_FLAG_3", failureFlag.get("FAILURE_FLAG_3").toString());
        reponseTestHashMap.put("FAILURE_FLAG_4", failureFlag.get("FAILURE_FLAG_4").toString());
        reponseTestHashMap.put("FAILURE_FLAG_5", failureFlag.get("FAILURE_FLAG_5").toString());



        return new ResObj(reponseTestHashMap);
    }

    public ResObj getLiveTrainInfo1(HashMap map) {

        List<HashMap> trainInfo = simulationDao.selectTrainInfo(map);


        return new ResObj(trainInfo);
    }

    public ResObj getLiveTrainInfo2(HashMap map) {

        List<HashMap> trainInfo = simulationDao.selectTrainStatus(map);


        return new ResObj(trainInfo);
    }

    public ResObj getLiveTrainInfo3(HashMap map) {

        List<HashMap> trainInfo = simulationDao.selectTrainStatus(map);


        return new ResObj(trainInfo);
    }

    public ResObj getLiveTrainInfo4(HashMap map) {

        List<HashMap> trainInfo = simulationDao.selectTrainInfo3(map);
        HashMap hashMap = trainInfo.get(0);


        return new ResObj(hashMap);
    }
}
