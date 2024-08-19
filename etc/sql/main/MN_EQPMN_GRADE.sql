CREATE TABLE `MN_EQPMN_GRADE` (
    `EQPMN_GRADE_PID` int NOT NULL AUTO_INCREMENT COMMENT '장비_등급_일련번호',
    `EQPMN_CODE` varchar(7) NOT NULL  COMMENT '장비_코드',
    `GRD_CODE` varchar(7) NOT NULL  COMMENT '등급_코드',
    `PRICE` int(11) NOT NULL  COMMENT '가격',
    `CREATOR` varchar(100) NOT NULL  COMMENT '생성자',
    `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성_일시',
    `UPDATER` varchar(100) NOT NULL  COMMENT '수정자',
    `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정_일시'
    , PRIMARY KEY (`EQPMN_GRADE_PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4