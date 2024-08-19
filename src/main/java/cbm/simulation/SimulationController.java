package cbm.simulation;

import cbm.simulation.service.SimulationService;
import cmmcloud.response.ResObj;
import lombok.RequiredArgsConstructor;
import org.json.simple.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

@RestController
@RequestMapping("/main/simul")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class SimulationController {

    private final SimulationService simulationService;

    @GetMapping("/dummy")
    public JSONObject getLiveTrain(@RequestParam HashMap map, @RequestHeader HttpHeaders headers) {


        return simulationService.getLiveTrainInfo(map).getObject();
    }

    @GetMapping("/dummy1")
    public JSONObject getLiveTrain1(@RequestParam HashMap map, @RequestHeader HttpHeaders headers) {


        return simulationService.getLiveTrainInfo1(map).getObject();
    }

    @GetMapping("/dummy2")
    public JSONObject getLiveTrain2(@RequestParam HashMap map, @RequestHeader HttpHeaders headers) {


        return simulationService.getLiveTrainInfo2(map).getObject();
    }

    @GetMapping("/dummy3")
    public JSONObject getLiveTrain3(@RequestParam HashMap map, @RequestHeader HttpHeaders headers) {

        return simulationService.getLiveTrainInfo3(map).getObject();
    }

    @GetMapping("/dummy4")
    public JSONObject getLiveTrain4(@RequestParam HashMap map, @RequestHeader HttpHeaders headers) {

        return simulationService.getLiveTrainInfo4(map).getObject();
    }
}
