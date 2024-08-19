CREATE TABLE `MN_POS_POSFNCT_AUTH`
(
    `POS_FNCT_AUTH_PID` bigint(20)   NOT NULL AUTO_INCREMENT COMMENT '포스_기능_인증_순번',
    `STORE_UNQCODE`     varchar(14)  NOT NULL COMMENT '매장_고유코드',
    `FCHQ_CODE`         varchar(7)   NOT NULL COMMENT '본사_코드',
    `GRP_CODE`          varchar(7)   NOT NULL COMMENT '그룹_코드',
    `FNCT_NO`           varchar(20)  NOT NULL COMMENT '기능_번호',
    `AUTH_USE_AT`       varchar(1)   NOT NULL DEFAULT 'Y' COMMENT '인증_사용_여부',
    `AUTH_AT`           varchar(1)   NOT NULL DEFAULT 'Y' COMMENT '인증_여부',
    `OWNER_PRMISN_AT`   varchar(1)   NOT NULL DEFAULT 'N' COMMENT '점주_허가_여부',
    `SALES_PRMISN_AT`   varchar(1)   NOT NULL DEFAULT 'N' COMMENT '판매원_허가_여부',
    `STAFF_PRMISN_AT`   varchar(1)   NOT NULL DEFAULT 'N' COMMENT '직원_허가_여부',
    `DLVRY_PRMISN_AT`   varchar(1)   NOT NULL DEFAULT 'N' COMMENT '배달_허가_여부',
    `CREATOR`           varchar(100) NOT NULL COMMENT '생성자',
    `CREATED_AT`        timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성_시각',
    `UPDATER`           varchar(100) NOT NULL COMMENT '수정자',
    `UPDATED_AT`        timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정_시각',
    PRIMARY KEY (`POS_FNCT_AUTH_PID`),
    INDEX mn_stm_pos_fnct_auth_idx (`STORE_UNQCODE`, `CREATED_AT`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4