CREATE TABLE `MN_POS_CORP_INSTL_DAILY_STATS`
(
    `CORP_INSTL_DAILY_PID`  bigint       NOT NULL AUTO_INCREMENT COMMENT '업체_설치_일일_통계_순번',
    `POS_CORP_PID`          bigint       NOT NULL COMMENT '포스_업체_순번',
    `DAILY_ASP_BUY_CNT`     int(11)      NOT NULL DEFAULT 0 COMMENT '일_ASP_구매_수량',
    `DAILY_LOCAL_BUY_CNT`   int(11)      NOT NULL DEFAULT 0 COMMENT '일_LOCAL_구매_수량',
    `DAILY_ASP_SALE_CNT`    int(11)      NOT NULL DEFAULT 0 COMMENT '일_ASP_판매_수량',
    `DAILY_LOCAL_SALE_CNT`  int(11)      NOT NULL DEFAULT 0 COMMENT '일_LOCAL_판매_수량',
    `DAILY_ASP_INSTL_CNT`   int(11)      NOT NULL DEFAULT 0 COMMENT '일_ASP_설치_수량',
    `DAILY_LOCAL_INSTL_CNT` int(11)      NOT NULL DEFAULT 0 COMMENT '일_LOCAL_설치_수량',
    `DAILY_CALC_DE`         int          NOT NULL COMMENT '일일_계산_일자',
    `CREATOR`               varchar(100) NOT NULL COMMENT '작성자',
    `CREATED_AT`            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성시간',
    `UPDATER`               varchar(100) NOT NULL COMMENT '수정자',
    `UPDATED_AT`            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '변경시간',
    PRIMARY KEY (`CORP_INSTL_DAILY_PID`),
    INDEX mn_pos_corp_instl_daily_stats_idx (`POS_CORP_PID`, `CREATED_AT`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4