CREATE TABLE `MN_POS_OUTPUT_CODE`
(
    `POS_OUTPUT_CODE_PID` int          NOT NULL AUTO_INCREMENT COMMENT '포스_출력물_템플릿_순번',
    `STORE_UNQCODE`       varchar(14)  NOT NULL COMMENT '매장_고유코드',
    `POS_OUTPUT_KND_CODE` varchar(7)   NOT NULL COMMENT '포스_출력물_종류_코드',
    `POS_OUTPUT_CODE`     varchar(7)   NOT NULL COMMENT '포스_출력물_코드',
    `CREATOR`             varchar(100) NOT NULL COMMENT '작성자',
    `CREATED_AT`          timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성시간',
    `UPDATER`             varchar(100) NOT NULL COMMENT '수정자',
    `UPDATED_AT`          timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '변경시간',
    PRIMARY KEY (`POS_OUTPUT_CODE_PID`),
    INDEX mn_pos_output_code_idx (`STORE_UNQCODE`, `CREATED_AT`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4