CREATE TABLE `MN_POS_KITPTR`
(
    `KITPTR_PID`          int(11)      NOT NULL AUTO_INCREMENT COMMENT '주방프린터_순번',
    `STORE_UNQCODE`       varchar(14)  NOT NULL COMMENT '매장_고유코드',
    `POS_NO`              varchar(20)  NOT NULL COMMENT '포스_번호',
    `FCHQ_CODE`           varchar(7)   NOT NULL COMMENT '본사_코드',
    `KITPTR_NO`           varchar(20)  NOT NULL COMMENT '주방프린터_번호',
    `KITPTR_NM`           varchar(50) COMMENT '주방프린터_명',
    `KITPTR_TYPE_VAL`     varchar(100) NOT NULL DEFAULT 'N' COMMENT '주방프린터_종류_값',
    `KITPTR_PORT_VAL`     varchar(100) NOT NULL DEFAULT 'N' COMMENT '주방프린터_포트_값',
    `KITPTR_SPD_VAL`      varchar(100) NOT NULL DEFAULT 'N' COMMENT '주방프린터_속도_값',
    `KITPTR_PRINT_CNT`    varchar(100) NOT NULL DEFAULT 1 COMMENT '주방프린터_인쇄_수',
    `KITPTR_TCP_IP_VAL`   varchar(100) COMMENT '주방프린터_TCP/IP_값',
    `KITPTR_TCP_PORT_VAL` varchar(100) COMMENT '주방프린터_TCP/PORT_값',
    `USE_AT`              varchar(1)   NOT NULL DEFAULT 'Y' COMMENT '사용_여부',
    `GOODS_CNT`           int(11)      NOT NULL DEFAULT 0 COMMENT '상품_수',
    `CREATOR`             varchar(100) NOT NULL COMMENT '생성자',
    `CREATED_AT`          timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성_시각',
    `UPDATER`             varchar(100) NOT NULL COMMENT '수정자',
    `UPDATED_AT`          timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정_시각',
    PRIMARY KEY (`KITPTR_PID`),
    INDEX mn_stm_kitptr_idx (`STORE_UNQCODE`, `CREATED_AT`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4