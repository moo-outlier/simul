CREATE TABLE `MN_CPN` (
    `CPN_PID` int NOT NULL AUTO_INCREMENT COMMENT '쿠폰_순번',
    `STORE_UNQCODE` varchar(14) NOT NULL  COMMENT '매장_고유코드',
    `CTG_CODE` varchar(7) NOT NULL  COMMENT '분류_코드',
    `CPN_CODE` varchar(7) NOT NULL DEFAULT 0 COMMENT '쿠폰_코드',
    `CPN_NM` varchar(1) NOT NULL  COMMENT '쿠폰_명',
    `DSC_SE_CODE` varchar(1) NOT NULL  COMMENT '할인_구분코드',
    `DSC_RT` float NOT NULL DEFAULT 0 COMMENT '할인_율',
    `DSC_PRICE` int NOT NULL DEFAULT 0 COMMENT '할인_금액',
    `TARGET_CNT_SE_CODE` varchar(1) NOT NULL  COMMENT '대상_수량_구분코드',
    `USE_AT` varchar(1) NOT NULL  COMMENT '사용_여부',
    `START_EXPIRE_DE` int NOT NULL  COMMENT '시작_유효_기간',
    `END_EXPIRE_DE` int NOT NULL  COMMENT '종료_유효_기간',
    `CREATOR` varchar(100) NOT NULL  COMMENT '작성자',
    `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성시간',
    `UPDATER` varchar(100) NOT NULL  COMMENT '수정자',
    `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '변경시간'
    , PRIMARY KEY (`CPN_PID`)
    , CONSTRAINT `fk_mn_payment_method_ctg_mn_cpn_1` FOREIGN KEY (`CTG_CODE`) REFERENCES `MN_PAYMENT_METHOD_CTG` (`CTG_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4