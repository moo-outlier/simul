CREATE TABLE `MN_STORE_TCHKEY_GRP`
(
    `TCHKEY_GRP_PID`     bigint       NOT NULL AUTO_INCREMENT COMMENT '터치키_그룹_순번',
    `STORE_UNQCODE`      varchar(14)   NOT NULL COMMENT '매장_고유코드',
    `SUB_SE_CODE`        varchar(1)   NOT NULL COMMENT '서브_구분_코드',
    `TCHKEY_GRP_CODE`    varchar(7)   NOT NULL COMMENT '터치키_그룹_코드',
    `TCHKEY_GRP_PAGE_NO` varchar(20)  NOT NULL COMMENT '터치키_그룹_페이지_번호',
    `TCHKEY_GRP_IMG_URL` varchar(256) COMMENT '터치키_그룹_이미지_URL',
    `TCHKEY_GRP_NM`      varchar(50)  NOT NULL COMMENT '터치키_그룹_명',
    `TCHKEY_GRP_X_COOR`  float        NOT NULL COMMENT '터치키_그룹_x_좌표',
    `TCHKEY_GRP_Y_COOR`  float        NOT NULL COMMENT '터치키_그룹_y_좌표',
    `CREATOR`            varchar(100) NOT NULL COMMENT '작성자',
    `CREATED_AT`         timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성시간',
    `UPDATER`            varchar(100) NOT NULL COMMENT '수정자',
    `UPDATED_AT`         timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '변경시간',
    PRIMARY KEY (`TCHKEY_GRP_PID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE `MN_STORE_TCHKEY`
(
    `TCHKEY_PID`      bigint       NOT NULL AUTO_INCREMENT COMMENT '터치키_순번',
    `STORE_UNQCODE`   varchar(14)   NOT NULL COMMENT '매장_고유코드',
    `SUB_SE_CODE`     varchar(1)   NOT NULL COMMENT '서브_구분_코드',
    `TCHKEY_GRP_CODE` varchar(7)   NOT NULL COMMENT '터치키_그룹_코드',
    `TCHKEY_CODE`     varchar(7)   NOT NULL COMMENT '터치키_코드',
    `TCHKEY_PAGE_NO`  varchar(20)  NOT NULL COMMENT '터치키_페이지_번호',
    `GOODS_CODE`      varchar(7)   NOT NULL COMMENT '상품_코드',
    `GOODS_NM`        varchar(50)  NOT NULL COMMENT '상품_명',
    `GOODS_PRICE`     int(11)      NOT NULL COMMENT '상품_가격',
    `TCHKEY_X_COOR`   float        NOT NULL COMMENT '터치키_x_좌표',
    `TCHKEY_Y_COOR`   float        NOT NULL COMMENT '터치키_y_좌표',
    `CREATOR`         varchar(100) NOT NULL COMMENT '작성자',
    `CREATED_AT`      timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성시간',
    `UPDATER`         varchar(100) NOT NULL COMMENT '수정자',
    `UPDATED_AT`      timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '변경시간',
    PRIMARY KEY (`TCHKEY_PID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


