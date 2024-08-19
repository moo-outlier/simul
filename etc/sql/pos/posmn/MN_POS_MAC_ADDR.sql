CREATE TABLE `MN_POS_MAC_ADDR`
(
    `POS_MAC_ADDR_PID` bigint       NOT NULL AUTO_INCREMENT COMMENT '포스_맥_어드레스_순번',
    `POS_PID`          bigint       NOT NULL COMMENT '포스_순번',
    `STORE_UNQCODE`    varchar(14)  NOT NULL COMMENT '매장_고유코드',
    `FCHQ_CODE`        varchar(7)   NOT NULL COMMENT '본사_코드',
    `STORE_NM`         varchar(50)  NOT NULL COMMENT '매장_명',
    `POS_NO`           varchar(20)  NOT NULL COMMENT '포스_번호',
    `MAC_ADDR_VAL`     varchar(100) NOT NULL COMMENT '맥_주소_값',
    `USE_SE_CODE`      varchar(1)   NOT NULL COMMENT '사용_구분_코드',
    `DEMO_END_DE`      int          NOT NULL COMMENT '데모_종료_일자',
    `MAC_ADDR_NOTE`    varchar(400) COMMENT '맥_주소_비고',
    `CREATOR`          varchar(100) NOT NULL COMMENT '작성자',
    `CREATED_AT`       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성시간',
    `UPDATER`          varchar(100) NOT NULL COMMENT '수정자',
    `UPDATED_AT`       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '변경시간',
    PRIMARY KEY (`POS_MAC_ADDR_PID`),
    INDEX mn_pos_mac_addr_idx (`POS_PID`, `STORE_UNQCODE`, `CREATED_AT`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4