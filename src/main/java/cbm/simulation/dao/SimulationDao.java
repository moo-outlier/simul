package cbm.simulation.dao;

import cmmcloud.config.database.annotations.Master;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Master
public interface SimulationDao {

    HashMap selectTotalRaceFlag(HashMap map);
    HashMap selectFailureFlag(HashMap map);

    List<HashMap> selectTrainInfo(HashMap map);
    List<HashMap> selectTrainInfo3(HashMap map);
    List<HashMap> selectTrainStatus(HashMap map);



    int selectLiveFailure(HashMap map);

}
