-- 가맹점 회원
CREATE TABLE `MN_STORE_MBR`
(
    `STORE_MBR_PID`     BIGINT       NOT NULL AUTO_INCREMENT COMMENT '매장_회원_순번',
    `MBR_CODE`          varchar(7)   NOT NULL COMMENT '회원_코드',
    `MBR_GRD_CODE`      varchar(7)   NOT NULL COMMENT '회원_등급_코드',
    `KO_MBR_NM`         varchar(50)  NOT NULL COMMENT '한글_회원_명',
    `EN_MBR_NM`         varchar(50) COMMENT '영어_회원_명',
    `STORE_UNQCODE`     varchar(14)  NOT NULL COMMENT '매장_고유코드',
    `FCHQ_NM`           varchar(50)  NOT NULL COMMENT '본사_명',
    `REG_STORE_NM`      varchar(50)  NOT NULL COMMENT '등록_매장_명',
    `MBR_CARDNO`        varchar(20) COMMENT '회원_카드_번호',
    `MBR_CARD_ISSU_CNT` int(11)      NOT NULL DEFAULT 0 COMMENT '회원_카드_발급 횟수',
    `GENDER`            varchar(1)   NOT NULL COMMENT '회원_성별',
    `CARD_USE_SE_CODE`  varchar(7)   NOT NULL DEFAULT "S" COMMENT '회원_카드_사용_구분',
    `BIRTH_DE`          int(11) COMMENT '회원_생년월일',
    `BIRTH_SE_CODE`     varchar(1) COMMENT '회원_생일_구분',
    `MBR_MTTL_AT`       varchar(1) COMMENT '회원_결혼_여부',
    `MBR_MTTL_DE`       int(11) COMMENT '회원_결혼_일자',
    `MBR_TELNO`         varchar(20) COMMENT '회원_전화번호',
    `MBR_CELNO`         varchar(20)  NOT NULL COMMENT '회원_핸드폰번호',
    `SHORT_NO_SE_CODE`  varchar(1)   NOT NULL COMMENT '단축번호_구분_코드',
    `SHORT_NO`          varchar(20) COMMENT '회원_단축_번호',
    `MBR_EMAIL`         varchar(100) COMMENT '회원_이메일',
    `MBR_ADRES`         varchar(256) COMMENT '회원_주소',
    `EMAIL_RCVD_AT`     varchar(1)   NOT NULL COMMENT '이메일_수신_여부',
    `SMS_RCVD_AT`       varchar(1)   NOT NULL COMMENT 'SMS_수신_여부',
    `DM_RCVD_AT`        varchar(1)   NOT NULL COMMENT 'DM_수신_여부',
    `USE_AT`            varchar(1)   NOT NULL COMMENT '사용_여부',
    `INST_STAFF_ID`     varchar(100) COMMENT '회원유치_사원_아이디',
    `INST_STAFF_NM`     varchar(50) COMMENT '회원유치_사원_명',
    `CSH_RECPT_NO`      varchar(20) COMMENT '현금_영수증_번호',
    `MBR_REFER_VAL`     varchar(100) COMMENT '회원_참조_값',
    `MBR_NOTE`          varchar(400) COMMENT '회원_비고',
    `MBR_JOIN_DE`       int(11)      NOT NULL COMMENT '회원_가입_일자',
    `ACM_SALES_CNT`     int(11)      NOT NULL DEFAULT 0 COMMENT '적립_매출_횟수',
    `ACM_SALES_PRICE`   int(11)      NOT NULL DEFAULT 0 COMMENT '적립_매출_금액',
    `FRST_VST_DE`       int(11) COMMENT '최초_방문_일자',
    `LAST_VST_DE`       int(11) COMMENT '최종_방문_일자',
    `CREATOR`           varchar(100) NOT NULL COMMENT '작성자',
    `CREATED_AT`        timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성일시',
    `UPDATER`           varchar(100) NOT NULL COMMENT '수정자',
    `UPDATED_AT`        timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
    PRIMARY KEY (`STORE_MBR_PID`),
    CONSTRAINT mn_store_mbr_uk UNIQUE (`MBR_CODE`, `MBR_CELNO`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
-- 회원 카드
CREATE TABLE `MN_MBR_CARD`
(
    `MBR_CARD_PID`     BIGINT       NOT NULL AUTO_INCREMENT COMMENT '회원_카드_순번',
    `MBR_CARD_H_PID`   int(11)      NOT NULL COMMENT '회원_카드_이력_순번',
    `MBR_CODE`         varchar(7)   NOT NULL COMMENT '회원_코드',
    `NEW_CARDNO`       varchar(20)  NOT NULL COMMENT '신규_카드_번호',
    `PREV_CARDNO`      varchar(20) COMMENT '이전_카드_번호',
    `CARD_STT_SE_CODE` varchar(1)   NOT NULL COMMENT '카드_상태_구분_코드',
    `CARD_ISN_SE_CODE` varchar(1)   NOT NULL COMMENT '카드_발급_구분_코드',
    `STORE_UNQCODE`    varchar(14)  NOT NULL COMMENT '매장_고유코드',
    `CARD_ISN_DE`      int(11)      NOT NULL COMMENT '카드_발급_일자',
    `CARD_ISN_NOTE`    varchar(400) COMMENT '카드_발급_비고',
    `CREATOR`          varchar(100) NOT NULL COMMENT '작성자',
    `CREATED_AT`       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성일시',
    `UPDATER`          varchar(100) NOT NULL COMMENT '수정자',
    `UPDATED_AT`       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
    PRIMARY KEY (`MBR_CARD_PID`),
    CONSTRAINT mn_mbr_card_uk UNIQUE (`NEW_CARDNO`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

-- 가맹점 회원 카드 히스토리
CREATE TABLE `MN_MBR_CARD_H`
(
    `MBR_CARD_H_PID`   BIGINT       NOT NULL AUTO_INCREMENT COMMENT '회원_카드_이력_순번',
    `MBR_CODE`         varchar(7)   NOT NULL COMMENT '회원_코드',
    `NEW_CARDNO`       varchar(20)  NOT NULL COMMENT '신규_카드_번호',
    `PREV_CARDNO`      varchar(20) COMMENT '이전_카드_번호',
    `CARD_STT_SE_CODE` varchar(1)   NOT NULL COMMENT '카드_상태_구분_코드',
    `CARD_ISN_SE_CODE` varchar(1)   NOT NULL COMMENT '카드_발급_구분_코드',
    `STORE_UNQCODE`    varchar(14)  NOT NULL COMMENT '매장_고유코드',
    `CARD_ISN_DE`      int(11)      NOT NULL COMMENT '카드_발급_일자',
    `CARD_ISN_NOTE`    varchar(400) NOT NULL COMMENT '카드_발급_비고',
    `CREATOR`          varchar(100) NOT NULL COMMENT '작성자',
    `CREATED_AT`       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성일시',
    `UPDATER`          varchar(100) NOT NULL COMMENT '수정자',
    `UPDATED_AT`       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
    PRIMARY KEY (`MBR_CARD_H_PID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

-- 가맹점 회원 등급
CREATE TABLE `MN_MBR_GRADE`
(
    `GRD_PID`          BIGINT       NOT NULL AUTO_INCREMENT COMMENT '등급_순번',
    `GRD_CODE`         varchar(7)   NOT NULL COMMENT '등급_코드',
    `GRD_NM`           varchar(50)  NOT NULL COMMENT '등급_명',
    `DEF_AT`           varchar(1)   NOT NULL COMMENT '기본_여부',
    `STORE_UNQCODE`    varchar(14)  NOT NULL COMMENT '매장_고유코드',
    `DSC_RT`           float        NOT NULL COMMENT '할인_율',
    `DSC_LMT_WAGE`     int(11)      NOT NULL COMMENT '할인_한도_금액',
    `SUBS_PT`          int(11)      NOT NULL COMMENT '신규가입_포인트',
    `MIN_USE_PT`       int(11)      NOT NULL COMMENT '최소_사용_포인트',
    `MAX_USE_PT`       int(11)      NOT NULL COMMENT '최대_사용_포인트',
    `FRS_PRC_PT`       int(11)      NOT NULL COMMENT '첫구매_적립_포인트',
    `DSC_ACML_AT`      varchar(1)   NOT NULL COMMENT '할인시_적립_여부',
    `PT_ACML_AT`       varchar(1)   NOT NULL COMMENT '포인트사용_적립_여부',
    `ACM_SE_CODE`      varchar(1)   NOT NULL COMMENT '포인트적립_구분_코드',
    `ANVR_ACM_SE_CODE` varchar(1)   NOT NULL COMMENT '기념일_적립_구분_코드',
    `ANVR_ACM_RT`      float        NOT NULL DEFAULT 0 COMMENT '기념일_적립_율',
    `GRD_CVRG_SE_CODE` varchar(1)   NOT NULL COMMENT '등급_적용_구분_코드',
    `DAY_ADJS_CNT`     int(11)      NOT NULL COMMENT '일_조정_횟수',
    `ADJS_MAX_WEGE`    int(11)      NOT NULL COMMENT '조정_상한_금액',
    `CASH_ACM_RT`      float        NOT NULL COMMENT '현금_적립_율',
    `CRDT_CARD_ACM_RT` float        NOT NULL COMMENT '신용카드_적립_율',
    `MTKT_ACM_RT`      float        NOT NULL COMMENT '식권_적립_율',
    `TRM_ACM_RT`       float        NOT NULL COMMENT '외상_적립_율',
    `COP_ACM_RT`       float        NOT NULL COMMENT '쿠폰_적립_율',
    `CSH_RECPT_ACM_RT` float        NOT NULL COMMENT '현금영수증_적립_율',
    `GFTVC_ACM_RT`     float        NOT NULL COMMENT '상품권_적립_율',
    `AFL_CRD_ACM_RT`   float        NOT NULL COMMENT '제휴카드_적립_율',
    `RF_ACM_RT`        float        NOT NULL COMMENT 'RF_적립_율',
    `CSHBE_ACM_RT`     float        NOT NULL COMMENT '캐시비_적립_율',
    `CREATOR`          varchar(100) NOT NULL COMMENT '작성자',
    `CREATED_AT`       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성일시',
    `UPDATER`          varchar(100) NOT NULL COMMENT '수정자',
    `UPDATED_AT`       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
    CONSTRAINT mn_mbr_grade_uk UNIQUE (`GRD_CODE`),
    PRIMARY KEY (`GRD_PID`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

-- 회원 포인트 변경 이력
CREATE TABLE `MN_MBR_POINT_CHG_H`
(
    `MBR_POINT_CHG_PID`    BIGINT       NOT NULL AUTO_INCREMENT COMMENT '회원_포인트_변경_순번',
    `STORE_MBR_PID`        BIGINT       NOT NULL COMMENT '매장_회원_순번',
    `MBR_CODE`             varchar(7)   NOT NULL COMMENT '회원_코드',
    `KO_MBR_NM`            varchar(50)  NOT NULL COMMENT '한글_회원_명',
    `STORE_UNQCODE`        varchar(14)  NOT NULL COMMENT '매장_고유코드',
    `CHG_PT_STORE_UNQCODE` varchar(14)  NOT NULL COMMENT '포인트_변경_매장_고유코드',
    `CHG_PT_DE`            int(11)      NOT NULL COMMENT '포인트_변경_일자',
    `PREV_HOLD_PT`         int(11)      NOT NULL DEFAULT 0 COMMENT '이전_보유_포인트',
    `NEW_PT`               int(11)      NOT NULL DEFAULT 0 COMMENT '신규_포인트',
    `TRN_PT`               int(11)      NOT NULL DEFAULT 0 COMMENT '이관_포인트',
    `AVLBL_PT`             int(11)      NOT NULL DEFAULT 0 COMMENT '가용_포인트',
    `ADJS_PT`              int(11)      NOT NULL DEFAULT 0 COMMENT '조정_포인트',
    `ACM_PT`               int(11)      NOT NULL DEFAULT 0 COMMENT '적립_포인트',
    `ACM_CANCEL_PT`        int(11)      NOT NULL DEFAULT 0 COMMENT '적립취소_포인트',
    `USE_PT`               int(11)      NOT NULL DEFAULT 0 COMMENT '사용_포인트',
    `USE_CANCEL_PT`        int(11)      NOT NULL DEFAULT 0 COMMENT '사용취소_포인트',
    `POINT_NOTE`           varchar(400) COMMENT '비고',
    `POINT_ENC_VAL`        varchar(4000) COMMENT '포인트_이력_암호_값',
    `CREATOR`              varchar(100) NOT NULL COMMENT '작성자',
    `CREATED_AT`           timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성일시',
    `UPDATER`              varchar(100) NOT NULL COMMENT '수정자',
    `UPDATED_AT`           timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
    PRIMARY KEY (`MBR_POINT_CHG_PID`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

-- 회원 포인트
CREATE TABLE `MN_MBR_POINT`
(
    `MBR_POINT_PID` BIGINT       NOT NULL AUTO_INCREMENT COMMENT '회원_포인트_순번',
    `STORE_MBR_PID` BIGINT       NOT NULL COMMENT '매장_회원_순번',
    `MBR_CODE`      varchar(7)   NOT NULL COMMENT '회원_코드',
    `KO_MBR_NM`     varchar(50)  NOT NULL COMMENT '한글_회원_명',
    `STORE_UNQCODE` varchar(14)  NOT NULL COMMENT '매장_고유코드',
    `ACM_PT`        int(11)      NOT NULL DEFAULT 0 COMMENT '적립_포인트',
    `USE_PT`        int(11)      NOT NULL DEFAULT 0 COMMENT '사용_포인트',
    `ADJS_PT`       int(11)      NOT NULL DEFAULT 0 COMMENT '조정_포인트',
    `AVLBL_PT`      int(11)      NOT NULL DEFAULT 0 COMMENT '가용_포인트',
    `POINT_ENC_VAL` varchar(4000) COMMENT '포인트_암호_값',
    `CREATOR`       varchar(100) NOT NULL COMMENT '작성자',
    `CREATED_AT`    timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성일시',
    `UPDATER`       varchar(100) NOT NULL COMMENT '수정자',
    `UPDATED_AT`    timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
    PRIMARY KEY (`MBR_POINT_PID`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

-- 회원 포인트 이관
CREATE TABLE `MN_MBR_POINT_TRN`
(
    `MBR_POINT_TRN_PID`     BIGINT       NOT NULL AUTO_INCREMENT COMMENT '회원_포인트_이관_순번',
    `STORE_UNQCODE`         varchar(14)  NOT NULL COMMENT '매장_고유코드',
    `TRN_PT`                int(11)      NOT NULL COMMENT '이관_포인트',
    `SEND_STORE_MBR_PID`    bigint       NOT NULL COMMENT '보내는_매장_회원_순번',
    `SEND_MBR_CODE`         varchar(7)   NOT NULL COMMENT '보내는_회원_코드',
    `SEND_MBR_NM`           varchar(50)  NOT NULL COMMENT '보내는_회원_명',
    `RECEIVE_STORE_MBR_PID` bigint       NOT NULL COMMENT '받는_매장_회원_순번',
    `RECEIVE_MBR_CODE`      varchar(7)   NOT NULL COMMENT '받는_회원_코드',
    `RECEIVE_MBR_NM`        varchar(50)  NOT NULL COMMENT '받는_회원_명',
    `POINT_ENC_VAL`         varchar(4000) COMMENT '포인트_이관_암호_값',
    `CREATOR`               varchar(100) NOT NULL COMMENT '작성자',
    `CREATED_AT`            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성일시',
    `UPDATER`               varchar(100) NOT NULL COMMENT '수정자',
    `UPDATED_AT`            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
    PRIMARY KEY (`MBR_POINT_TRN_PID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

-- 회원 포인트 Update Trigger
DELIMITER $$
CREATE TRIGGER MN_MBR_POINT_CHG_H_INSERT_TRIGGER
    AFTER INSERT
    ON MN_MBR_POINT_CHG_H
    FOR EACH ROW
BEGIN
    UPDATE MN_MBR_POINT
    SET STORE_MBR_PID = NEW.STORE_MBR_PID,
        KO_MBR_NM     = NEW.KO_MBR_NM,
        STORE_UNQCODE = NEW.STORE_UNQCODE,
        ACM_PT        = ACM_PT + NEW.ACM_PT,
        USE_PT        = USE_PT + NEW.USE_PT,
        ADJS_PT       = ADJS_PT + NEW.ADJS_PT,
        AVLBL_PT      = AVLBL_PT + NEW.PREV_HOLD_PT + NEW.NEW_PT + NEW.TRN_PT + NEW.ADJS_PT +
                        NEW.ACM_PT + NEW.ACM_CANCEL_PT + NEW.USE_PT + NEW.USE_CANCEL_PT
    WHERE STORE_MBR_PID = NEW.STORE_MBR_PID;
END $$
DELIMITER ;MN_MBR_POINT_CHG_H

-- 회원 포인트 Delete Trigger
DELIMITER $$
CREATE TRIGGER MN_MBR_POINT_CHG_H_DELETE_TRIGGER
    AFTER DELETE
    ON MN_MBR_POINT_CHG_H
    FOR EACH ROW
BEGIN
    UPDATE MN_MBR_POINT
    SET STORE_MBR_PID = OLD.STORE_MBR_PID,
        KO_MBR_NM     = OLD.KO_MBR_NM,
        STORE_UNQCODE = OLD.STORE_UNQCODE,
        ACM_PT        = ACM_PT + OLD.ACM_PT * (-1),
        USE_PT        = USE_PT + OLD.USE_PT * (-1),
        ADJS_PT       = ADJS_PT + OLD.ADJS_PT * (-1),
        AVLBL_PT      = AVLBL_PT +
                        (OLD.PREV_HOLD_PT + OLD.NEW_PT + OLD.TRN_PT + OLD.ADJS_PT + OLD.ACM_PT +
                         OLD.ACM_CANCEL_PT + OLD.USE_PT + OLD.USE_CANCEL_PT) * (-1)
    WHERE STORE_MBR_PID = OLD.STORE_MBR_PID;
END $$
DELIMITER ;

