CREATE TABLE `MN_EQPMN` (
    `EQPMN_PID` int NOT NULL AUTO_INCREMENT COMMENT '장비_일련번호',
    `SORT_SEQ` int(11) NOT NULL  COMMENT '정렬_순서',
    `EQPMN_CODE` varchar(7) NOT NULL  COMMENT '장비_코드',
    `EQPMN_NM` varchar(50) NOT NULL  COMMENT '장비_명',
    `EQPMN_CTG_CODE` varchar(7) NOT NULL  COMMENT '장비_분류_코드',
    `MNFCTUR_CORP_CODE` varchar(7)   COMMENT '제조_업체_코드',
    `SALE_AT` varchar(1) NOT NULL  COMMENT '판매_여부',
    `AGENCY_DISPLAY_AT` varchar(1)   COMMENT '대리점_display_여부',
    `EQPMN_IMG_URL` varchar(256)   COMMENT '장비_이미지_URL',
    `EQPMN_NOTE` varchar(400)   COMMENT '장비_비고',
    `PRICE` int(11) NOT NULL DEFAULT 0 COMMENT '가격',
    `CREATOR` varchar(100) NOT NULL  COMMENT '생성자',
    `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성_일시',
    `UPDATER` varchar(100) NOT NULL  COMMENT '수정자',
    `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정_일시'
    , PRIMARY KEY (`EQPMN_PID`)
    , CONSTRAINT mn_eqpmn_uk UNIQUE (`EQPMN_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;