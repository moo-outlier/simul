CREATE TABLE `MN_POS_POSFNCT_GRP`
(
    `POS_FNCT_GRP_PID` bigint(20)   NOT NULL AUTO_INCREMENT COMMENT '포스_기능_그룹_순번',
    `STORE_UNQCODE`    varchar(14)  NOT NULL COMMENT '매장_고유코드',
    `POS_NO`           varchar(20)  NOT NULL COMMENT '포스_번호',
    `FCHQ_CODE`        varchar(7)   NOT NULL COMMENT '본사_코드',
    `GRP_CODE`         varchar(7)   NOT NULL COMMENT '그룹_코드',
    `CREATOR`          varchar(100) NOT NULL COMMENT '생성자',
    `CREATED_AT`       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성_시각',
    `UPDATER`          varchar(100) NOT NULL COMMENT '수정자',
    `UPDATED_AT`       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정_시각',
    PRIMARY KEY (`POS_FNCT_GRP_PID`),
    INDEX mn_stm_pos_fnct_grp_idx (`STORE_UNQCODE`, `POS_NO`, `CREATED_AT`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4