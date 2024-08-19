CREATE TABLE `PM_MBLCPN_APPRO`
(
    `MBLCPN_APPRO_PID`   bigint       NOT NULL AUTO_INCREMENT COMMENT '쿠폰_승인_순번',
    `STORE_UNQCODE`   varchar(14)  NOT NULL COMMENT '매장_고유코드',
    `STORE_NM`        varchar(50)  NOT NULL COMMENT '매장_명',
    `SALES_DE`        int          NOT NULL COMMENT '영업_일자',
    `POS_NO`          varchar(20)  NOT NULL COMMENT '포스_번호',
    `RECPT_NO`        varchar(20)  NOT NULL COMMENT '영수_번호',
    `CPN_SE_CODE`     varchar(1)   NOT NULL COMMENT '쿠폰_구분_코드',
    `CPN_BARCODE_VAL` varchar(100) NOT NULL COMMENT '쿠폰_바코드_값',
    `APPRO_NO`        varchar(20)  NOT NULL COMMENT '승인_번호',
    `LOG_NO`          varchar(20)  NOT NULL COMMENT '로그_번호',
    `APPRO_PRICE`     int(11)      NOT NULL COMMENT '승인_금액',
    `APPRO_DE`        int          NOT NULL COMMENT '승인_일자',
    `APPRO_DT`        date         NOT NULL COMMENT '승인_일시',
    `CPN_PRICE`       int(11)      NOT NULL COMMENT '쿠폰_금액',
    `RMNNG_PRICE`     int(11)      NOT NULL COMMENT '잔여_금액',
    `CPN_USE_ENC_VAL` varchar(4000) COMMENT '쿠폰_사용_암호_값',
    `CREATOR`         varchar(100) NOT NULL COMMENT '작성자',
    `CREATED_AT`      timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성_시간',
    PRIMARY KEY (`MBLCPN_APPRO_PID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE `PM_MBLCPN_GOODS_APPRO`
(
    `MBLCPN_APPRO_G_PID`    bigint       NOT NULL AUTO_INCREMENT COMMENT '쿠폰_승인_순번',
    `STORE_UNQCODE`    varchar(14)  NOT NULL COMMENT '매장_고유코드',
    `STORE_NM`         varchar(50)  NOT NULL COMMENT '매장_명',
    `SALES_DE`         int          NOT NULL COMMENT '영업_일자',
    `POS_NO`           varchar(20)  NOT NULL COMMENT '포스_번호',
    `RECPT_NO`         varchar(20)  NOT NULL COMMENT '영수_번호',
    `CPN_SE_CODE`      varchar(1)   NOT NULL COMMENT '쿠폰_구분_코드',
    `CPN_BARCODE_VAL`  varchar(100) NOT NULL COMMENT '쿠폰_바코드_값',
    `APPRO_NO`         varchar(20)  NOT NULL COMMENT '승인_번호',
    `LOG_NO`           varchar(20)  NOT NULL COMMENT '로그_번호',
    `APPRO_PRICE`      int(11)      NOT NULL COMMENT '승인_금액',
    `APPRO_DE`         int          NOT NULL COMMENT '승인_일자',
    `APPRO_DT`         date         NOT NULL COMMENT '승인_일시',
    `GOODS_CODE`       varchar(7)   NOT NULL COMMENT '상품_코드',
    `GOODS_NM`         varchar(50)  NOT NULL COMMENT '상품_명',
    `SALES_CNT`        int(11)      NOT NULL COMMENT '판매_수',
    `GOODS_PRICE`      int(11)      NOT NULL COMMENT '상품_가격',
    `ACTL_SALES_PRICE` int(11)      NOT NULL COMMENT '실매출_금액',
    `CPN_USE_ENC_VAL`  varchar(4000) COMMENT '쿠폰_사용_암호_값',
    `CREATOR`          varchar(100) NOT NULL COMMENT '작성자',
    `CREATED_AT`       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성_시간',
    PRIMARY KEY (`MBLCPN_APPRO_G_PID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;