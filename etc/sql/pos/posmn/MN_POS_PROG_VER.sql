CREATE TABLE `MN_POS_PROG_VER`
(
    `POS_PROG_VER_PID`          bigint       NOT NULL AUTO_INCREMENT COMMENT '포스_프로그램_버전_순번',
    `POS_PROG_VER_NO`           varchar(20)  NOT NULL COMMENT '포스_프로그램_버전_번호',
    `POS_PROG_VER_NM`           varchar(50)  NOT NULL COMMENT '포스_프로그램_버전_명',
    `PROG_KIND_CODE`            varchar(7)   NOT NULL COMMENT '프로그램_종류_코드',
    `UPDATE_SE_CODE`            varchar(1)   NOT NULL COMMENT '업데이트_구분_코드',
    `POS_PROG_VER_FILE_NM`      varchar(50)  NOT NULL COMMENT '포스_프로그램_버전_파일_명',
    `POS_PROG_VER_FILE_PATH` varchar(100) NOT NULL COMMENT '포스_프로그램_버전_파일_경로',
    `CREATOR`                   varchar(100) NOT NULL COMMENT '작성자',
    `CREATED_AT`                timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성시간',
    `UPDATER`                   varchar(100) NOT NULL COMMENT '수정자',
    `UPDATED_AT`                timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '변경시간',
    PRIMARY KEY (`POS_PROG_VER_PID`),
    INDEX mn_pos_prog_ver_idx (`CREATED_AT`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4