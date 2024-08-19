CREATE TABLE `ENV_CODE` (
    `ENV_CODE_PID` int NOT NULL AUTO_INCREMENT COMMENT '환경_코드_일련번호',
    `ENV_CODE` varchar(7) NOT NULL  COMMENT '환경_코드',
    `ENV_CODE_NM` varchar(50) NOT NULL  COMMENT '환경_코드_명',
    `ENV_SET_FG` varchar(7) NOT NULL  COMMENT '환경_set_fg',
    `USE_AT` varchar(1) NOT NULL  COMMENT '사용_여부',
    `GRP_CODE` varchar(7) NOT NULL  COMMENT '그룹_코드',
    `ENV_SE_CODE` varchar(1)   COMMENT '환경_구분_코드',
    `ENV_CODE_NOTE` varchar(400)   COMMENT '환경_코드_비고',
    `CREATOR` varchar(100) NOT NULL  COMMENT '작성자',
    `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성일시',
    `UPDATER` varchar(100) NOT NULL  COMMENT '수정자',
    `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시'
    , PRIMARY KEY (`ENV_CODE_PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4