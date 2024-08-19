CREATE TABLE `MN_DSC_GOODS` (
    `DSC_GOODS_PID` int NOT NULL AUTO_INCREMENT COMMENT '할인_상품_순번',
    `STORE_UNQCODE` varchar(14) NOT NULL COMMENT '매장_고유코드',
    `PAYMENT_METHOD_CODE` varchar(7) NOT NULL COMMENT '결제_수단_코드',
    `PAYMENT_METHOD_SE_CODE` varchar(1) NOT NULL COMMENT '결제_수단_구분코드',
    `STORE_GCODE` varchar(50) NOT NULL COMMENT '매장_상품_코드',
    `GOODS_NM` varchar(50) NOT NULL COMMENT '상품_명',
    `HIGH_CTG_CODE` varchar(7) NOT NULL COMMENT '대_분류_코드',
    `HIGH_CTG_NM` varchar(50) NOT NULL COMMENT '대_분류_명',
    `MID_CTG_CODE` varchar(7) COMMENT '중_분류_코드',
    `MID_CTG_NM` varchar(50) COMMENT '중_분류_명',
    `LOW_CTG_CODE` varchar(7) COMMENT '소_분류_코드',
    `LOW_CTG_NM` varchar(50) COMMENT '소_분류_명',
    `PRICE` int NOT NULL COMMENT '정상_가격',
    `ARRAY_SEQ` int COMMENT '배열_순서',
    `USE_AT` varchar(1) NOT NULL  COMMENT '사용_여부',
    `CREATOR` varchar(100) NOT NULL  COMMENT '작성자',
    `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성시간',
    `UPDATER` varchar(100) NOT NULL  COMMENT '수정자',
    `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '변경시간'
    , PRIMARY KEY (`DSC_GOODS_PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4