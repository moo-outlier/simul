CREATE TABLE `MN_POS_CORP_INSTL_STATS`
(
    `CORP_INSTL_STATS_PID`  bigint       NOT NULL AUTO_INCREMENT COMMENT '업체_설치_통계_순번',
    `SALE_CORP_CODE`        varchar(7)   NOT NULL COMMENT '판매_업체_코드',
    `BUY_CORP_CODE`         varchar(7)   NOT NULL COMMENT '구매_업체_코드',
    `CORP_INSTL_STATS_CODE` varchar(7)   NOT NULL COMMENT '업체_설치_통계_코드',
    `ASP_SALE_CNT`          int(11)      NOT NULL DEFAULT 0 COMMENT 'ASP_판매_수량',
    `ASP_SALE_PRICE`        int(11)      NOT NULL DEFAULT 0 COMMENT 'ASP_판매_금액',
    `ASP_BUY_CNT`           int(11)      NOT NULL DEFAULT 0 COMMENT 'ASP_구매_수량',
    `ASP_BUY_PRICE`         int(11)      NOT NULL DEFAULT 0 COMMENT 'ASP_구매_금액',
    `LOCAL_SALE_CNT`        int(11)      NOT NULL DEFAULT 0 COMMENT 'LOCAL_판매_수량',
    `LOCAL_SALE_PRICE`      int(11)      NOT NULL DEFAULT 0 COMMENT 'LOCAL_판매_금액',
    `LOCAL_BUY_CNT`         int(11)      NOT NULL DEFAULT 0 COMMENT 'LOCAL_구매_수량',
    `LOCAL_BUY_PRICE`       int(11)      NOT NULL DEFAULT 0 COMMENT 'LOCAL_구매_금액',
    `CORP_AUTH_NOTE`        varchar(400) COMMENT '인증_비고',
    `STORE_UNQCODE`         varchar(14) COMMENT '매장_고유코드',
    `POS_NO`                varchar(50) COMMENT '포스_번호',
    `CREATOR`               varchar(100) NOT NULL COMMENT '작성자',
    `CREATED_AT`            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성시간',
    `UPDATER`               varchar(100) NOT NULL COMMENT '수정자',
    `UPDATED_AT`            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '변경시간',
    PRIMARY KEY (`CORP_INSTL_STATS_PID`),
    INDEX mn_pos_corp_instl_stats_idx (`SALE_CORP_CODE`, `BUY_CORP_CODE`, `CREATED_AT`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4