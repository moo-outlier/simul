CREATE TABLE `MN_POS_OUTPUT_LOG`
(
    `POS_OUTPUT_LOG_PID`     int           NOT NULL AUTO_INCREMENT COMMENT '포스_출력물_로그_순번',
    `STORE_UNQCODE`          varchar(14)   NOT NULL COMMENT '매장_고유코드',
    `STORE_NM`               varchar(50)   NOT NULL COMMENT '매장_명',
    `CHG_DT`                 datetime      NOT NULL COMMENT '변경_일시',
    `PROCESS_SE_CODE`        varchar(1)    NOT NULL COMMENT '처리_구분_코드',
    `POS_OUTPUT_KND_CODE`    varchar(7) COMMENT '포스_출력물_종류_코드',
    `POS_OUTPUT_TMPLAT_CODE` varchar(7) COMMENT '포스_출력물_템플릿_코드',
    `OUTPUT_TMPLAT`          varchar(4000) NOT NULL COMMENT '출력_템플릿',
    `DEPT_NM`                varchar(50)   NOT NULL COMMENT '부서_명',
    `CREATOR`                varchar(100)  NOT NULL COMMENT '작성자',
    `CREATED_AT`             timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성시간',
    `UPDATER`                varchar(100)  NOT NULL COMMENT '수정자',
    `UPDATED_AT`             timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '변경시간',
    PRIMARY KEY (`POS_OUTPUT_LOG_PID`),
    INDEX mn_pos_output_log_idx (`STORE_UNQCODE`, `CREATED_AT`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4