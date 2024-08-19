CREATE TABLE `MN_POS_PROG_VER_RECV_H`
(
    `POS_PROG_RECV_H_PID`  bigint       NOT NULL AUTO_INCREMENT COMMENT '포스_프로그램_수신_이력_순번',
    `POS_PROG_TARGET_PID`  bigint       NOT NULL COMMENT '포스_프로그램_대상_순번',
    `POS_PID`              bigint       NOT NULL COMMENT '포스_순번',
    `STORE_UNQCODE`        varchar(14)  NOT NULL COMMENT '매장_고유코드',
    `FCHQ_CODE`            varchar(7)   NOT NULL COMMENT '본사_코드',
    `FCHQ_NM`              varchar(50)  NOT NULL COMMENT '본사_명',
    `STORE_NM`             varchar(50)  NOT NULL COMMENT '매장_명',
    `POS_NO`               varchar(20)  NOT NULL COMMENT '포스_번호',
    `POS_PROG_VER_NO`      varchar(20)  NOT NULL COMMENT '포스_프로그램_버전_번호',
    `POS_PROG_VER_NM`      varchar(50)  NOT NULL COMMENT '포스_프로그램_버전_명',
    `PROG_KIND_CODE`       varchar(7)   NOT NULL COMMENT '프로그램_종류_코드',
    `POS_PROG_RCV_SE_CODE` varchar(1)   NOT NULL COMMENT '포스_프로그램_수신_구분_코드',
    `UPDATE_SE_CODE`       varchar(1)   NOT NULL COMMENT '업데이트_구분_코드',
    `POS_PROG_VER_FILE_NM` varchar(50)  NOT NULL COMMENT '포스_프로그램_버전_파일_명',
    `POS_PROG_REG_DT`      datetime     NOT NULL COMMENT '포스_프로그램_등록_일시',
    `SW_CRTF_NO`           varchar(20)  NOT NULL COMMENT 'SW_인증_번호',
    `HW_CRTF_NO`           varchar(20)  NOT NULL COMMENT 'HW_인증_번호',
    `POS_PROG_RCV_DT`      datetime     NOT NULL COMMENT '포스_프로그램_수신_일시',
    `POS_IP`               varchar(23)  NOT NULL COMMENT '포스_IP',
    `CREATOR`              varchar(100) NOT NULL COMMENT '작성자',
    `CREATED_AT`           timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성시간',
    `UPDATER`              varchar(100) NOT NULL COMMENT '수정자',
    `UPDATED_AT`           timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '변경시간',
    PRIMARY KEY (`POS_PROG_RECV_H_PID`),
    INDEX mn_pos_prog_recv_h_idx (`POS_PROG_TARGET_PID`, `POS_PID`, `STORE_UNQCODE`, `CREATED_AT`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4