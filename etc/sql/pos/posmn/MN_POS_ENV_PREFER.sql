CREATE TABLE `MN_POS_ENV_PREFER`
(
    `ENV_PREFER_PID` int          NOT NULL AUTO_INCREMENT COMMENT '환경_설정_일련번호',
    `STORE_UNQCODE`  varchar(14)  NOT NULL COMMENT '매장_고유코드',
    `TAB_CODE`       varchar(7)   NOT NULL COMMENT '탭_코드',
    `POS_NO`         varchar(20)  NOT NULL DEFAULT 00 COMMENT '포스_번호',
    `ENV_JSON`       JSON         NOT NULL COMMENT '환경설정_JSON',
    `PREV_ENV_JSON`  JSON         NOT NULL COMMENT '이전_환경설정_JSON',
    `CREATOR`        varchar(100) NOT NULL COMMENT '생성자',
    `CREATED_AT`     timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성_일시',
    `UPDATER`        varchar(100) NOT NULL COMMENT '수정자',
    `UPDATED_AT`     timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정_일시',
    PRIMARY KEY (`ENV_PREFER_PID`),
    INDEX mn_stm_env_prefer_idx (`STORE_UNQCODE`, `CREATED_AT`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4