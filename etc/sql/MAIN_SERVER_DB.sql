create table MN_AGENCY_INSTL
(
    AGENCY_INSTL_PID    bigint auto_increment comment '업체_설치_순번'
        primary key,
    STORE_UNQCODE       varchar(12)                          not null comment '매장_고유코드',
    FCHQ_CODE           varchar(5)                           not null comment '본사_코드',
    FCHQ_NM             varchar(50)                          not null comment '본사_명',
    STORE_NM            varchar(50)                          not null comment '매장_명',
    POS_NO              varchar(50)                          not null comment '포스_번호',
    POS_PROG_VER_NO     varchar(20)                          null comment '포스_프로그램_버전_번호',
    MGMT_CORP_CODE      varchar(12)                          null comment '관리_업체_코드',
    MGMT_CORP_NM        varchar(50)                          not null comment '관리_업체_명',
    INSTL_CORP_CODE     varchar(12)                          null comment '설치_업체_코드',
    INSTL_CORP_NM       varchar(50)                          null comment '설치_업체_업체명',
    INSTL_RQST_DT       datetime                             null comment '설치_의뢰_일자',
    INSTL_RQST_STAFF_NM varchar(50)                          null comment '설치_의뢰_사원_명',
    INSTL_RQST_STAFF_ID varchar(100)                         null comment '설치_의뢰_사원_ID',
    init_confrm_dt      datetime                             null comment '최초_인증_일시',
    INSTL_DT            datetime                             null comment '설치_일자',
    INSTL_STAFF_NM      varchar(50)                          null comment '설치_사원_명',
    INSTL_STAFF_ID      varchar(100)                         null comment '설치_사원_ID',
    INSTL_STT_CODE      varchar(7)                           null comment '설치_상태_코드',
    INSTL_CODE          varchar(7)                           null comment '설치_코드',
    INSTL_NOTE          varchar(400)                         null comment '설치_비고',
    INSTL_ODR_CNT       int        default 0                 not null comment '설치_차_수',
    LOCAL_POS_AT        varchar(1)                           not null comment '로컬_POS_여부',
    STT_SE_CODE         varchar(1) default '1'               not null comment '상태_구분_코드',
    CREATOR             varchar(100)                         not null comment '작성자',
    CREATED_AT          timestamp  default CURRENT_TIMESTAMP not null comment '생성시간',
    UPDATER             varchar(100)                         not null comment '수정자',
    UPDATED_AT          timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '변경시간',
    USE_AT              varchar(1) default 'Y'               null
)
    charset = utf8mb4;

create index idx_mn_agency_instl_1
    on MN_AGENCY_INSTL (STORE_UNQCODE);

create index idx_mn_agency_instl_2
    on MN_AGENCY_INSTL (MGMT_CORP_CODE);

create table MN_AGENCY_INSTL_H
(
    AGENCY_INSTL_H_PID  bigint auto_increment comment '업체_설치_이력_순번'
        primary key,
    AGENCY_INSTL_PID    bigint                              not null comment '업체_설치_순번',
    POS_INSTL_CNT       int                                 null comment '포스_설치_수',
    MGMT_CORP_CODE      varchar(12)                         null comment '관리_업체_코드',
    MGMT_CORP_NM        varchar(50)                         not null comment '관리_업체_명',
    INSTL_CORP_CODE     varchar(12)                         null comment '설치_업체_코드',
    INSTL_CORP_NM       varchar(50)                         null comment '설치_업체_업체명',
    INSTL_RQST_DT       datetime                            null comment '설치_의뢰_일자',
    INSTL_RQST_STAFF_NM varchar(50)                         null comment '설치_의뢰_사원_명',
    INSTL_RQST_STAFF_ID varchar(100)                        null comment '설치_의뢰_사원_ID',
    INSTL_DT            datetime                            null comment '설치_일자',
    INSTL_STAFF_NM      varchar(50)                         null comment '설치_사원_명',
    INSTL_STAFF_ID      varchar(100)                        null comment '설치_사원_ID',
    INSTL_STT_CODE      varchar(7)                          null comment '설치_상태_코드',
    INSTL_CODE          varchar(7)                          null comment '설치_코드',
    INSTL_NOTE          varchar(400)                        null comment '설치_비고',
    CREATOR             varchar(100)                        not null comment '작성자',
    CREATED_AT          timestamp default CURRENT_TIMESTAMP not null comment '생성시간',
    UPDATER             varchar(100)                        not null comment '수정자',
    UPDATED_AT          timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '변경시간',
    constraint fk_mn_agency_instl_h_mn_agency_instl_1
        foreign key (AGENCY_INSTL_PID) references MN_AGENCY_INSTL (AGENCY_INSTL_PID)
)
    charset = utf8mb4;

create index idx_mn_agency_instl_h_1
    on MN_AGENCY_INSTL_H (AGENCY_INSTL_PID);

create table MN_AGENCY_M
(
    POS_CORP_PID           bigint auto_increment comment '포스_업체_순번'
        primary key,
    DSTRB_PID              bigint                               null comment '총판_순번',
    DSTRB_CODE             varchar(7)                           not null comment '총판_코드',
    AGENCY_UNQCODE         varchar(12)                          not null comment '대리점_고유코드',
    VAN_CORP_CODE          varchar(7)                           null comment '밴사_코드',
    CORP_SE_CODE           varchar(1)                           not null comment '업체_구분_코드',
    SBSDR_SE_CODE          varchar(1)                           not null comment '자사_구분_코드',
    AGENCY_NM              varchar(50)                          not null comment '대리점_명',
    REP_NM                 varchar(50)                          null comment '대표자_명',
    AGENCY_CORPNO          varchar(10)                          null comment '대리점_사업자번호',
    AGENCY_COMP_NM         varchar(50)                          null comment '대표자_상호_명',
    AGENCY_TYPE_NM         varchar(50)                          null comment '대표자_업태_명',
    AGENCY_TELNO           varchar(20)                          not null comment '대표자_전화번호',
    AGENCY_CELNO           varchar(20)                          not null comment '대표자_휴대폰번호',
    AGENCY_FAXNO           varchar(20)                          null comment '대표자_팩스번호',
    postno                 varchar(5)                           null comment '우편번호',
    roadnm_adres           varchar(100)                         null comment '도로명_주소',
    detail_adres_scr       varchar(256)                         null comment '상세_주소_SECRET',
    INSTL_PSBLT_AT         varchar(1) default 'N'               not null comment '설치_가능_여부',
    USE_AT                 varchar(1)                           not null comment '사용_여부',
    EDCTN_AT               varchar(1) default 'N'               not null comment '교육_여부',
    MNTHL_CRTF_AT          varchar(1) default 'N'               null comment '월_인증_여부',
    ASP_MNTHL_CRTF_CNT     int                                  null comment 'ASP_월_인증_수량',
    ASP_MNTHL_CRTF_PRICE   int                                  null comment 'ASP_월_인증_금액',
    LOCAL_MNTHL_CRTF_CNT   int                                  null comment 'LOCAL_월_인증_수량',
    LOCAL_MNTHL_CRTF_PRICE int                                  null comment 'LOCAL_월_인증_금액',
    AGENCY_NOTE            varchar(400)                         null comment '대리점_비고',
    CREATOR                varchar(100)                         not null comment '작성자',
    CREATED_AT             timestamp  default CURRENT_TIMESTAMP not null comment '생성시간',
    UPDATER                varchar(100)                         not null comment '수정자',
    UPDATED_AT             timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '변경시간'
)
    charset = utf8mb4;

create index idx_mn_agency_m_1
    on MN_AGENCY_M (DSTRB_CODE);

create index idx_mn_agency_m_2
    on MN_AGENCY_M (AGENCY_UNQCODE);

create table MN_AGENCY_TRNSF
(
    AGENCY_TRNSF_PID       bigint auto_increment comment '업체_설치_순번'
        primary key,
    STORE_UNQCODE          varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE              varchar(5)                          not null comment '본사_코드',
    FCHQ_NM                varchar(50)                         not null comment '본사_명',
    STORE_NM               varchar(50)                         not null comment '매장_명',
    STT_CODE               varchar(7)                          not null comment '진행_상태_코드',
    FROM_TRNSF_AGENCY_CODE varchar(12)                         not null comment '이출_대리점_코드',
    FROM_TRNSF_AGENCY_NM   varchar(50)                         not null comment '이출_대리점_명',
    FROM_TRNSF_REGI_DT     datetime                            not null comment '이출_신청_일시',
    FROM_TRNSF_STAFF_NM    varchar(50)                         not null comment '이출_신청_사원_명',
    TRNSF_DSTRB_CODE       varchar(7)                          not null comment '이관_총판_업체_코드',
    TRNSF_DSTRB_NM         varchar(50)                         not null comment '이관_총판_업체_명',
    TRNSF_CHCK_DT          datetime                            null comment '이관_확인_일시',
    TRNSF_CHCK_STAFF_NM    varchar(50)                         null comment '이관_확인_사원_명',
    TO_TRNSF_AGENCY_CODE   varchar(12)                         not null comment '이출_대리점_명',
    TO_TRNSF_AGENCY_NM     varchar(50)                         not null comment '이입_대리점_명',
    TO_TRNSF_REGI_DT       datetime                            null comment '이입_확인_일시',
    TO_TRNSF_STAFF_NM      varchar(50)                         null comment '이입_확인_사원_명',
    TRNSF_CANCEL_DT        datetime                            null comment '취소_일시',
    TRNSF_CANCEL_STAFF_NM  varchar(50)                         null comment '취소_사원_명',
    CREATOR                varchar(100)                        not null comment '작성자',
    CREATED_AT             timestamp default CURRENT_TIMESTAMP not null comment '생성시간',
    UPDATER                varchar(100)                        not null comment '수정자',
    UPDATED_AT             timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '변경시간'
)
    charset = utf8mb4;

create index idx_mn_agency_trnsf_1
    on MN_AGENCY_TRNSF (STORE_UNQCODE);

create table MN_AGENCY_TRNSF_H
(
    AGENCY_TRNSF_H_PID     bigint auto_increment comment '업체_설치_이력_순번'
        primary key,
    AGENCY_TRNSF_PID       bigint                              not null comment '업체_설치_순번',
    STT_CODE               varchar(7)                          not null comment '진행_상태_코드',
    FROM_TRNSF_AGENCY_CODE varchar(12)                         null comment '이출_대리점_코드',
    FROM_TRNSF_AGENCY_NM   varchar(50)                         null comment '이출_대리점_명',
    FROM_TRNSF_REGI_DT     datetime                            null comment '이출_신청_일시',
    FROM_TRNSF_STAFF_NM    varchar(50)                         null comment '이출_신청_사원_명',
    TRNSF_DSTRB_CODE       varchar(7)                          null comment '이관_총판_업체_코드',
    TRNSF_DSTRB_NM         varchar(50)                         null comment '이관_총판_업체_명',
    TRNSF_CHCK_DT          datetime                            null comment '이관_확인_일시',
    TRNSF_CHCK_STAFF_NM    varchar(50)                         null comment '이관_확인_사원_명',
    TO_TRNSF_AGENCY_CODE   varchar(12)                         null comment '이입_대리점_코드',
    TO_TRNSF_AGENCY_NM     varchar(50)                         null comment '이입_대리점_명',
    TO_TRNSF_REGI_DT       datetime                            null comment '이입_확인_일시',
    TO_TRNSF_STAFF_NM      varchar(50)                         null comment '이입_확인_사원_명',
    TRNSF_CANCEL_DT        datetime                            null comment '취소_일시',
    TRNSF_CANCEL_STAFF_NM  varchar(50)                         null comment '취소_사원_명',
    CREATOR                varchar(100)                        not null comment '작성자',
    CREATED_AT             timestamp default CURRENT_TIMESTAMP not null comment '생성시간',
    UPDATER                varchar(100)                        not null comment '수정자',
    UPDATED_AT             timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '변경시간',
    constraint fk_mn_agency_trnsf_h_mn_agency_trnsf_1
        foreign key (AGENCY_TRNSF_PID) references MN_AGENCY_TRNSF (AGENCY_TRNSF_PID)
)
    charset = utf8mb4;

create index idx_mn_agency_trnsf_h_1
    on MN_AGENCY_TRNSF_H (AGENCY_TRNSF_PID);

create table MN_CPN
(
    CPN_PID            int auto_increment comment '쿠폰_순번'
        primary key,
    STORE_UNQCODE      varchar(12)                         not null comment '매장_고유코드',
    CTG_CODE           varchar(3)                          not null comment '분류_코드',
    CPN_CODE           varchar(3)                          not null comment '쿠폰_코드',
    CPN_NM             varchar(50)                         not null comment '쿠폰_명',
    DSC_SE_CODE        varchar(1)                          not null comment '할인_구분_코드',
    DSC_RT             float     default 0                 not null comment '할인_율',
    DSC_PRICE          int       default 0                 not null comment '할인_금액',
    TARGET_CNT_SE_CODE varchar(1)                          not null comment '대상_수량_구분코드',
    USE_AT             varchar(1)                          not null comment '사용_여부',
    START_EXPIRE_DE    int                                 null comment '시작_유효_기간',
    END_EXPIRE_DE      int                                 null comment '종료_유효_기간',
    CREATOR            varchar(100)                        not null comment '작성자',
    CREATED_AT         timestamp default CURRENT_TIMESTAMP not null comment '생성시간',
    UPDATER            varchar(100)                        not null comment '수정자',
    UPDATED_AT         timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '변경시간',
    constraint mn_dsc_cpn_uk
        unique (STORE_UNQCODE, CPN_CODE)
)
    charset = utf8mb4;

create table MN_DSC_GOODS
(
    DSC_GOODS_PID           int auto_increment comment '할인_상품_순번'
        primary key,
    STORE_UNQCODE           varchar(12)                         not null comment '매장_고유코드',
    PAYMENT_METHOD_SE_CODE  varchar(1)                          not null comment '결제_수단_구분코드',
    PAYMENT_METHOD_CTG_CODE varchar(3)                          null comment '결제_수단_분류_코드',
    PAYMENT_METHOD_CODE     varchar(4)                          not null comment '결제_수단_코드',
    STORE_GCODE             varchar(26)                         not null comment '매장_상품_코드',
    ARRAY_SEQ               int                                 null comment '배열_순서',
    CREATOR                 varchar(100)                        not null comment '작성자',
    CREATED_AT              timestamp default CURRENT_TIMESTAMP not null comment '생성시간',
    UPDATER                 varchar(100)                        not null comment '수정자',
    UPDATED_AT              timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '변경시간',
    constraint mn_dsc_goods_uk
        unique (STORE_UNQCODE, PAYMENT_METHOD_SE_CODE, PAYMENT_METHOD_CODE, STORE_GCODE)
)
    charset = utf8mb4;

create table MN_DSTRB_M
(
    DSTRB_PID              bigint auto_increment comment '총판_순번'
        primary key,
    DSTRB_CODE             varchar(5)                           not null comment '총판_코드',
    VAN_CORP_CODE          varchar(7)                           null comment '밴사_코드',
    CORP_SE_CODE           varchar(1)                           not null comment '업체_구분_코드',
    SBSDR_SE_CODE          varchar(1)                           not null comment '자사_구분_코드',
    DSTRB_NM               varchar(50)                          not null comment '업체_명',
    REP_NM                 varchar(50)                          null comment '대표자_명',
    DSTRB_CORPNO           varchar(10)                          null comment '총판_사업자번호',
    DSTRB_COMP_NM          varchar(50)                          null comment '총판_상호_명',
    DSTRB_TYPE_NM          varchar(50)                          null comment '총판_업태_명',
    DSTRB_TELNO            varchar(20)                          not null comment '총판_전화번호',
    DSTRB_CELNO            varchar(20)                          not null comment '총판_휴대폰번호',
    DSTRB_FAXNO            varchar(20)                          null comment '총판_팩스번호',
    postno                 varchar(5)                           null comment '우편번호',
    roadnm_adres           varchar(100)                         null comment '도로명_주소',
    detail_adres_scr       varchar(256)                         null comment '상세_주소_SECRET',
    USE_AT                 varchar(1)                           not null comment '사용_여부',
    EDCTN_AT               varchar(1) default 'N'               not null comment '교육_여부',
    MNTHL_CRTF_AT          varchar(1) default 'N'               not null comment '월_인증_여부',
    ASP_MNTHL_CRTF_CNT     int                                  null comment 'ASP_월_인증_수량',
    ASP_MNTHL_CRTF_PRICE   int                                  null comment 'ASP_월_인증_금액',
    LOCAL_MNTHL_CRTF_CNT   int                                  null comment 'LOCAL_월_인증_수량',
    LOCAL_MNTHL_CRTF_PRICE int                                  null comment 'LOCAL_월_인증_금액',
    DSTRB_NOTE             varchar(400)                         null comment '총판_비고',
    CREATOR                varchar(100)                         not null comment '작성자',
    CREATED_AT             timestamp  default CURRENT_TIMESTAMP not null comment '생성시간',
    UPDATER                varchar(100)                         not null comment '수정자',
    UPDATED_AT             timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '변경시간'
)
    charset = utf8mb4;

create index idx_mn_dstrb_m_1
    on MN_DSTRB_M (DSTRB_CODE);

create table MN_EHGT
(
    EX_INFO_PID   int auto_increment comment '통화_정보_일련번호'
        primary key,
    EX_CRNCY_CODE varchar(7)                          not null comment '통화_구분_코드',
    SALE_DE       timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '영업_일자',
    EX_CRNCY_RT   float(10, 2)                        not null comment '환율_통화_율(%)',
    EX_WON_RT     float(10, 2)                        not null comment '환율_원화_율(%)',
    CREATED_AT    timestamp default CURRENT_TIMESTAMP not null comment '생성_일시',
    UPDATED_AT    timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_일시'
)
    charset = utf8mb4;

create table MN_EQPMN
(
    EQPMN_PID         int auto_increment comment '장비_일련번호'
        primary key,
    SORT_SEQ          int                                 not null comment '정렬_순서',
    EQPMN_CODE        varchar(7)                          not null comment '장비_코드',
    EQPMN_NM          varchar(50)                         not null comment '장비_명',
    EQPMN_CTG_CODE    varchar(7)                          not null comment '장비_분류_코드',
    MNFCTUR_CORP_CODE varchar(7)                          null comment '제조_업체_코드',
    SALE_AT           varchar(1)                          not null comment '판매_여부',
    AGENCY_DISPLAY_AT varchar(1)                          null comment '대리점_display_여부',
    EQPMN_IMG_URL     varchar(256)                        null comment '장비_이미지_URL',
    EQPMN_NOTE        varchar(400)                        null comment '장비_비고',
    PRICE             int       default 0                 not null comment '가격',
    CREATOR           varchar(100)                        not null comment '생성자',
    CREATED_AT        timestamp default CURRENT_TIMESTAMP not null comment '생성_일시',
    UPDATER           varchar(100)                        not null comment '수정자',
    UPDATED_AT        timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_일시',
    constraint mn_eqpmn_uk
        unique (EQPMN_CODE)
)
    charset = utf8mb4;

create table MN_EQPMN_AS_STTN
(
    EQPMN_AS_STTN_PID            int auto_increment comment '장비_AS_현황_일련번호'
        primary key,
    HIST_NO                      varchar(20)                          not null comment '이력_번호',
    SERIAL_NO                    varchar(50)                          null comment '일련_번호',
    CORP_CODE                    varchar(7)                           not null comment '업체_코드',
    CORP_NM                      varchar(50)                          not null comment '업체_명',
    EQPMN_CTG_CODE               varchar(7)                           not null comment '장비_분류_코드',
    EQPMN_CTG_NM                 varchar(50)                          not null comment '장비_분류_명',
    EQPMN_CODE                   varchar(7)                           not null comment '장비_코드',
    EQPMN_NM                     varchar(50)                          not null comment '장비_명',
    MNFCTUR_DE                   int                                  null comment '제조_일자',
    AS_PROCESS_CODE              varchar(7) default '7220001'         not null comment 'AS_처리_코드',
    ASSRNC_PD_SE_CODE            varchar(1)                           not null comment '보증_기간_구분_코드',
    DLIVY_DE                     int                                  null comment '출고_일자',
    AS_COST_CODE                 varchar(7)                           not null comment 'AS_비용_코드',
    AS_COST_PRICE                int        default 0                 not null comment 'AS_비용_가격',
    AS_REPAIR_PRIME_COST         int        default 0                 not null comment 'AS_수리_원_가',
    CMPLT_DE                     int                                  null comment '완료_일자',
    RCEPTER_STAFF_NM             varchar(50)                          null comment '접수자_사원_명',
    RCEPTER_STAFF_ID             varchar(100)                         null comment '접수자_사원_ID',
    RCEPTER_DEPT_CODE            varchar(7)                           null comment '접수자_부서_코드',
    STOCK_DE                     int                                  not null comment '입고_일자',
    STOCK_FORM_SE_CODE           varchar(1)                           null comment '입고_형태_구분_코드',
    DEFECT_H_NOTE                varchar(400)                         null comment '고장_내역_비고',
    PROCESS_MSG_NOTE             varchar(400)                         null comment '처리_사항_비고',
    ALTRTV_EQPMN_AT              varchar(1) default 'N'               not null comment '대체_장비_여부',
    ALTRTV_EQPMN_CTG_CODE        varchar(7)                           null comment '대체_장비_분류_코드',
    ALTRTV_EQPMN_CODE            varchar(7)                           null comment '대체_장비_코드',
    ALTRTV_EQPMN_SERIAL_NO       varchar(50)                          null comment '대체_장비_일련_번호',
    ALTRTV_EQPMN_RETURN_AT       varchar(1)                           null comment '대체_장비_회수_여부',
    MNFCTUR_CORP_CODE            varchar(7)                           null comment '제조_업체_코드',
    MNFCTUR_CORP_NM              varchar(50)                          null comment '제조_업체_명',
    APPRO_NO                     varchar(20)                          null comment '승인_번호',
    PROCESS_CORP_NM              varchar(50)                          null comment '처리_업체_명',
    PROCESS_CORP_CODE            varchar(7)                           not null comment '처리_업체_코드',
    AS_SEND_WAYBIL_NO            varchar(50)                          null comment 'AS_발송_운송장_번호',
    AS_SEND_FORM_CODE            varchar(7)                           null comment 'AS_발송_형태_코드',
    AS_SEND_DT                   datetime                             null comment 'AS_발송_일시',
    AS_SENDER_NM                 varchar(50)                          null comment 'AS_발송자_명',
    AS_RECEIVE_DT                datetime                             null comment 'AS_수령_일시',
    AS_RECEIVER_NM               varchar(50)                          null comment 'AS_수령자_명',
    AS_RETRN_DT                  datetime                             null comment 'AS_반송_일시',
    AS_RETRNER_NM                varchar(50)                          null comment 'AS_반송자_명',
    MGMT_CORP_SEND_WAYBIL_NO     varchar(50)                          null comment '관리_업체_발송_운송장_번호',
    MGMT_CORP_SEND_DT            datetime                             not null comment '관리_업체_발송_일시',
    MGMT_CORP_SEND_FORM_CODE     varchar(7)                           null comment '관리_업체_발송_형태_코드',
    MGMT_CORP_SENDER_RECEIVER_NM varchar(50)                          null comment '관리_업체_발송자_수령자_명',
    VAN_CODE                     varchar(7)                           null comment 'VAN사_코드',
    SYMPTMS_HIGH_CTG_NM          varchar(50)                          null comment '증상_대_분류_명',
    SYMPTMS_LOW_CTG1_NM          varchar(50)                          null comment '증상_소_분류1_명',
    SYMPTMS_LOW_CTG2_NM          varchar(50)                          null comment '증상_소_분류2_명',
    SYMPTMS_LOW_CTG3_NM          varchar(50)                          null comment '증상_소_분류3_명',
    SYMPTMS_HIGH_CTG_CODE        varchar(7)                           null comment '증상_대_분류_코드',
    SYMPTMS_LOW_CTG1_CODE        varchar(7)                           null comment '증상_소_분류1_코드',
    SYMPTMS_LOW_CTG2_CODE        varchar(7)                           null comment '증상_소_분류2_코드',
    SYMPTMS_LOW_CTG3_CODE        varchar(7)                           null comment '증상_소_분류3_코드',
    CORP_TELNO                   varchar(20)                          null comment '업체_전화번호',
    CORP_CELNO                   varchar(20)                          null comment '업체_핸드폰번호',
    CORP_ADRES                   varchar(100)                         null comment '업체_주소',
    REG_SE_CODE                  varchar(1)                           null comment '등록_구분_코드',
    ACSRY_APDTER_AT              varchar(1) default 'N'               not null comment '악세사리_아답터_여부',
    ACSRY_SERIAL_CABLE_AT        varchar(1) default 'N'               not null comment '악세사리_시리얼_케이블_여부',
    ACSRY_POWER_CORD_AT          varchar(1) default 'N'               not null comment '악세사리_파워_코드_여부',
    ACSRY_KEYBOARD_AT            varchar(1) default 'N'               not null comment '악세사리_키보드_여부',
    ACSRY_MOUSE_AT               varchar(1) default 'N'               not null comment '악세사리_마우스_여부',
    EXCHNG_CMPNT1_NM             varchar(50)                          null comment '교체_부품1_명',
    EXCHNG_CMPNT2_NM             varchar(50)                          null comment '교체_부품2_명',
    EXCHNG_CMPNT3_NM             varchar(50)                          null comment '교체_부품3_명',
    EXCHNG_CMPNT4_NM             varchar(50)                          null comment '교체_부품4_명',
    EXCHNG_CMPNT5_NM             varchar(50)                          null comment '교체_부품5_명',
    EXCHNG_CMPNT6_NM             varchar(50)                          null comment '교체_부품6_명',
    EXCHNG_CMPNT7_NM             varchar(50)                          null comment '교체_부품7_명',
    EXCHNG_CMPNT8_NM             varchar(50)                          null comment '교체_부품8_명',
    EXCHNG_CMPNT9_NM             varchar(50)                          null comment '교체_부품9_명',
    EXCHNG_CMPNT10_NM            varchar(50)                          null comment '교체_부품10_명',
    PRQUDO_JSON                  json                                 null comment '견적서_json',
    PAYMENT_AT                   varchar(1) default 'N'               null comment '결제_여부',
    PAYMENT_DT                   datetime                             null comment '결제_일시',
    PAYER_NM                     varchar(50)                          null comment '결제자_명',
    PAYMENT_METHOD_NM            varchar(50)                          null comment '결제_수단_명',
    PAYMENT_SUCCESS_AT           varchar(1)                           null comment '결제_성공_여부',
    PAYMENT_PRICE                int                                  null comment '결제_금액',
    PAYMENT_PROGRESS_SE_NM       varchar(50)                          null comment '결재_진행_구분_명',
    CREATOR                      varchar(100)                         not null comment '생성자',
    CREATED_AT                   timestamp  default CURRENT_TIMESTAMP not null comment '생성_일시',
    UPDATER                      varchar(100)                         not null comment '수정자',
    UPDATED_AT                   timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_일시'
)
    charset = utf8mb4;

create index mn_eqpmn_as_sttn_idx
    on MN_EQPMN_AS_STTN (CREATED_AT);

create table MN_EQPMN_CORP
(
    EQPMN_CORP_PID     int auto_increment comment '장비_업체_일련번호'
        primary key,
    CORP_CODE          varchar(7)                          not null comment '업체_코드',
    CORP_NM            varchar(50)                         not null comment '업체_명',
    EQPMN_CORP_SE_CODE varchar(1)                          not null comment '장비_업체_구분_코드',
    REP_NM             varchar(50)                         null comment '대표자_명',
    VAN_CORP_CODE      varchar(7)                          null comment '밴사_코드',
    USE_AT             varchar(1)                          not null comment '사용_여부',
    POS_PROG_CODE      varchar(7)                          null comment '포스_프로그램_코드',
    STORE_CODE         varchar(7)                          null comment '매장_코드',
    STORE_NM           varchar(50)                         null comment '매장_명',
    HARDWARE_INFO      varchar(400)                        null comment '하드웨어_정보',
    USE_CODE           varchar(7)                          null comment '용도_코드',
    CORP_NO            varchar(20)                         null comment '사업자_번호',
    COM_NM             varchar(50)                         null comment '상호_명',
    CORP_TYPE_NM       varchar(50)                         null comment '업태_명',
    ITEM_NM            varchar(50)                         null comment '종목_명',
    CORP_TELNO         varchar(20)                         null comment '전화번호',
    CORP_CELNO         varchar(20)                         null comment '휴대폰번호',
    CORP_FAXNO         varchar(20)                         null comment '팩스번호',
    STT_CODE           varchar(7)                          null comment '상태_코드',
    CORP_ADRES         varchar(100)                        null comment '업체_주소',
    MGMT_CHARGER_NM    varchar(50)                         null comment '관리_담당자_명',
    MGMT_CHARGER_CELNO varchar(20)                         null comment '관리_담당자_휴대폰번호',
    STORE_GRD_CODE     varchar(7)                          null comment '매장_등급_코드',
    CORP_GRD_CODE      varchar(7)                          null comment '업체_등급_코드',
    CORP_NOTE          varchar(400)                        null comment '업체_비고',
    CREATOR            varchar(100)                        not null comment '생성자',
    CREATED_AT         timestamp default CURRENT_TIMESTAMP not null comment '생성_일시',
    UPDATER            varchar(100)                        not null comment '수정자',
    UPDATED_AT         timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_일시',
    constraint mn_eqpmn_corp_uk
        unique (CORP_CODE)
)
    charset = utf8mb4;

create table MN_EQPMN_CTG
(
    EQPMN_CTG_PID  int auto_increment comment '장비_분류_일련번호'
        primary key,
    EQPMN_CTG_CODE varchar(7)                          not null comment '장비_분류_코드',
    EQPMN_CTG_NM   varchar(50)                         not null comment '장비_분류_명',
    CREATOR        varchar(100)                        not null comment '생성자',
    CREATED_AT     timestamp default CURRENT_TIMESTAMP not null comment '생성_일시',
    UPDATER        varchar(100)                        not null comment '수정자',
    UPDATED_AT     timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_일시',
    constraint mn_eqpmn_ctg_uk
        unique (EQPMN_CTG_CODE)
)
    charset = utf8mb4;

create table MN_EQPMN_GRADE
(
    EQPMN_GRADE_PID int auto_increment comment '장비_등급_일련번호'
        primary key,
    EQPMN_CODE      varchar(7)                          not null comment '장비_코드',
    GRD_CODE        varchar(7)                          not null comment '등급_코드',
    PRICE           int                                 not null comment '가격',
    CREATOR         varchar(100)                        not null comment '생성자',
    CREATED_AT      timestamp default CURRENT_TIMESTAMP not null comment '생성_일시',
    UPDATER         varchar(100)                        not null comment '수정자',
    UPDATED_AT      timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_일시'
)
    charset = utf8mb4;

create table MN_EQPMN_SYMPTMS
(
    EQPMN_SYMPTMS_PID       int auto_increment comment '장비_증상_일련번호'
        primary key,
    SYMPTMS_CTG_SE_CODE     varchar(1)                           not null comment '증상_분류_구분_코드',
    SYMPTMS_CTG_PARENT_CODE varchar(7)                           not null comment '증상_분류_부모_코드',
    SYMPTMS_CTG_CODE        varchar(7)                           not null comment '증상_분류_코드',
    SYMPTMS_CTG_NM          varchar(50)                          not null comment '증상_분류_명',
    USE_AT                  varchar(1) default 'Y'               not null comment '사용_여부',
    CREATOR                 varchar(100)                         not null comment '생성자',
    CREATED_AT              timestamp  default CURRENT_TIMESTAMP not null comment '생성_일시',
    UPDATER                 varchar(100)                         not null comment '수정자',
    UPDATED_AT              timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_일시'
)
    charset = utf8mb4;

create table MN_FCHQ_ENV_PREFER
(
    ENV_PREFER_PID int auto_increment comment '환경_설정_일련번호'
        primary key,
    FCHQ_CODE      varchar(7)                          not null comment '본사코드',
    TAB_CODE       varchar(7)                          not null comment '탭_코드',
    ENV_JSON       json                                not null comment '환경설정_JSON',
    PREV_ENV_JSON  json                                not null comment '이전_환경설정_JSON',
    CREATOR        varchar(100)                        not null comment '생성자',
    CREATED_AT     timestamp default CURRENT_TIMESTAMP not null comment '생성_일시',
    UPDATER        varchar(100)                        not null comment '수정자',
    UPDATED_AT     timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_일시'
)
    charset = utf8mb4;

create table MN_FCHQ_ENV_PREFER_H
(
    ENV_PREFER_PID int auto_increment comment '환경_설정_일련번호'
        primary key,
    FCHQ_CODE      varchar(5)                          not null comment '본사_코드',
    TAB_CODE       varchar(7)                          not null comment '탭_코드',
    ENV_JSON       json                                not null comment '환경설정_JSON',
    PREV_ENV_JSON  json                                not null comment '이전_환경설정_JSON',
    CREATOR        varchar(100)                        not null comment '생성자',
    CREATED_AT     timestamp default CURRENT_TIMESTAMP not null comment '생성_일시',
    UPDATER        varchar(100)                        not null comment '수정자',
    UPDATED_AT     timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_일시'
)
    charset = utf8mb4;

create table MN_FCHQ_M
(
    FCHQ_PID           int auto_increment comment '본사_일련번호'
        primary key,
    FCHQ_CODE          varchar(5)                          not null comment '본사_코드',
    FCHQ_NM            varchar(50)                         not null comment '본사_명',
    REP_NM             varchar(50)                         not null comment '대표자_명',
    CORP_NO            varchar(20)                         not null comment '사업자_번호',
    COM_NM             varchar(50)                         not null comment '상호_명',
    FCHQ_TYPE_NM       varchar(50)                         not null comment '업태_명',
    FCHQ_ITEM_NM       varchar(50)                         not null comment '종목_명',
    FCHQ_TELNO         varchar(20)                         not null comment '전화번호',
    FCHQ_CELNO         varchar(20)                         null comment '핸드폰',
    FCHQ_FAXNO         varchar(20)                         null comment '팩스',
    LOCAL_CODE         varchar(7)                          not null comment '지역_코드',
    STT_CODE           varchar(7)                          not null comment '상태_코드',
    SYS_OPEN_DE        int                                 not null comment '시스템_오픈_일자',
    FCHQ_EMAIL         varchar(100)                        null comment 'E-mail',
    FCHQ_STOCK_OPEN_AT varchar(1)                          not null comment '본사_재고_오픈_여부',
    WEBSITE_URL        varchar(256)                        null comment '웹사이트_url',
    POST_NO            varchar(20)                         not null comment '우편_번호',
    ROADNM_ADRES       varchar(100)                        not null comment '도로명_주소',
    DETAIL_ADRES       varchar(100)                        null comment '상세_주소',
    USE_CODE           varchar(7)                          not null comment '용도_코드',
    BRAND_AT           varchar(1)                          not null comment '브랜드_여부',
    SALE_MARGIN_AT     varchar(1)                          not null comment '판매_마진_여부',
    PROD_CATE_CODE     varchar(7)                          not null comment '상품_분류_코드',
    MGMT_VAN_CODE      varchar(7)                          not null comment '관리_밴사_코드',
    MGMT_CORP_CODE     varchar(7)                          not null comment '관리업체_코드',
    SYS_NOTE           varchar(400)                        null comment '시스템_비고',
    CREATED_AT         timestamp default CURRENT_TIMESTAMP not null comment '수정_시각',
    UPDATED_AT         timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '생성_시각'
)
    charset = utf8mb4;

create table MN_FIX_DSC
(
    FIX_DSC_PID      int auto_increment comment '고정_할인_순번'
        primary key,
    STORE_UNQCODE    varchar(12)                          not null comment '매장_고유코드',
    DSC_SE_TYPE_CODE varchar(7)                           not null comment '할인_구분_유형_코드',
    DSC_SE           varchar(1)                           not null comment '할인_구분',
    DSC_TYPE         varchar(1)                           not null comment '할인_유형',
    DSC_NO           varchar(7)                           not null comment '할인_번호',
    DSC_PRICE        int        default 0                 not null comment '할인_금액',
    AUTO_CLOSE_AT    varchar(1) default 'Y'               not null comment '자동_닫기_여부',
    USE_AT           varchar(1) default 'Y'               not null comment '사용_여부',
    ARRAY_SEQ        int                                  not null comment '배열_순서',
    CREATOR          varchar(100)                         not null comment '작성자',
    CREATED_AT       timestamp  default CURRENT_TIMESTAMP not null comment '생성시간',
    UPDATER          varchar(100)                         not null comment '수정자',
    UPDATED_AT       timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '변경시간'
)
    charset = utf8mb4;

create table MN_GIFT_CARD
(
    GIFT_CARD_PID    int auto_increment comment '상품권_순번'
        primary key,
    STORE_UNQCODE    varchar(12)                          not null comment '매장_고유코드',
    CTG_CODE         varchar(3)                           not null comment '분류_코드',
    GIFT_CARD_CODE   varchar(3)                           not null comment '상품권_코드',
    GIFT_CARD_NM     varchar(50)                          not null comment '상품권_명',
    PRICE            int        default 0                 not null comment '액면가',
    SERIAL_NO_USE_AT varchar(1) default 'N'               not null comment '일련번호_사용_여부',
    USE_AT           varchar(1)                           not null comment '사용_여부',
    CREATOR          varchar(100)                         not null comment '작성자',
    CREATED_AT       timestamp  default CURRENT_TIMESTAMP not null comment '생성시간',
    UPDATER          varchar(100)                         not null comment '수정자',
    UPDATED_AT       timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '변경시간',
    constraint mn_gift_card_uk
        unique (STORE_UNQCODE, GIFT_CARD_CODE)
)
    charset = utf8mb4;

create table MN_GOODS_BRAND
(
    GOODS_BRAND_PID bigint auto_increment comment '상품_브랜드_순번'
        primary key,
    STORE_UNQCODE   varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE       varchar(5)                          not null comment '본사_코드',
    BRAND_CODE      varchar(1)                          not null comment '브랜드_코드',
    BRAND_NM        varchar(50)                         not null comment '브랜드_명',
    COMMON_SE_CODE  varchar(1)                          not null comment '공통_구분_코드',
    DMSTC_SE_CODE   varchar(1)                          not null comment '수입_구분_코드',
    USE_AT          varchar(1)                          not null comment '사용_여부',
    CREATOR         varchar(100)                        not null comment '생성자',
    CREATED_AT      timestamp default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER         varchar(100)                        not null comment '수정자',
    UPDATED_AT      timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create index mn_goods_brand_idx
    on MN_GOODS_BRAND (STORE_UNQCODE, CREATED_AT);

create table MN_GOODS_HIGH_CTG
(
    HIGH_CTG_PID  bigint auto_increment comment '대_분류_순번'
        primary key,
    STORE_UNQCODE varchar(12)                          not null comment '매장_고유코드',
    FCHQ_CODE     varchar(5)                           not null comment '본사_코드',
    HIGH_CTG_CODE varchar(2)                           not null comment '대_분류_코드',
    HIGH_CTG_NM   varchar(50)                          not null comment '대_분류_명',
    HIGH_CTG_SEQ  int                                  not null comment '대_분류_순서',
    USE_AT        varchar(1) default 'Y'               not null comment '사용_여부',
    CREATOR       varchar(100)                         not null comment '생성자',
    CREATED_AT    timestamp  default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER       varchar(100)                         not null comment '수정자',
    UPDATED_AT    timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create index mn_goods_high_ctg_idx
    on MN_GOODS_HIGH_CTG (STORE_UNQCODE, CREATED_AT);

create table MN_GOODS_KITPTR
(
    GOODS_KITPTR_PID bigint auto_increment comment '상품_주방프린터_순번'
        primary key,
    STORE_UNQCODE    varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE        varchar(5)                          not null comment '본사_코드',
    KITPTR_NO        varchar(4)                          not null comment '주방프린터_번호',
    STORE_GCODE      varchar(20)                         not null comment '매장_상품코드',
    CREATOR          varchar(100)                        not null comment '생성자',
    CREATED_AT       timestamp default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER          varchar(100)                        not null comment '수정자',
    UPDATED_AT       timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create index mn_goods_kitptr_idx
    on MN_GOODS_KITPTR (CREATED_AT);

create table MN_GOODS_LOW_CTG
(
    LOW_CTG_PID   bigint auto_increment comment '소_분류_순번'
        primary key,
    STORE_UNQCODE varchar(12)                          not null comment '매장_고유코드',
    FCHQ_CODE     varchar(5)                           not null comment '본사_코드',
    HIGH_CTG_CODE varchar(2)                           not null comment '대_분류_코드',
    MID_CTG_CODE  varchar(4)                           not null comment '중_분류_코드',
    LOW_CTG_CODE  varchar(6)                           not null comment '소_분류_코드',
    LOW_CTG_NM    varchar(50)                          not null comment '소_분류_명',
    LOW_CTG_SEQ   int                                  not null comment '소_분류_순서',
    USE_AT        varchar(1) default 'Y'               not null comment '사용_여부',
    SIZE_CTG_CODE varchar(7)                           null comment '사이즈_분류_코드',
    CREATOR       varchar(100)                         not null comment '생성자',
    CREATED_AT    timestamp  default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER       varchar(100)                         not null comment '수정자',
    UPDATED_AT    timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create index mn_goods_low_ctg_idx
    on MN_GOODS_LOW_CTG (STORE_UNQCODE, CREATED_AT);

create table MN_GOODS_MID_CTG
(
    MID_CTG_PID   bigint auto_increment comment '중_분류_순번'
        primary key,
    STORE_UNQCODE varchar(12)                          not null comment '매장_고유코드',
    FCHQ_CODE     varchar(5)                           not null comment '본사_코드',
    HIGH_CTG_CODE varchar(2)                           not null comment '대_분류_코드',
    MID_CTG_CODE  varchar(4)                           not null comment '중_분류_코드',
    MID_CTG_NM    varchar(50)                          not null comment '중_분류_명',
    MID_CTG_SEQ   int                                  not null comment '중_분류_순서',
    USE_AT        varchar(1) default 'Y'               not null comment '사용_여부',
    CREATOR       varchar(100)                         not null comment '생성자',
    CREATED_AT    timestamp  default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER       varchar(100)                         not null comment '수정자',
    UPDATED_AT    timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create index mn_goods_mid_ctg_idx
    on MN_GOODS_MID_CTG (STORE_UNQCODE, CREATED_AT);

create table MN_HOLIDAY_INFO
(
    HOLIDAY_INFO_PID bigint auto_increment comment '공휴일_정보_순번'
        primary key,
    HOLIDAY_YEAR     int                                 not null comment '공휴일_연도',
    HOLIDAY_DE       int                                 not null comment '공휴일_일자',
    HOLIDAY_NM       varchar(50)                         not null comment '공휴일_명',
    CREATED_AT       timestamp default CURRENT_TIMESTAMP not null comment '생성시간',
    UPDATED_AT       timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정시간'
)
    charset = utf8mb4;

create table MN_MEAL_TICKET
(
    MEAL_TICKET_PID  int auto_increment comment '식권_순번'
        primary key,
    STORE_UNQCODE    varchar(12)                         not null comment '매장_고유코드',
    CTG_CODE         varchar(3)                          not null comment '분류_코드',
    MEAL_TICKET_CODE varchar(3)                          not null comment '식권_코드',
    MEAL_TICKET_NM   varchar(50)                         not null comment '식권_명',
    PRICE            int       default 0                 not null comment '액면가',
    PID_SE_CODE      varchar(1)                          null comment '일련번호_구분코드',
    USE_AT           varchar(1)                          not null comment '사용_여부',
    CREATOR          varchar(100)                        not null comment '작성자',
    CREATED_AT       timestamp default CURRENT_TIMESTAMP not null comment '생성시간',
    UPDATER          varchar(100)                        not null comment '수정자',
    UPDATED_AT       timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '변경시간',
    constraint mn_meal_ticket_uk
        unique (STORE_UNQCODE, MEAL_TICKET_CODE)
)
    charset = utf8mb4;

create table MN_PARTNER_CARD
(
    PARTNER_CARD_PID  int auto_increment comment '제휴_카드_순번'
        primary key,
    STORE_UNQCODE     varchar(12)                         not null comment '매장_고유코드',
    PARTNER_TYPE_CODE varchar(7)                          not null comment '제휴_유형_코드',
    PARTNER_CODE      varchar(4)                          not null comment '제휴_코드',
    PARTNER_NM        varchar(50)                         not null comment '제휴명',
    START_EXPIRE_DE   int                                 not null comment '시작_유효_기간',
    END_EXPIRE_DE     int                                 not null comment '종료_유효_기간',
    DSC_SE_CODE       varchar(1)                          not null comment '할인_구분코드',
    DSC_RT            float     default 0                 not null comment '할인_율',
    DSC_LMT_SE_CODE   varchar(1)                          not null comment '할인_한도_구분코드',
    DSC_LMT_PRICE     int       default 0                 not null comment '할인_한도_금액',
    APPRO_SE_CODE     varchar(1)                          not null comment '승인처리_구분코드',
    PARTNER_NOTE      varchar(400)                        null comment '비고',
    USE_AT            varchar(1)                          not null comment '사용_여부',
    CREATOR           varchar(100)                        not null comment '작성자',
    CREATED_AT        timestamp default CURRENT_TIMESTAMP not null comment '생성시간',
    UPDATER           varchar(100)                        not null comment '수정자',
    UPDATED_AT        timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '변경시간',
    constraint mn_partner_main_uk
        unique (STORE_UNQCODE, PARTNER_CODE)
)
    charset = utf8mb4;

create table MN_PAYMENT_METHOD_CTG
(
    PAYMENT_METHOD_CTG_PID int auto_increment comment '결제_수단_분류_순번'
        primary key,
    STORE_UNQCODE          varchar(12)                         not null comment '매장_고유코드',
    PAYMENT_METHOD_SE_CODE varchar(1)                          not null comment '결제_수단_구분코드',
    CTG_CODE               varchar(3)                          not null comment '분류_코드',
    CTG_NM                 varchar(50)                         not null comment '분류명',
    USE_AT                 varchar(1)                          not null comment '사용_여부',
    CREATOR                varchar(100)                        not null comment '작성자',
    CREATED_AT             timestamp default CURRENT_TIMESTAMP not null comment '생성시간',
    UPDATER                varchar(100)                        not null comment '수정자',
    UPDATED_AT             timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '변경시간',
    constraint mn_payment_method_ctg_uk
        unique (STORE_UNQCODE, PAYMENT_METHOD_SE_CODE, CTG_CODE)
)
    charset = utf8mb4;

create table MN_POS_CORP
(
    POS_CORP_PID           bigint auto_increment comment '포스_업체_순번'
        primary key,
    ECLL_CORP_SE_CODE      varchar(1)                           not null comment '총판_업체_구분_코드',
    CORP_SE_CODE           varchar(1)                           null comment '업체_구분_코드',
    CORP_CODE              varchar(7)                           not null comment '업체_코드',
    VAN_CORP_CODE          varchar(7)                           null comment '밴사_코드',
    HIGH_CORP_CODE         varchar(7)                           null comment '상위_업체_코드',
    CORP_NM                varchar(50)                          not null comment '업체_명',
    REP_NM                 varchar(50)                          null comment '대표자_명',
    CORP_NO                varchar(20)                          null comment '사업자_번호',
    COM_NM                 varchar(50)                          null comment '상호_명',
    CORP_TYPE_NM           varchar(50)                          null comment '업태_명',
    CORP_TELNO             varchar(20)                          not null comment '전화번호',
    CORP_CELNO             varchar(20)                          not null comment '휴대폰번호',
    CORP_FAXNO             varchar(20)                          null comment '팩스번호',
    INSTL_PSBLT_AT         varchar(1)                           not null comment '설치_가능_여부',
    USE_AT                 varchar(1)                           not null comment '사용_여부',
    EDCTN_AT               varchar(1)                           null comment '교육_여부',
    CORP_ADRES             varchar(100)                         null comment '업체_주소',
    CORP_NOTE              varchar(400)                         null comment '비고',
    MNTHL_CRTF_SE_CODE     varchar(1) default 'N'               null comment '월_인증_구분_코드',
    ASP_MNTHL_CRTF_CNT     int        default 0                 null comment 'ASP_월_인증_수량',
    ASP_MNTHL_CRTF_PRICE   int        default 0                 null comment 'ASP_월_인증_금액',
    LOCAL_MNTHL_CRTF_CNT   int        default 0                 null comment 'LOCAL_월_인증_수량',
    LOCAL_MNTHL_CRTF_PRICE int        default 0                 null comment 'LOCAL_월_인증_금액',
    CREATOR                varchar(100)                         not null comment '작성자',
    CREATED_AT             timestamp  default CURRENT_TIMESTAMP not null comment '생성시간',
    UPDATER                varchar(100)                         not null comment '수정자',
    UPDATED_AT             timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '변경시간'
)
    charset = utf8mb4;

create index idx_mn_pos_corp_1
    on MN_POS_CORP (CORP_CODE);

create index idx_mn_pos_corp_2
    on MN_POS_CORP (CREATED_AT);

create table MN_POS_CORP_INSTL
(
    CORP_INSTL_PID      bigint auto_increment comment '업체_설치_순번'
        primary key,
    POS_PID             bigint                              not null comment '포스_순번',
    FCHQ_CODE           varchar(5)                          not null comment '본사_코드',
    FCHQ_NM             varchar(50)                         not null comment '본사_명',
    STORE_UNQCODE       varchar(12)                         not null comment '매장_고유코드',
    STORE_NM            varchar(50)                         not null comment '매장_명',
    POS_NO              varchar(50)                         not null comment '포스_번호',
    MGMT_CORP_CODE      varchar(7)                          not null comment '관리_업체_코드',
    MGMT_CORP_NM        varchar(50)                         not null comment '관리_업체_명',
    INSTL_CORP_CODE     varchar(7)                          null comment '설치_업체_코드',
    INSTL_CORP_NM       varchar(50)                         null comment '설치_업체_업체명',
    INSTL_RQST_DT       datetime                            null comment '설치_의뢰_일자',
    INSTL_RQST_STAFF_NM varchar(50)                         null comment '설치_의뢰_사원_명',
    INSTL_RQST_STAFF_ID varchar(100)                        null comment '설치_의뢰_사원_ID',
    INSTL_DT            datetime                            null comment '설치_일자',
    INSTL_STAFF_NM      varchar(50)                         null comment '설치_사원_명',
    INSTL_STAFF_ID      varchar(100)                        null comment '설치_사원_ID',
    INSTL_STT_CODE      varchar(7)                          null comment '설치_상태_코드',
    INSTL_CODE          varchar(7)                          null comment '설치_코드',
    INSTL_NOTE          varchar(400)                        null comment '설치_비고',
    INSTL_ODR_CNT       int       default 0                 not null comment '설치_차_수',
    CREATOR             varchar(100)                        not null comment '작성자',
    CREATED_AT          timestamp default CURRENT_TIMESTAMP not null comment '생성시간',
    UPDATER             varchar(100)                        not null comment '수정자',
    UPDATED_AT          timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '변경시간'
)
    charset = utf8mb4;

create index mn_pos_corp_instl_idx
    on MN_POS_CORP_INSTL (STORE_UNQCODE);

create table MN_POS_CORP_INSTL_DAILY_STATS
(
    CORP_INSTL_DAILY_PID  bigint auto_increment comment '업체_설치_일일_통계_순번'
        primary key,
    POS_CORP_PID          bigint                              not null comment '포스_업체_순번',
    DAILY_ASP_BUY_CNT     int       default 0                 not null comment '일_ASP_구매_수량',
    DAILY_LOCAL_BUY_CNT   int       default 0                 not null comment '일_LOCAL_구매_수량',
    DAILY_ASP_SALE_CNT    int       default 0                 not null comment '일_ASP_판매_수량',
    DAILY_LOCAL_SALE_CNT  int       default 0                 not null comment '일_LOCAL_판매_수량',
    DAILY_ASP_INSTL_CNT   int       default 0                 not null comment '일_ASP_설치_수량',
    DAILY_LOCAL_INSTL_CNT int       default 0                 not null comment '일_LOCAL_설치_수량',
    DAILY_CALC_DE         int                                 not null comment '일일_계산_일자',
    CREATOR               varchar(100)                        not null comment '작성자',
    CREATED_AT            timestamp default CURRENT_TIMESTAMP not null comment '생성시간',
    UPDATER               varchar(100)                        not null comment '수정자',
    UPDATED_AT            timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '변경시간'
)
    charset = utf8mb4;

create index mn_pos_corp_instl_daily_stats_idx
    on MN_POS_CORP_INSTL_DAILY_STATS (POS_CORP_PID);

create table MN_POS_CORP_INSTL_H
(
    CORP_INSTL_H_PID    bigint auto_increment comment '업체_설치_이력_순번'
        primary key,
    POS_PID             bigint                              not null comment '포스_순번',
    FCHQ_CODE           varchar(5)                          not null comment '본사_코드',
    FCHQ_NM             varchar(50)                         not null comment '본사_명',
    STORE_UNQCODE       varchar(12)                         not null comment '매장_고유코드',
    STORE_NM            varchar(50)                         not null comment '매장_명',
    POS_NO              varchar(50)                         not null comment '포스_번호',
    POS_INSTL_CNT       int                                 null comment '포스_설치_수',
    MGMT_CORP_CODE      varchar(7)                          not null comment '관리_업체_코드',
    MGMT_CORP_NM        varchar(50)                         not null comment '관리_업체_명',
    INSTL_CORP_CODE     varchar(7)                          null comment '설치_업체_코드',
    INSTL_CORP_NM       varchar(50)                         null comment '설치_업체_업체명',
    INSTL_RQST_DT       datetime                            null comment '설치_의뢰_일자',
    INSTL_RQST_STAFF_NM varchar(50)                         null comment '설치_의뢰_사원_명',
    INSTL_RQST_STAFF_ID varchar(100)                        null comment '설치_의뢰_사원_ID',
    INSTL_DT            datetime                            null comment '설치_일자',
    INSTL_STAFF_NM      varchar(50)                         null comment '설치_사원_명',
    INSTL_STAFF_ID      varchar(100)                        null comment '설치_사원_ID',
    INSTL_STT_CODE      varchar(7)                          null comment '설치_상태_코드',
    INSTL_CODE          varchar(7)                          null comment '설치_코드',
    INSTL_NOTE          varchar(400)                        null comment '설치_비고',
    CREATOR             varchar(100)                        not null comment '작성자',
    CREATED_AT          timestamp default CURRENT_TIMESTAMP not null comment '생성시간',
    UPDATER             varchar(100)                        not null comment '수정자',
    UPDATED_AT          timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '변경시간'
)
    charset = utf8mb4;

create index mn_pos_corp_instl_h_idx
    on MN_POS_CORP_INSTL_H (STORE_UNQCODE);

create table MN_POS_CORP_INSTL_STATS
(
    CORP_INSTL_STATS_PID  bigint auto_increment comment '업체_설치_통계_순번'
        primary key,
    CORP_INSTL_STATS_CODE varchar(7)                          not null comment '업체_설치_통계_코드',
    ASP_SALE_CNT          int       default 0                 not null comment 'ASP_판매_수량',
    ASP_SALE_PRICE        int       default 0                 not null comment 'ASP_판매_금액',
    SALE_CORP_CODE        varchar(7)                          null comment '판매_업체_코드',
    ASP_BUY_CNT           int       default 0                 not null comment 'ASP_구매_수량',
    ASP_BUY_PRICE         int       default 0                 not null comment 'ASP_구매_금액',
    BUY_CORP_CODE         varchar(7)                          null comment '구매_업체_코드',
    LOCAL_SALE_CNT        int       default 0                 not null comment 'LOCAL_판매_수량',
    LOCAL_SALE_PRICE      int       default 0                 not null comment 'LOCAL_판매_금액',
    LOCAL_BUY_CNT         int       default 0                 not null comment 'LOCAL_구매_수량',
    LOCAL_BUY_PRICE       int       default 0                 not null comment 'LOCAL_구매_금액',
    CORP_AUTH_NOTE        varchar(400)                        null comment '인증_비고',
    STORE_UNQCODE         varchar(12)                         null comment '매장_고유코드',
    POS_NO                varchar(50)                         null comment '포스_번호',
    CREATOR               varchar(100)                        not null comment '작성자',
    CREATED_AT            timestamp default CURRENT_TIMESTAMP not null comment '생성시간',
    UPDATER               varchar(100)                        not null comment '수정자',
    UPDATED_AT            timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '변경시간'
)
    charset = utf8mb4;

create index mn_pos_corp_instl_stats_idx
    on MN_POS_CORP_INSTL_STATS (SALE_CORP_CODE, BUY_CORP_CODE);

create table MN_POS_CORP_TRNSF
(
    CORP_TRNSF_PID        bigint auto_increment comment '업체_설치_순번'
        primary key,
    STORE_UNQCODE         varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE             varchar(5)                          not null comment '본사_코드',
    FCHQ_NM               varchar(50)                         not null comment '본사_명',
    STORE_NM              varchar(50)                         not null comment '매장_명',
    STT_CODE              varchar(7)                          not null comment '진행_상태_코드',
    FROM_TRNSF_CORP_CODE  varchar(7)                          not null comment '이출_업체_코드',
    FROM_TRNSF_CORP_NM    varchar(50)                         not null comment '이출_업체_명',
    FROM_TRNSF_REGI_DT    datetime                            not null comment '이출_신청_일시',
    FROM_TRNSF_STAFF_NM   varchar(50)                         not null comment '이출_신청_사원_명',
    TRNSF_HIGH_CORP_CODE  varchar(7)                          not null comment '이관_총판_업체_코드',
    TRNSF_HIGH_CORP_NM    varchar(50)                         not null comment '이관_총판_업체_명',
    TRNSF_CHCK_DT         datetime                            null comment '이관_확인_일시',
    TRNSF_CHCK_STAFF_NM   varchar(50)                         null comment '이관_확인_사원_명',
    TO_TRNSF_CORP_CODE    varchar(7)                          not null comment '이입_업체_코드',
    TO_TRNSF_CORP_NM      varchar(50)                         not null comment '이입_업체_명',
    TO_TRNSF_REGI_DT      datetime                            null comment '이입_확인_일시',
    TO_TRNSF_STAFF_NM     varchar(50)                         null comment '이입_확인_사원_명',
    TRNSF_CANCEL_DT       datetime                            null comment '취소_일시',
    TRNSF_CANCEL_STAFF_NM varchar(50)                         null comment '취소_사원_명',
    CREATOR               varchar(100)                        not null comment '작성자',
    CREATED_AT            timestamp default CURRENT_TIMESTAMP not null comment '생성시간',
    UPDATER               varchar(100)                        not null comment '수정자',
    UPDATED_AT            timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '변경시간'
)
    charset = utf8mb4;

create index mn_pos_corp_trnsf_idx
    on MN_POS_CORP_TRNSF (STORE_UNQCODE, CREATED_AT);

create table MN_POS_PROG_VER
(
    POS_PROG_VER_PID       bigint auto_increment comment '포스_프로그램_버전_순번'
        primary key,
    POS_PROG_VER_NO        varchar(20)                         not null comment '포스_프로그램_버전_번호',
    POS_PROG_VER_NM        varchar(50)                         not null comment '포스_프로그램_버전_명',
    PROG_KIND_CODE         varchar(7)                          not null comment '프로그램_종류_코드',
    UPDATE_SE_CODE         varchar(1)                          not null comment '업데이트_구분_코드',
    POS_PROG_VER_FILE_NM   varchar(50)                         not null comment '포스_프로그램_버전_파일_명',
    POS_PROG_VER_FILE_PATH varchar(100)                        null,
    CREATOR                varchar(100)                        not null comment '작성자',
    CREATED_AT             timestamp default CURRENT_TIMESTAMP not null comment '생성시간',
    UPDATER                varchar(100)                        not null comment '수정자',
    UPDATED_AT             timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '변경시간'
)
    charset = utf8mb4;

create index mn_pos_prog_ver_idx
    on MN_POS_PROG_VER (CREATED_AT);

create table MN_POS_PROG_VER_RECV_H
(
    POS_PROG_RECV_H_PID  bigint auto_increment comment '포스_프로그램_수신_이력_순번'
        primary key,
    POS_PROG_TARGET_PID  bigint                              not null comment '포스_프로그램_대상_순번',
    POS_PID              bigint                              not null comment '포스_순번',
    STORE_UNQCODE        varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE            varchar(5)                          not null comment '본사_코드',
    FCHQ_NM              varchar(50)                         not null comment '본사_명',
    STORE_NM             varchar(50)                         not null comment '매장_명',
    POS_NO               varchar(20)                         not null comment '포스_번호',
    POS_PROG_VER_NO      varchar(20)                         not null comment '포스_프로그램_버전_번호',
    POS_PROG_VER_NM      varchar(50)                         not null comment '포스_프로그램_버전_명',
    PROG_KIND_CODE       varchar(7)                          null comment '프로그램_종류_코드',
    POS_PROG_RCV_SE_CODE varchar(1)                          not null comment '포스_프로그램_수신_구분_코드',
    UPDATE_SE_CODE       varchar(1)                          not null comment '업데이트_구분_코드',
    POS_PROG_VER_FILE_NM varchar(50)                         not null comment '포스_프로그램_버전_파일_명',
    POS_PROG_REG_DT      datetime                            not null comment '포스_프로그램_등록_일시',
    SW_CRTF_NO           varchar(20)                         not null comment 'SW_인증_번호',
    HW_CRTF_NO           varchar(20)                         not null comment 'HW_인증_번호',
    POS_PROG_RCV_DT      datetime                            not null comment '포스_프로그램_수신_일시',
    POS_IP               varchar(23)                         not null comment '포스_IP',
    CREATOR              varchar(100)                        not null comment '작성자',
    CREATED_AT           timestamp default CURRENT_TIMESTAMP not null comment '생성시간',
    UPDATER              varchar(100)                        not null comment '수정자',
    UPDATED_AT           timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '변경시간'
)
    charset = utf8mb4;

create index mn_pos_prog_recv_h_idx
    on MN_POS_PROG_VER_RECV_H (POS_PROG_TARGET_PID, POS_PID, STORE_UNQCODE, CREATED_AT);

create table MN_SAFE_OPEN_H
(
    SAFE_OPEN_H_PID   bigint auto_increment comment '돈통_오픈_이력_순번'
        primary key,
    STORE_UNQCODE     varchar(12)                         not null comment '매장_고유코드',
    SAFE_OPEN_DE      int                                 not null comment '돈통_오픈_일자',
    POS_NO            varchar(20)                         not null comment '포스_번호',
    POS_PID           int                                 not null comment '포스_일련번호',
    SAFE_OPEN_DT      datetime                            not null comment '돈통_오픈_일시',
    SAFE_OPEN_SE_CODE varchar(1)                          not null comment '돈통_오픈_구분_코드',
    STAFF_NM          varchar(50)                         null comment '판매원_명',
    RECPT_NO          varchar(20)                         null comment '영수_번호',
    SALE_PRICE        int                                 null comment '총매출',
    DSC_PRICE         int                                 null comment '총할인',
    ACT_SALE_PRICE    int                                 null comment '실매출',
    CREATOR           varchar(100)                        not null comment '작성자',
    CREATED_AT        timestamp default CURRENT_TIMESTAMP not null comment '생성시간',
    UPDATER           varchar(100)                        not null comment '수정자',
    UPDATED_AT        timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '변경시간'
)
    charset = utf8mb4;

create table MN_STM_CHG_H
(
    CHG_H_PID            bigint auto_increment comment '변경_내역_순번'
        primary key,
    STORE_UNQCODE        varchar(12)                          not null comment '매장_고유코드',
    STORE_CODE           varchar(7)                           not null comment '매장_코드',
    STORE_NM             varchar(50)                          not null comment '매장_명',
    FCHQ_CODE            varchar(5)                           not null comment '본사_코드',
    FCHQ_NM              varchar(50)                          not null comment '본사_명',
    REQ_SE_CODE          varchar(1) default 'R'               not null comment '요청_구분_코드',
    REQSTT_SE_CODE       varchar(1) default 'R'               not null comment '요청상태_구분_코드',
    REQ_MGMT_CORP_CODE   varchar(12)                          not null comment '요청_관리_업체_코드',
    REQ_MGMT_CORP_NM     varchar(50)                          not null comment '요청_관리_업체_명',
    REQ_CODE             varchar(8)                           not null comment '요청_코드',
    STORE_CTG_CODE       varchar(7) default '0000000'         null comment '매장_분류_코드',
    REP_NM               varchar(50)                          not null comment '대표자_명',
    FORM_CODE            varchar(7) default '7060001'         not null comment '형태_코드',
    GROUP_CODE           varchar(7) default '7070001'         not null comment '그룹_코드',
    STORE_CORPNO         varchar(10)                          not null comment '매장_사업자번호',
    STORE_TYPE_NM        varchar(50)                          not null comment '매장_업태_명',
    STORE_ITEM_NM        varchar(50)                          not null comment '매장_종목_명',
    STORE_COMP_NM        varchar(50)                          not null comment '매장_상호_명',
    STORE_TELNO          varchar(15)                          not null comment '매장_전화번호',
    STORE_CELNO          varchar(15)                          null comment '매장_핸드폰',
    STORE_FAXNO          varchar(15)                          null comment '매장_팩스',
    LOCAL_CODE           varchar(7)                           not null comment '지역_코드',
    STT_SE_CODE          varchar(7) default '0'               not null comment '상태_구분_코드',
    POS_OPEN_DE          int                                  not null comment '포스_개점_일자',
    POS_CLOSE_DE         int                                  null comment '포스_폐점_일자',
    STORE_EMAIL          varchar(100)                         null comment '매장_이메일',
    WEBSITE_URL          varchar(256)                         null comment '웹사이트_url',
    STORE_POSTNO         varchar(6)                           not null comment '매장_우편번호',
    ROADNM_ADRES         varchar(100)                         not null comment '도로명_주소',
    DETAIL_ADRES         varchar(100)                         not null comment '상세_주소',
    USE_SE_CODE          varchar(7) default '0'               not null comment '용도_구분_코드',
    BRAND_AT             varchar(1) default 'N'               not null comment '브랜드_여부',
    GOODS_SE_CODE        varchar(7) default '0'               not null comment '상품_구분_코드',
    MGMT_VAN_CODE        varchar(5) default '00000'           not null comment '관리_밴사_코드',
    MGMT_CORP_CODE       varchar(12)                          not null comment '관리_업체_코드',
    MGMT_CORP_NM         varchar(50)                          not null comment '관리_업체_명',
    MGMT_CORP_TELNO      varchar(24)                          null comment '관리_업체_전화번호',
    INSTALL_CORP_CODE    varchar(12)                          not null comment '설치_업체_코드',
    LOCAL_POS_AT         varchar(1) default 'N'               not null comment '로컬_POS_여부',
    TRANS_REGI_AT        varchar(1)                           null comment '이관_신청_여부',
    PROG_SE_CODE         varchar(1)                           not null comment '프로그램_구분_코드',
    SYS_NOTE             text                                 null comment '시스템_비고',
    HEAD_NOTE            text                                 null comment '본사_비고',
    REMARK_NOTE          text                                 null comment '특이_사항',
    INSTALL_POS_CNT      int        default 1                 not null comment '설치_포스_수',
    DEF_VAN_CODE         varchar(5) default '00000'           not null comment '기본_VAN사_코드',
    DEF_VAN_CONTRACT_NO  varchar(20)                          null comment '기본_VAN사_계약_번호',
    DEF_VAN_SERIAL_NO    varchar(20)                          null comment '기본_VAN사_일련_번호',
    CASH_VAN_CODE        varchar(5) default '00000'           not null comment '현금영수증_VAN사_코드',
    CASH_VAN_CONTRACT_NO varchar(20)                          null comment '현금영수증_VAN사_계약_번호',
    CASH_VAN_SERIAL_NO   varchar(20)                          null comment '현금영수증_VAN사_일련_번호',
    CORNER_SE_CODE       varchar(1) default 'N'               not null comment '코너_구분_코드',
    CASH_ISSUE_AT        varchar(1) default 'N'               not null comment '현금영수증_발급_여부',
    INIT_SALE_DT         datetime                             null comment '최초_매출_일시',
    LAST_SALE_DT         datetime                             null comment '최종_매출_일시',
    WARE_AT              varchar(1) default 'N'               not null comment '창고_여부',
    MARGIN_MGMT_AT       varchar(1) default 'N'               not null comment '마진_관리_여부',
    SW_AGREE_AT          varchar(1) default 'N'               not null comment 'SW_동의_여부',
    SW_AGREE_DT          datetime                             null comment 'SW_동의_일시',
    SW_AGREE_SEND_AT     varchar(1) default 'N'               not null comment 'SW_동의_전송_여부',
    CREATOR              varchar(100)                         not null comment '생성자',
    CREATED_AT           timestamp  default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER              varchar(100)                         not null comment '수정자',
    UPDATED_AT           timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각',
    ORIGNL_STORE_CODE    varchar(12)                          null comment '복사_매장_코드',
    CODE_LENGTH_AT       varchar(1) default 'N'               null comment '코드_자릿수_여부',
    MENU_AUTH_AT         varchar(1) default 'N'               null comment '메뉴_권한_여부',
    STORE_ENV_AT         varchar(1) default 'N'               null comment '매장_환경_여부',
    POS_ENV_AT           varchar(1) default 'N'               null comment '포스_환경_여부',
    EAT_OUT_ENV_AT       varchar(1) default 'N'               null comment '외삭_환경_여부',
    KIT_PTR_AT           varchar(1) default 'N'               null comment '주방_프린터_여부',
    GOODS_AT             varchar(1) default 'N'               null comment '상품_여부',
    SALES_PRICE_AT       varchar(1) default 'N'               null comment '판매_가격_여부',
    SUPPLY_PRICE_AT      varchar(1) default 'N'               null comment '공급_가격_여부',
    TCHKEY_AT            varchar(1) default 'N'               null comment '터치키_여부',
    POS_OUTPUT_AT        varchar(1) default 'N'               null comment '포스_출력물_여부'
)
    charset = utf8mb4;

create index mn_stm_chg_h_idx
    on MN_STM_CHG_H (STORE_UNQCODE);

create table MN_STM_CHG_H_CORNER
(
    CHG_H_CORNER_PID     int auto_increment comment '변경_내역_코너_순번'
        primary key,
    STORE_UNQCODE        varchar(12)                          not null comment '매장_고유코드',
    FCHQ_CODE            varchar(5)                           not null comment '본사_코드',
    REQ_SE_CODE          varchar(1) default 'R'               not null comment '요청_구분_코드',
    REQSTT_SE_CODE       varchar(1) default 'R'               not null comment '요청상태_구분_코드',
    REQ_MGMT_CORP_CODE   varchar(12)                          not null comment '요청_관리_업체_코드',
    REQ_MGMT_CORP_NM     varchar(50)                          not null comment '요청_관리_업체_명',
    REQ_CODE             varchar(8)                           not null comment '요청_코드',
    CORNER_CODE          varchar(2)                           null comment '코너_코드',
    CORNER_NM            varchar(50)                          not null comment '코너_명',
    DEF_VAN_CODE         varchar(5) default '00000'           not null comment '기본_VAN사_코드',
    DEF_VAN_CONTRACT_NO  varchar(20)                          null comment '기본_VAN사_계약_번호',
    DEF_VAN_SERIAL_NO    varchar(20)                          null comment '기본_VAN사_일련_번호',
    CASH_VAN_CODE        varchar(5) default '00000'           not null comment '현금영수증_VAN사_코드',
    CASH_VAN_CONTRACT_NO varchar(20)                          null comment '현금영수증_VAN사_계약_번호',
    CASH_VAN_SERIAL_NO   varchar(20)                          null comment '현금영수증_VAN사_일련_번호',
    CASH_CMSN_RATE       float      default 0                 not null comment '현금_수수료_율',
    CARD_CMSN_RATE       float      default 0                 not null comment '카드_수수료_율',
    ETC_CMSN_RATE        float      default 0                 not null comment '기타_수수료_율',
    REP_NM               varchar(50)                          null comment '대표자_명',
    CORP_NO              varchar(20)                          null comment '사업자_번호',
    STORE_TYPE_NM        varchar(50)                          null comment '매장_업태_명',
    STORE_ITEM_NM        varchar(50)                          null comment '매장_종목_명',
    STORE_TELNO          varchar(20)                          null comment '매장_전화번호',
    USE_AT               varchar(1) default 'Y'               not null comment '사용_여부',
    CREATOR              varchar(100)                         not null comment '생성자',
    CREATED_AT           timestamp  default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER              varchar(100)                         not null comment '수정자',
    UPDATED_AT           timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각',
    AUTH_AT              varchar(1) default 'N'               not null comment '인증_여부',
    INIT_AUTH_DT         datetime                             null comment '최초_인증_일시',
    LAST_AUTH_DT         datetime                             null comment '최종_인증_일시',
    AUTH_CNT             int        default 0                 not null comment '인증_수',
    SEND_SE_CODE         varchar(1)                           null comment '서버송신구분',
    SEND_DT              datetime                             null comment '서버송신일시',
    WORK_INDEX           varchar(2)                           null comment 'work_index',
    WORK_KEY             varchar(32)                          null comment 'work_key',
    OKCBG_CONTRACT_NO    varchar(20)                          null comment 'OK-CASHBAG_계약_번호',
    OKCBG_SERIAL_NO      varchar(20)                          null comment 'OK-CASHBAG_일련_번호',
    W_KEY                varchar(400)                         null comment 'w_key',
    DAUMMSP_CONTRACT_NO  varchar(20)                          null comment '다음_게약_번호',
    DAUMMSP_SERIAL_NO    varchar(20)                          null comment '다음_일련_번호',
    VAN_SAM_ID           varchar(20)                          null comment '동글_SAM_ID',
    VAN_SAM_NO           varchar(20)                          null comment '동글_SAM_NO',
    VAN_SAM_RECV_AT      varchar(1)                           null comment '발행사 정보 수신 여부',
    MCP_CONTRACT_NO      varchar(20)                          null comment '모바일쿠폰_계약_번호',
    MCP_SERIAL_NO        varchar(20)                          null comment '모바일쿠폰_일련_번호'
)
    charset = utf8mb4;

create index mn_stm_chg_h_corner_idx
    on MN_STM_CHG_H_CORNER (STORE_UNQCODE, CREATED_AT);

create table MN_STM_CHG_H_POS
(
    CHG_H_POS_PID      int auto_increment comment '변경_내역_포스_순번'
        primary key,
    STORE_UNQCODE      varchar(12)                          not null comment '매장_고유코드',
    FCHQ_CODE          varchar(5)                           not null comment '본사_코드',
    REQ_SE_CODE        varchar(1) default 'R'               not null comment '요청_구분_코드',
    REQSTT_SE_CODE     varchar(1) default 'R'               not null comment '요청상태_구분_코드',
    REQ_MGMT_CORP_CODE varchar(12)                          not null comment '요청_관리_업체_코드',
    REQ_MGMT_CORP_NM   varchar(50)                          not null comment '요청_관리_업체_명',
    REQ_CODE           varchar(8)                           not null comment '요청_코드',
    POS_NO             varchar(2)                           not null comment '포스_번호',
    VAN_TERM_NO        varchar(20)                          null comment '단말기_번호',
    VAN_SERIAL_NO      varchar(20)                          null comment '단말기_시리얼_번호',
    CREATOR            varchar(100)                         not null comment '생성자',
    CREATED_AT         timestamp  default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER            varchar(100)                         not null comment '수정자',
    UPDATED_AT         timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create index mn_stm_chg_h_pos_idx
    on MN_STM_CHG_H_POS (STORE_UNQCODE, CREATED_AT);

create table MN_STM_CORNER
(
    STORE_CORNER_PID     int auto_increment comment '매장_코너_순번'
        primary key,
    STORE_UNQCODE        varchar(12)                          not null comment '매장_고유코드',
    FCHQ_CODE            varchar(5)                           not null comment '본사_코드',
    CORNER_CODE          varchar(2)                           not null comment '코너_코드',
    CORNER_NM            varchar(50)                          not null comment '코너_명',
    DEF_VAN_CODE         varchar(5) default '00000'           not null comment '기본_VAN사_코드',
    DEF_VAN_CONTRACT_NO  varchar(16)                          null comment '기본_VAN사_계약_번호',
    DEF_VAN_SERIAL_NO    varchar(16)                          null comment '기본_VAN사_일련_번호',
    CASH_VAN_CODE        varchar(5) default '00000'           not null comment '현금영수증_VAN사_코드',
    CASH_VAN_CONTRACT_NO varchar(16)                          null comment '현금영수증_VAN사_계약_번호',
    CASH_VAN_SERIAL_NO   varchar(20)                          null comment '현금영수증_VAN사_일련_번호',
    CASH_CMSN_RATE       float      default 0                 not null comment '현금_수수료_율',
    CARD_CMSN_RATE       float      default 0                 not null comment '카드_수수료_율',
    ETC_CMSN_RATE        float      default 0                 not null comment '기타_수수료_율',
    REP_NM               varchar(50)                          null comment '대표자_명',
    CORP_NO              varchar(20)                          null comment '사업자_번호',
    STORE_TYPE_NM        varchar(50)                          null comment '매장_업태_명',
    STORE_ITEM_NM        varchar(50)                          null comment '매장_종목_명',
    STORE_TELNO          varchar(20)                          null comment '매장_전화번호',
    USE_AT               varchar(1) default 'Y'               not null comment '사용_여부',
    CREATOR              varchar(100)                         not null comment '생성자',
    CREATED_AT           timestamp  default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER              varchar(100)                         not null comment '수정자',
    UPDATED_AT           timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각',
    AUTH_AT              varchar(1) default 'Y'               not null comment '인증_여부',
    INIT_AUTH_DT         datetime                             null comment '최초_인증_일시',
    LAST_AUTH_DT         datetime                             null comment '최종_인증_일시',
    AUTH_CNT             int        default 1                 not null comment '인증_수',
    SEND_SE_CODE         varchar(1)                           null comment '서버송신구분',
    SEND_DT              datetime                             null comment '서버송신일시',
    WORK_INDEX           varchar(2)                           null comment 'work_index',
    WORK_KEY             varchar(32)                          null comment 'work_key',
    OKCBG_CONTRACT_NO    varchar(20)                          null comment 'OK-CASHBAG_계약_번호',
    OKCBG_SERIAL_NO      varchar(20)                          null comment 'OK-CASHBAG_일련_번호',
    W_KEY                varchar(400)                         null comment 'w_key',
    DAUMMSP_CONTRACT_NO  varchar(20)                          null comment '다음_게약_번호',
    DAUMMSP_SERIAL_NO    varchar(20)                          null comment '다음_일련_번호',
    VAN_SAM_ID           varchar(20)                          null comment '동글_SAM_ID',
    VAN_SAM_NO           varchar(20)                          null comment '동글_SAM_NO',
    VAN_SAM_RECV_AT      varchar(1)                           null comment '발행사 정보 수신 여부',
    MCP_CONTRACT_NO      varchar(20)                          null comment '모바일쿠폰_계약_번호',
    MCP_SERIAL_NO        varchar(20)                          null comment '모바일_쿠폰_일련_번호'
)
    charset = utf8mb4;

create index mn_stm_corner_idx
    on MN_STM_CORNER (STORE_UNQCODE, CREATED_AT);

create table MN_STM_CUSTOMER_CTG
(
    CUSTOMER_CTG_PID int auto_increment comment '고객_분류_순번'
        primary key,
    STORE_UNQCODE    varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE        varchar(5)                          not null comment '본사_코드',
    CTG1_NM          varchar(50)                         not null comment '분류1_명',
    CTG2_NM          varchar(50)                         null comment '분류2_명',
    CTG3_NM          varchar(50)                         null comment '분류3_명',
    CTG4_NM          varchar(50)                         null comment '분류4_명',
    CREATOR          varchar(100)                        not null comment '생성자',
    CREATED_AT       timestamp default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER          varchar(100)                        not null comment '수정자',
    UPDATED_AT       timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create index mn_stm_time_customer_ctg_idx
    on MN_STM_CUSTOMER_CTG (STORE_UNQCODE);

create table MN_STM_DLVRY_AGT_SVC
(
    dlvry_agt_svc_pid   bigint auto_increment comment '배달_대행_서비스_순번'
        primary key,
    STORE_UNQCODE       varchar(12)                         not null comment '매장_고유코드',
    store_nm            varchar(50)                         not null comment '매장_명',
    dlvry_de            int                                 not null comment '배달_일자',
    pos_no              varchar(20)                         not null comment '포스_번호',
    receipt_no          varchar(20)                         not null comment '영수증_번호',
    dlvry_stt_se_code   varchar(1)                          not null comment '배달_상태_구분_코드',
    dlvry_corp_nm       varchar(50)                         not null comment '배달_업체_명',
    dlvry_no            varchar(20)                         not null comment '배달_번호',
    dlvry_assign_dt     datetime                            not null comment '배달_배정_일시',
    dlvry_cmplt_dt      datetime                            not null comment '배달_완료_일시',
    dlvry_driver_nm     varchar(50)                         null comment '배달_기사_명',
    dlvry_driver_cellno varchar(20)                         null comment '배달_기사_핸드폰',
    dlvry_if_adres      varchar(100)                        null comment '배달_IF용_주소',
    creator             varchar(100)                        not null comment '작성자',
    created_at          timestamp default CURRENT_TIMESTAMP not null comment '작성_시각',
    updater             varchar(100)                        not null comment '수정자',
    updated_at          timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create table MN_STM_DLVRY_MGMT
(
    DLVRY_MGMT_PID      bigint auto_increment comment '배달_관리_순번'
        primary key,
    STORE_UNQCODE       varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE           varchar(5)                          not null comment '본사_코드',
    DLVRY_MGMT_GRP_CODE varchar(7)                          not null comment '배달_관리_그룹_코드',
    DLVRY_MGMT_CODE     varchar(7)                          not null comment '배달_관리_코드',
    DLVRY_MGMT_NM       varchar(50)                         not null comment '배달_관리_명',
    DLVRY_MGMT_USE_AT   varchar(1)                          not null comment '배달_관리_사용_여부',
    DLVRY_MGMT_SE_CODE  varchar(1)                          not null comment '배달_관리_구분_코드',
    DLVRY_MGMT_SEQ      int                                 not null comment '배달_관리_순서',
    CREATOR             varchar(100)                        not null comment '작성자',
    CREATED_AT          timestamp default CURRENT_TIMESTAMP not null comment '작성_시각',
    UPDATER             varchar(100)                        not null comment '수정자',
    UPDATED_AT          timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create table MN_STM_DLVRY_MGMT_GRP
(
    DLVRY_MGMT_GRP_PID     bigint auto_increment comment '배달_관리_그룹_순번'
        primary key,
    FCHQ_CODE              varchar(5)                          not null comment '본사_코드',
    STORE_UNQCODE          varchar(12)                         not null comment '매장_고유코드',
    DLVRY_MGMT_GRP_CODE    varchar(7)                          not null comment '배달_관리_그룹_코드',
    DLVRY_MGMT_GRP_NM      varchar(50)                         not null comment '배달_관리_그룹_명',
    DLVRY_MGMT_GRP_USE_AT  varchar(1)                          not null comment '배달_관리_그룹_사용_여부',
    DLVRY_MGMT_GRP_SE_CODE varchar(1)                          not null comment '배달_관리_그룹_구분_코드',
    DLVRY_MGMT_GRP_SEQ     int                                 not null comment '배달_관리_그룹_순서',
    CREATOR                varchar(100)                        not null comment '작성자',
    CREATED_AT             timestamp default CURRENT_TIMESTAMP not null comment '작성_시각',
    UPDATER                varchar(100)                        not null comment '수정자',
    UPDATED_AT             timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create table MN_STM_DLVRY_MSG
(
    dlvry_msg_pid bigint auto_increment comment '배달_메시지_순번'
        primary key,
    STORE_UNQCODE varchar(12)                         not null comment '매장_고유코드',
    fchq_code     varchar(5)                          not null,
    msg_code      varchar(2)                          not null comment '메시지_코드',
    basic_send_at varchar(1)                          not null comment '기본_전송_여부',
    send_msg      varchar(400)                        not null comment '전송_메시지',
    msg_seq       int                                 not null comment '메시지_순서',
    creator       varchar(100)                        not null comment '작성자',
    created_at    timestamp default CURRENT_TIMESTAMP not null comment '작성_시각',
    updater       varchar(100)                        not null comment '수정자',
    updated_at    timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create table MN_STM_DLVRY_STT
(
    DLVRY_STT_PID      bigint auto_increment comment '배달_현황_순번'
        primary key,
    STORE_UNQCODE      varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE          varchar(5)                          not null comment '본사_코드',
    POS_NO             varchar(20)                         not null comment '포스_번호',
    RECEIPT_NO         varchar(20)                         not null comment '영수증_번호',
    MBR_NM             varchar(50)                         not null comment '회원_명',
    DLVRY_ADRES        varchar(50)                         not null comment '배달_주소',
    DLVRY_TELNO        varchar(20)                         not null comment '배달_전화번호',
    DLVRY_DE           int                                 not null comment '배달_일자',
    ORDER_DT           datetime                            not null comment '주문_일시',
    ACTUAL_SALES_PRICE int                                 not null comment '실_매출_금액',
    DLVRY_STAFF_CODE   varchar(7)                          not null comment '배달_직원_코드',
    DLVRY_STAFF_NM     varchar(50)                         not null comment '배달_직원_명',
    CASHIER_CODE       varchar(7)                          not null comment '캐셔_코드',
    CASHIER_NM         varchar(50)                         not null comment '캐셔_명',
    CREATOR            varchar(100)                        not null comment '작성자',
    CREATED_AT         timestamp default CURRENT_TIMESTAMP not null comment '작성_시각',
    UPDATER            varchar(100)                        not null comment '수정자',
    UPDATED_AT         timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create table MN_STM_KIT_MEMO
(
    KIT_MEMO_PID  int auto_increment comment '주방_메모_일련번호'
        primary key,
    STORE_UNQCODE varchar(12)                          not null comment '매장_고유코드',
    FCHQ_CODE     varchar(5)                           not null comment '매장_고유코드',
    MEMO_CODE     varchar(2)                           not null comment '메모_코드',
    MEMO          varchar(30)                          not null comment '메모',
    USE_AT        varchar(1) default 'Y'               not null comment '사용_여부',
    CREATOR       varchar(100)                         not null comment '작성자',
    UPDATER       varchar(100)                         not null comment '수정자',
    CREATED_AT    timestamp  default CURRENT_TIMESTAMP not null comment '생성시간',
    UPDATED_AT    timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정시간'
)
    charset = utf8mb4;

create table MN_STM_M
(
    store_pid            int auto_increment comment '매장_순번'
        primary key,
    store_unqcode        varchar(12)                          not null comment '매장_고유코드',
    store_code           varchar(7)                           not null comment '매장_코드',
    store_nm             varchar(50)                          not null comment '매장_명',
    fchq_code            varchar(5)                           not null comment '본사_코드',
    fchq_nm              varchar(50)                          not null comment '본사_명',
    store_ctg_code       varchar(7) default '0000000'         null comment '매장_분류_코드',
    rep_nm               varchar(50)                          not null comment '대표자_명',
    form_code            varchar(7) default '2140001'         not null comment '형태_코드',
    group_code           varchar(7) default '2150001'         not null comment '그룹_코드',
    store_corpno         varchar(10)                          not null comment '사업자_번호',
    store_type_nm        varchar(50)                          not null comment '매장_업태_명',
    store_item_nm        varchar(50)                          not null comment '매장_종목_명',
    store_comp_nm        varchar(50)                          null comment '매장_상호_명',
    store_telno          varchar(15)                          not null comment '매장_전화번호',
    store_celno          varchar(15)                          null comment '매장_핸드폰번호',
    store_faxno          varchar(15)                          null comment '매장_팩스번호',
    local_code           varchar(50)                          not null comment '지역_코드',
    stt_se_code          varchar(1) default '0'               not null comment '상태_구분_코드',
    pos_open_de          int                                  not null comment '포스_오픈_일자',
    pos_close_de         int                                  null comment '포스_폐점_일자',
    store_email          varchar(100)                         null comment '매장_이메일',
    website_url          varchar(256)                         null comment '웹사이트_url',
    store_postno         varchar(6)                           not null comment '우편_번호',
    roadnm_adres         varchar(100)                         not null comment '도로명_주소',
    detail_adres         varchar(100)                         null comment '상세_주소',
    use_se_code          varchar(1) default '1'               not null comment '용도_구분_코드',
    brand_at             varchar(1) default 'N'               not null comment '브랜드_여부',
    goods_se_code        varchar(1) default '1'               not null comment '상품_구분_코드',
    mgmt_van_code        varchar(5) default '00001'           not null comment '관리_밴사_코드',
    mgmt_corp_use_at     varchar(1) default 'Y'               not null comment '관리_업체_사용_여부',
    mgmt_corp_code       varchar(12)                          not null comment '관리_업체_코드',
    mgmt_corp_nm         varchar(50)                          null comment '관리_업체_명',
    mgmt_corp_telno      varchar(24)                          null comment '관리_업체_전화번호',
    install_corp_code    varchar(12)                          not null comment '설치_업체_코드',
    local_pos_at         varchar(1) default 'N'               not null comment '로컬_POS_여부',
    trans_regi_at        varchar(1)                           null comment '이관_신청_여부',
    prog_se_code         varchar(1) default 'O'               not null comment '프로그램_구분_코드',
    sys_note             text                                 null comment '시스템_비고',
    head_note            text                                 null comment '본사_비고',
    remark_note          text                                 null comment '특이사항_비고',
    install_pos_cnt      int        default 1                 not null comment '설치_포스_수',
    def_van_code         varchar(5) default '00000'           not null comment '기본_VAN사_코드',
    def_van_contract_no  varchar(20)                          null comment '기본_VAN사_계약_번호',
    def_van_serial_no    varchar(20)                          null comment '기본_VAN사_일련_번호',
    cash_van_code        varchar(5) default '00000'           not null comment '현금영수증_VAN사_코드',
    cash_van_contract_no varchar(20)                          null comment '현금영수증_VAN사_계약_번호',
    cash_van_serial_no   varchar(20)                          null comment '현금영수증_VAN사_일련_번호',
    corner_se_code       varchar(1) default 'N'               not null comment '코너_구분_코드',
    cash_issue_at        varchar(1) default 'N'               not null comment '현금영수증_발급_여부',
    init_sale_dt         datetime                             null comment '최초_매출_일시',
    last_sale_dt         datetime                             null comment '최종_매출_일시',
    ware_at              varchar(1) default 'N'               not null comment '창고_여부',
    margin_mgmt_at       varchar(1) default 'N'               not null comment '마진_관리_여부',
    sw_agree_at          varchar(1) default 'N'               not null comment 'SW_동의_여부',
    sw_agree_dt          datetime                             null comment 'SW_동의_일시',
    sw_agree_send_at     varchar(1) default 'N'               not null comment 'SW_동의_전송_여부',
    pos_prog_ver_no      varchar(20)                          null comment '포스_프로그램_버전_번호',
    pos_login_de         int                                  null comment '포스_로그인_일자',
    cdp_high_note        varchar(400)                         null comment 'CDP_상단_비고',
    cdp_low_note         varchar(400)                         null comment 'CDP_하단_비고',
    store_img_info       json                                 null comment '매장_이미지_정보',
    creator              varchar(100)                         not null comment '작성자',
    created_at           timestamp  default CURRENT_TIMESTAMP not null comment '생성_시간',
    updater              varchar(100)                         not null comment '수정자',
    updated_at           timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시간',
    constraint store_unqcode_UNIQUE
        unique (store_unqcode)
)
    charset = utf8mb4;

create table MN_STM_NAMEMGMT
(
    namemgmt_pid      bigint auto_increment comment '명칭관리_배열_순번'
        primary key,
    STORE_UNQCODE     varchar(12)                          not null comment '매장_고유코드',
    fchq_code         varchar(5)                           not null comment '본사_코드',
    namemgmt_grp_code varchar(7)                           not null comment '명칭관리_그룹_코드',
    namemgmt_code     varchar(7)                           not null comment '명칭관리_코드',
    namemgmt_nm       varchar(50)                          not null comment '명칭관리_명',
    etc1_info         varchar(400)                         null comment '기타1_정보',
    etc2_info         varchar(400)                         null comment '기타2_정보',
    use_at            varchar(1) default 'Y'               not null comment '사용_여부',
    default_at        varchar(1) default 'N'               not null comment '기본_여부',
    creator           varchar(100)                         not null comment '작성자',
    created_at        timestamp  default CURRENT_TIMESTAMP not null comment '생성_시간',
    updater           varchar(100)                         not null comment '수정자',
    updated_at        timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시간'
)
    charset = utf8mb4;

create table MN_STM_NAMEMGMT_GRP
(
    namemgmt_grp_pid  bigint auto_increment comment '명칭관리_그룹_순번'
        primary key,
    STORE_UNQCODE     varchar(12)                         not null comment '매장_고유코드',
    fchq_code         varchar(5)                          not null comment '본사_코드',
    namemgmt_grp_code varchar(7)                          not null comment '명칭관리_그룹_코드',
    namemgmt_grp_nm   varchar(50)                         not null comment '명칭관리_그룹_명',
    code_digit_cnt    int                                 not null comment '코드_자리_수',
    creator           varchar(100)                        not null comment '작성자',
    created_at        timestamp default CURRENT_TIMESTAMP not null comment '생성_시간',
    updater           varchar(100)                        not null comment '수정자',
    updated_at        timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시간'
)
    charset = utf8mb4;

create table MN_STM_ORDER
(
    ORDER_PID      bigint auto_increment comment '주문_순번'
        primary key,
    STORE_UNQCODE  varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE      varchar(5)                          not null comment '본사_코드',
    ORDER_UNQNO    varchar(50)                         not null comment '주문_고유번호',
    TABLE_UNQNO    varchar(50)                         not null comment '테이블_고유번호',
    CLOSE_UNQNO    varchar(24)                         not null comment '마감_고유번호',
    CASHIER_UNQNO  varchar(24)                         not null comment '캐셔_고유번호',
    SALES_DE       int                                 not null comment '영업_일자',
    POS_NO         varchar(20)                         not null comment '포스_번호',
    TABLE_GRP_NM   varchar(50)                         not null comment '테이블_그룹_명',
    TABLE_NM       varchar(50)                         not null comment '테이블_명',
    CANCEL_SE_CODE varchar(1)                          not null comment '취소_구분_코드',
    RECEIPT_NO     varchar(20)                         not null comment '영수증_번호',
    CREATOR        varchar(100)                        not null comment '생성자',
    CREATED_AT     timestamp default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER        varchar(100)                        not null comment '수정자',
    UPDATED_AT     timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각',
    constraint uk_mn_stm_order_1
        unique (ORDER_UNQNO)
)
    charset = utf8mb4;

create index idx_mn_stm_order_1
    on MN_STM_ORDER (STORE_UNQCODE);

create index idx_mn_stm_order_2
    on MN_STM_ORDER (FCHQ_CODE);

create index idx_mn_stm_order_3
    on MN_STM_ORDER (ORDER_UNQNO);

create index idx_mn_stm_order_4
    on MN_STM_ORDER (TABLE_UNQNO);

create index idx_mn_stm_order_5
    on MN_STM_ORDER (CLOSE_UNQNO);

create index idx_mn_stm_order_6
    on MN_STM_ORDER (CASHIER_UNQNO);

create index idx_mn_stm_order_7
    on MN_STM_ORDER (SALES_DE);

create index idx_mn_stm_order_8
    on MN_STM_ORDER (CREATED_AT);

create table MN_STM_ORDER_I
(
    ORDER_I_PID      bigint auto_increment comment '주문_아이템_순번'
        primary key,
    ORDER_PID        bigint                              not null comment '주문_순번',
    ORDER_UNQNO      varchar(50)                         not null comment '주문_고유번호',
    STORE_GCODE      varchar(20)                         not null comment '매장_상품코드',
    CLOSE_UNQNO      varchar(24)                         not null comment '마감_고유번호',
    ORDER_SEQ_NO     varchar(20)                         not null comment '주문_순서_번호',
    GOODS_NM         varchar(50)                         not null comment '상품_명',
    ORDER_SE_CODE    varchar(1)                          not null comment '주문_구분_코드',
    ORDER_STT_CODE   varchar(1)                          not null comment '주문_상태_코드',
    ORDER_CNT        int                                 not null comment '주문_수',
    SALE_PRICE       int                                 not null comment '주문_금액',
    DISCOUNT_PRICE   int                                 not null comment '할인_금액',
    MOVE_MSG         varchar(400)                        null comment '이동_메시지',
    ORDER_CANCEL_MSG varchar(400)                        null comment '주문_취소_메시지',
    CREATOR          varchar(100)                        not null comment '생성자',
    CREATED_AT       timestamp default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER          varchar(100)                        not null comment '수정자',
    UPDATED_AT       timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각',
    constraint fk_mn_stm_order_i_o_1
        foreign key (ORDER_PID) references MN_STM_ORDER (ORDER_PID)
)
    charset = utf8mb4;

create index idx_mn_stm_order_i_1
    on MN_STM_ORDER_I (ORDER_UNQNO);

create index idx_mn_stm_order_i_2
    on MN_STM_ORDER_I (STORE_GCODE);

create index idx_mn_stm_order_i_3
    on MN_STM_ORDER_I (CLOSE_UNQNO);

create index idx_mn_stm_order_i_4
    on MN_STM_ORDER_I (CREATED_AT);

create table MN_STM_PRIME_CHG_H
(
    PRIME_CHG_H_PID   bigint auto_increment comment '원가변경_내역_순번'
        primary key,
    STORE_UNQCODE     varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE         varchar(5)                          not null comment '본사_코드',
    STORE_GCODE       varchar(20)                         not null comment '매장_상품코드',
    ORDER_MIN_CNT     int       default 0                 null comment '최소_주문_수',
    INIT_STOCK_CNT    int       default 0                 null comment '기초_재고_수',
    INIT_STOCK_PRICE  int       default 0                 null comment '기초_재고_금액',
    TOTAL_STOCK_CNT   int       default 0                 null comment '총_입고_수',
    TOTAL_STOCK_PRICE int       default 0                 null comment '총_입고_금액',
    BEFORE_PRIME_COST int       default 0                 not null comment '변경전_원가_단가',
    AFTER_PRIME_COST  int       default 0                 not null comment '변경후_원가_단가',
    PRIME_CHG_DT      datetime                            not null comment '원가_변경_일시',
    PRIME_CHG_DE      int                                 not null comment '원가_변경_일자',
    CREATOR           varchar(100)                        not null comment '생성자',
    CREATED_AT        timestamp default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER           varchar(100)                        not null comment '수정자',
    UPDATED_AT        timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create index mn_stm_prime_chg_h_idx
    on MN_STM_PRIME_CHG_H (STORE_UNQCODE, CREATED_AT);

create table MN_STM_SALESPRICE_CHG_H
(
    SALESPRICE_CHG_H_PID bigint auto_increment comment '판매가격_변경_내역_순번'
        primary key,
    STORE_UNQCODE        varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE            varchar(5)                          not null comment '본사_코드',
    STORE_GCODE          varchar(26)                         not null comment '매장_상품코드',
    BEFORE_SALES_PRICE   int                                 not null comment '변경전_판매_가격',
    AFTER_SALES_PRICE    int                                 not null comment '변경후_판매_가격',
    PRICE_CHG_DE         int                                 not null comment '가격_변경_일자',
    SALES_START_DT       datetime                            not null comment '판매_시작_일시',
    SALES_END_DT         datetime                            not null comment '판매_종료_일시',
    HIST_SE_CODE         varchar(1)                          not null comment '내역_구분_코드',
    CREATOR              varchar(100)                        not null comment '생성자',
    CREATED_AT           timestamp default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER              varchar(100)                        not null comment '수정자',
    UPDATED_AT           timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create index mn_stm_salesprice_chg_h_idx
    on MN_STM_SALESPRICE_CHG_H (STORE_UNQCODE, CREATED_AT);

create table MN_STM_SALESPRICE_STT
(
    SALESPRICE_STT_PID bigint auto_increment comment '판매_가격_현황_순번'
        primary key,
    STORE_UNQCODE      varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE          varchar(5)                          not null comment '본사_코드',
    STORE_GCODE        varchar(26)                         not null comment '매장_상품코드',
    POLICY_CODE        varchar(7)                          not null comment '정책_코드',
    POLICY_NM          varchar(50)                         not null comment '정책_명',
    NORMAL_PRICE       int                                 not null comment '정상_금액',
    FORM_SE_CODE       varchar(1)                          not null comment '형태_구분_코드',
    CREATOR            varchar(100)                        not null comment '생성자',
    CREATED_AT         timestamp default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER            varchar(100)                        not null comment '수정자',
    UPDATED_AT         timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create index mn_stm_salesprice_stt_idx
    on MN_STM_SALESPRICE_STT (STORE_UNQCODE, CREATED_AT);

create table MN_STM_SIDE_ATTR
(
    SIDE_ATTR_PID bigint auto_increment comment '사이드메뉴_속성_순번'
        primary key,
    STORE_UNQCODE varchar(12)                          not null comment '매장_고유코드',
    FCHQ_CODE     varchar(5)                           not null comment '본사_코드',
    ATTRGRP_CODE  varchar(3)                           not null comment '속성그룹_코드',
    ATTR_CODE     varchar(3)                           not null comment '속성_코드',
    ATTR_NM       varchar(50)                          not null comment '속셩_명',
    ATTR_SEQ      int                                  not null comment '속셩_순서',
    USE_AT        varchar(1) default 'Y'               not null comment '사용_여부',
    CREATOR       varchar(100)                         not null comment '생성자',
    CREATED_AT    timestamp  default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER       varchar(100)                         not null comment '수정자',
    UPDATED_AT    timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create index mn_stm_side_attr_idx
    on MN_STM_SIDE_ATTR (STORE_UNQCODE, CREATED_AT);

create table MN_STM_SIDE_ATTRGRP
(
    SIDE_ATTRGRP_PID bigint auto_increment comment '사이드메뉴_속성그룹_순번'
        primary key,
    STORE_UNQCODE    varchar(12)                          not null comment '매장_고유코드',
    FCHQ_CODE        varchar(5)                           not null comment '본사_코드',
    ATTRGRP_CODE     varchar(3)                           not null comment '속성그룹_코드',
    ATTRGRP_NM       varchar(50)                          not null comment '속성그룹_명',
    ATTRGRP_SEQ      int                                  not null comment '속성그룹_순서',
    USE_AT           varchar(1) default 'Y'               not null comment '사용_여부',
    CREATOR          varchar(100)                         not null comment '생성자',
    CREATED_AT       timestamp  default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER          varchar(100)                         not null comment '수정자',
    UPDATED_AT       timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create index mn_stm_side_attrgrp_idx
    on MN_STM_SIDE_ATTRGRP (STORE_UNQCODE, CREATED_AT);

create table MN_STM_SIDE_CTG
(
    SIDE_CTG_PID  bigint auto_increment comment '사이드메뉴_분류_순번'
        primary key,
    STORE_UNQCODE varchar(12)                          not null comment '매장_고유코드',
    FCHQ_CODE     varchar(5)                           not null comment '본사_코드',
    CTG_GRP_CODE  varchar(7)                           not null comment '분류_그룹_코드',
    CTG_CODE      varchar(7)                           not null comment '분류_코드',
    CTG_NM        varchar(50)                          not null comment '분류_명',
    LIMIT_CNT     int        default 0                 not null comment '제한_수량',
    ESNTL_AT      varchar(1) default 'N'               not null comment '필수_여부',
    CTG_SEQ       int        default 0                 not null comment '분류_순서',
    USE_AT        varchar(1) default 'Y'               not null comment '사용_여부',
    CREATOR       varchar(100)                         not null comment '생성자',
    CREATED_AT    timestamp  default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER       varchar(100)                         not null comment '수정자',
    UPDATED_AT    timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create index mn_stm_side_ctg_idx
    on MN_STM_SIDE_CTG (STORE_UNQCODE, CREATED_AT);

create table MN_STM_SIDE_GOODS
(
    SIDE_GOODS_PID bigint auto_increment comment '사이드메뉴_상품_순번'
        primary key,
    STORE_UNQCODE  varchar(12)                          not null comment '매장_고유코드',
    FCHQ_CODE      varchar(5)                           not null comment '본사_코드',
    CTG_CODE       varchar(7)                           not null comment '분류_코드',
    SIDE_CODE      varchar(7)                           not null,
    STORE_GCODE    varchar(26)                          not null comment '매장_상품코드',
    ADD_COST       int        default 0                 not null comment '추가_단가',
    GOODS_SEQ      int        default 0                 not null comment '상품_순서',
    USE_AT         varchar(1) default 'Y'               not null comment '사용_여부',
    CREATOR        varchar(100)                         not null comment '생성자',
    CREATED_AT     timestamp  default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER        varchar(100)                         not null comment '수정자',
    UPDATED_AT     timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create index mn_stm_side_goods_idx
    on MN_STM_SIDE_GOODS (STORE_UNQCODE, CREATED_AT);

create table MN_STM_SIDE_GRP
(
    SIDE_GRP_PID  bigint auto_increment comment '사이드메뉴_그룹_순번'
        primary key,
    STORE_UNQCODE varchar(12)                          not null comment '매장_고유코드',
    FCHQ_CODE     varchar(5)                           not null comment '본사_코드',
    GRP_CODE      varchar(7)                           not null comment '그룹_코드',
    GRP_NM        varchar(50)                          not null comment '그룹_명',
    CREATOR       varchar(100)                         not null comment '생성자',
    CREATED_AT    timestamp  default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER       varchar(100)                         not null comment '수정자',
    UPDATED_AT    timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각',
    USE_AT        varchar(1) default 'Y'               not null comment '사용_여부'
)
    charset = utf8mb4;

create index mn_stm_side_grp_idx
    on MN_STM_SIDE_GRP (STORE_UNQCODE, CREATED_AT);

create table MN_STM_STT
(
    STORE_STT_PID   bigint auto_increment comment '매장_현황_순번'
        primary key,
    STORE_UNQCODE   varchar(12)                         not null comment '매장_고유코드',
    STORE_CODE      varchar(7)                          not null comment '매장_코드',
    STORE_NM        varchar(50)                         not null comment '매장_명',
    FCHQ_CODE       varchar(5)                          not null comment '본사_코드',
    FCHQ_NM         varchar(50)                         not null comment '본사_명',
    STT_SE_CODE     varchar(1)                          not null comment '상태_구분_코드',
    INSTALL_POS_CNT int       default 1                 not null comment '설치_포스_수',
    POS_OPEN_DE     int                                 null comment '포스_개점_일자',
    POS_CLOSE_DE    int                                 null comment '포스_폐점_일자',
    CREATOR         varchar(100)                        not null comment '생성자',
    CREATED_AT      timestamp default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER         varchar(100)                        not null comment '수정자',
    UPDATED_AT      timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create table MN_STM_TIME_ZONE
(
    TIME_ZONE_PID int auto_increment comment '시간대_순번'
        primary key,
    STORE_UNQCODE varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE     varchar(5)                          not null comment '본사_코드',
    TIME_ZONE_NM  varchar(50)                         not null comment '시간대_명',
    START_DT      varchar(2)                          not null comment '시작_일시',
    END_DT        varchar(2)                          not null comment '종료_일시',
    CREATOR       varchar(100)                        not null comment '생성자',
    CREATED_AT    timestamp default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER       varchar(100)                        not null comment '수정자',
    UPDATED_AT    timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create index mn_stm_time_zone_idx
    on MN_STM_TIME_ZONE (STORE_UNQCODE);

create table MN_STORE_ACNT_MGMT
(
    STORE_ACNT_MGMT_PID int auto_increment comment '매장_계정_관리_일련번호'
        primary key,
    FCHQ_CODE           varchar(5)                           not null comment '본사_코드',
    STORE_UNQCODE       varchar(12)                          null comment '매장_고유코드',
    VAULTCASH_ACNT_CODE varchar(2)                           not null comment '시재_계정_코드',
    VAULTCASH_ACNT_NM   varchar(50)                          not null comment '시재_계정_명',
    USE_AT              varchar(1) default 'Y'               not null comment '사용_여부',
    RCPPAY_SE_CODE      varchar(1)                           not null comment '입출금_구분_코드',
    CREATOR             varchar(100)                         not null comment '작성자',
    CREATED_AT          timestamp  default CURRENT_TIMESTAMP not null comment '작성일시',
    UPDATER             varchar(100)                         not null comment '수정자',
    UPDATED_AT          timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정일시'
)
    charset = utf8mb4;

create table MN_STORE_BARCODE_PRINT_ENV
(
    BARCODE_PRINT_ENV_PID   bigint auto_increment comment '바코드_출력_환경_순번'
        primary key,
    STORE_UNQCODE           varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE               varchar(5)                          not null comment '본사_코드',
    PRINT_ENV_CODE          varchar(4)                          not null comment '출력_환경_코드',
    PRINTER_TYPE_CODE       varchar(7)                          not null comment '프린터_종류_코드',
    PRINTER_NM              varchar(50)                         not null comment '프린터_명',
    PRINTER_MODE_SE_CODE    varchar(1)                          not null comment '프린터_모드_구분_코드',
    PRINTER_SPD_SE_CODE     varchar(1)                          not null comment '프린터_속도_구분_코드',
    PRINTER_CNCNT_SE_CODE   varchar(1)                          null comment '프린터_농도_구분_코드',
    CUTTER_USE_AT           varchar(1)                          not null comment '커터_사용_여부',
    CUTTING_PAPER_CNT       int                                 null comment '커팅_용지_수',
    CUTTING_HEIGHT          float                               not null comment '커팅_높이',
    PRINT_FORM_SE_CODE      varchar(1)                          not null comment '출력_형태_구분_코드',
    PRINT_DIRECTION_SE_CODE varchar(1)                          not null comment '출력_방향_구분_코드',
    PRINT_LENGTH            float                               null comment '출력_길이',
    PRINT_GAP               float                               not null comment '출력_간격',
    PRINT_WIDTH             float                               not null comment '출력_폭',
    PRINT_HEIGHT            float                               not null comment '출력_높이',
    CREATOR                 varchar(100)                        not null comment '생성자',
    CREATED_AT              timestamp default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER                 varchar(100)                        not null comment '수정자',
    UPDATED_AT              timestamp default CURRENT_TIMESTAMP not null comment '수정_시각'
)
    charset = utf8mb4;

create table MN_STORE_BARCODE_PRINT_JSON
(
    BARCODE_PRINT_JSON_PID bigint auto_increment comment '바코드_출력_JSON_순번'
        primary key,
    STORE_UNQCODE          varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE              varchar(5)                          not null comment '본사_코드',
    PRINT_ENV_CODE         varchar(4)                          not null comment '출력_환경_코드',
    PRINTER_TYPE_CODE      varchar(7)                          not null comment '프린터_종류_코드',
    PRINT_GOODS_NM_JSON    json                                not null comment '출력_상품_명_JSON',
    PRINT_SALE_COST_JSON   json                                not null comment '출력_상품_가격_JSON',
    PRINT_BARCODE1_JSON    json                                not null comment '출력_바코드1_JSON',
    PRINT_BARCODE2_JSON    json                                not null comment '출력_바코드2_JSON',
    PRINT_ETC1_JSON        json                                not null comment '출력_기타1_JSON',
    PRINT_ETC2_JSON        json                                not null comment '출력_기타2_JSON',
    PRINT_ETC3_JSON        json                                not null comment '출력_기타3_JSON',
    PRINT_ETC4_JSON        json                                not null comment '출력_기타4_JSON',
    PRINT_ETC5_JSON        json                                not null comment '출력_기타5_JSON',
    CREATOR                varchar(100)                        not null comment '생성자',
    CREATED_AT             timestamp default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER                varchar(100)                        not null comment '수정자',
    UPDATED_AT             timestamp default CURRENT_TIMESTAMP not null comment '수정_시각'
)
    charset = utf8mb4;

create table MN_STORE_CM_CODE
(
    CM_CODE_PID   bigint auto_increment comment '공통_코드_순번'
        primary key,
    STORE_UNQCODE varchar(12)                          not null comment '매장_고유코드',
    FCHQ_CODE     varchar(5)                           not null comment '본사_코드',
    CODE_GRP      varchar(3)                           not null comment '명칭관리_그룹_코드',
    CODE          varchar(7)                           not null comment '명칭관리_코드',
    CODE_NM       varchar(50)                          not null comment '명칭관리_명',
    CODE_CNTNTS1  varchar(400)                         null comment '기타1_정보',
    CODE_CNTNTS2  varchar(400)                         null comment '기타2_정보',
    USE_AT        varchar(1) default 'Y'               not null comment '사용_여부',
    DEFAULT_AT    varchar(1) default 'Y'               not null,
    CREATOR       varchar(100)                         not null comment '작성자',
    CREATED_AT    timestamp  default CURRENT_TIMESTAMP not null comment '생성_시간',
    UPDATER       varchar(100)                         not null comment '수정자',
    UPDATED_AT    timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시간'
)
    charset = utf8mb4;

create table MN_STORE_CM_CODE_GRP
(
    CM_CODE_GRP_PID bigint auto_increment comment '공통_코드_그룹_순번'
        primary key,
    STORE_UNQCODE   varchar(12)                          not null comment '매장_고유코드',
    FCHQ_CODE       varchar(5)                           not null comment '본사_코드',
    CODE_GRP        varchar(3)                           not null comment '코드_그룹',
    USE_AT          varchar(1) default 'N'               not null comment '사용_여부',
    ENV_CODE        varchar(3)                           null comment '환경_코드',
    CREATOR         varchar(100)                         not null comment '작성자',
    CREATED_AT      timestamp  default CURRENT_TIMESTAMP not null comment '생성_시간',
    UPDATER         varchar(100)                         not null comment '수정자',
    UPDATED_AT      timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시간'
)
    charset = utf8mb4;

create table MN_STORE_CM_CODE_M
(
    CODE_GRP       varchar(3)                           not null comment '코드_그룹'
        primary key,
    CODE_GRP_NM    varchar(50)                          not null comment '코드_그룹_명',
    CODE_DIGIT_CNT int        default 1                 not null comment '코드_자릿_수',
    USE_AT         varchar(1) default 'N'               not null comment '사용_여부',
    ENV_CODE       varchar(3)                           null comment '환경_코드',
    CREATED_AT     timestamp  default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATED_AT     timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create table MN_STORE_CRRNCY_STTN
(
    STORE_CRRNCY_STTN_PID int auto_increment comment '매장_금전_현황_일련번호'
        primary key,
    FCHQ_CODE             varchar(5)                          not null comment '본사_코드',
    STORE_UNQCODE         varchar(12)                         null comment '매장_고유코드',
    STORE_NM              varchar(50)                         not null comment '매장_명',
    SALES_DE              int                                 not null comment '영업_일자',
    POS_NO                varchar(20)                         not null comment '포스_번호',
    RCPPAY_SE_CODE        varchar(1)                          not null comment '입출금_구분_코드',
    VAULTCASH_ACNT_CODE   varchar(7)                          not null comment '시재_계정_코드',
    VAULTCASH_ACNT_NM     varchar(50)                         not null comment '시재_계정_명',
    PRICE                 int                                 not null comment '금액',
    CRRNCY_STTN_NOTE      varchar(400)                        null comment '금전_현황_비고',
    CREATOR               varchar(100)                        not null comment '작성자',
    CREATED_AT            timestamp default CURRENT_TIMESTAMP not null comment '작성일시',
    UPDATER               varchar(100)                        not null comment '수정자',
    UPDATED_AT            timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정일시'
)
    charset = utf8mb4;

create table MN_STORE_GOODS_M
(
    GOODS_PID           bigint auto_increment comment '상품_순번'
        primary key,
    STORE_UNQCODE       varchar(12)                          not null comment '매장_고유코드',
    FCHQ_CODE           varchar(5)                           not null comment '본사_코드',
    STORE_GCODE         varchar(26)                          not null comment '매장_상품코드',
    COST_SE_CODE        varchar(1) default '0'               not null comment '단가_구분_코드',
    GOODS_NM            varchar(50)                          not null comment '상품_명',
    HIGH_CTG_CODE       varchar(2)                           not null comment '대_분류_코드',
    MID_CTG_CODE        varchar(4)                           null comment '중_분류_코드',
    LOW_CTG_CODE        varchar(6)                           null comment '소_분류_코드',
    BRAND_CODE          varchar(7)                           null comment '브랜드_코드',
    STYLE_CODE          varchar(7)                           null comment '스타일_코드',
    YEAR_CODE           varchar(7)                           null comment '연도_코드',
    SEASON_CODE         varchar(7)                           null comment '시즌_코드',
    COLOR_CODE          varchar(7)                           null comment '색상_코드',
    SIZE_CODE           varchar(7)                           null comment '사이즈_코드',
    SIZE_CTG_CODE       varchar(7)                           null comment '사이즈_분류_코드',
    CORNER_CODE         varchar(7)                           null comment '코너_코드',
    VENDOR_CODE         varchar(7)                           null comment '거래처_코드',
    VENDOR_NM           varchar(50)                          null comment '거래처_명',
    BARCODE_VAL         varchar(100)                         null comment '바코드_값',
    SALE_AT             varchar(1) default 'Y'               not null comment '판매_여부',
    SALE_COST           int        default 0                 not null comment '판매_단가',
    PRIME_COST          int        default 0                 null comment '원가_단가',
    SUPPLY_COST         int        default 0                 null comment '공급_단가',
    PACK_ADD_PRICE      int        default 0                 not null comment '포장_추가_금액',
    DLVRY_ADD_PRICE     int        default 0                 not null comment '배달_추가_금액',
    ORDER_AT            varchar(1) default 'Y'               not null comment '주문_여부',
    USE_AT              varchar(1) default 'Y'               not null comment '사용_여부',
    DEPOSIT_USE_AT      varchar(1)                           null comment '보증금_사용_여부',
    DEPOSIT_SE_CODE     varchar(1) default '0'               not null comment '보증금_구분_코드',
    DEPOSIT_PRICE       int        default 0                 not null comment '보증금_금액',
    CUP_DEPOSIT_CODE    varchar(26)                          null comment '컵_보증금_코드',
    CUP_DEPOSIT_USE_AT  varchar(1) default 'N'               not null comment '컵_보증금_사용_여부',
    CUP_DEPOSIT_SE_CODE varchar(1) default 'N'               not null comment '컵_보증금_구분_코드',
    MBR_DISCOUNT_AT     varchar(1) default 'N'               not null comment '회원_할인_여부',
    DISCOUNT_SE_CODE    varchar(10)                          null comment '할인_구분_코드',
    DISCOUNT_AT         varchar(1) default 'N'               not null comment '할인_여부',
    ORDER_SE_CODE       varchar(1) default 'A'               not null comment '주문_구분_코드',
    ORDER_UNIT_CODE     varchar(7)                           null comment '주문_단위_코드',
    ORDER_UNIT_CNT      int                                  null comment '주문_단위_수',
    ORDER_MIN_CNT       int        default 1                 not null comment '주문_최소_수',
    SOLDOUT_AT          varchar(1) default 'N'               not null comment '품절_여부',
    KIOSK_SOLDOUT_AT    varchar(1) default 'N'               not null comment '키오스크_품절_여부',
    MOBILE_SE_CODE      varchar(1) default 'N'               not null comment '모바일_구분_코드',
    PT_SAVE_AT          varchar(1) default 'Y'               not null comment '포인트_적립_여부',
    STAMP_SAVE_AT       varchar(1) default 'N'               not null comment '스템프_적립_여부',
    STAMP_SAVE_CNT      int        default 1                 not null comment '스템프_적립_수',
    STAMP_USE_AT        varchar(1) default 'N'               not null comment '스템프_사용_여부',
    STAMP_USE_CNT       int        default 1                 not null comment '스템프_사용_수',
    STOCK_MGMT_AT       varchar(1) default 'Y'               not null comment '재고_관리_여부',
    INIT_STOCK_CNT      int        default 0                 not null comment '초기_재고_수',
    SAFETY_STOCK_CNT    int        default 1                 not null comment '안전_재고_수',
    INIT_OBTAIN_CNT     int        default 1                 not null comment '초기_입수_수',
    SIDE_MENU_AT        varchar(1) default 'N'               not null comment '사이드_메뉴_여부',
    ATTRGRP_CODE        varchar(3)                           null comment '속성그룹_코드',
    GRP_CODE            varchar(7)                           null comment '그룹_코드',
    TAX_AT              varchar(1) default 'Y'               not null comment '과세_여부',
    TIP_AT              varchar(1) default 'N'               not null comment '봉사료_여부',
    HD_ORDER_AT         varchar(1) default 'N'               not null comment '본사_주문_여부',
    PRICE_CONTROL_AT    varchar(1) default 'Y'               not null comment '가격_통제_여부',
    SET_SE_CODE         varchar(1) default '0'               not null comment '세트_구분_코드',
    FLOOR_PTR_USE_AT    varchar(1) default 'Y'               not null comment '층_프린터_사용_여부',
    FLOOR_PTR_OUT_AT    varchar(1) default 'Y'               not null comment '층_프린터_출력_여부',
    LOCAL_CODE          varchar(7)                           null comment '지역_코드',
    MAPPING_GOODS_CODE  varchar(26)                          null comment '매핑_상품_코드',
    TRS_ITEM_CODE       varchar(7)                           null comment 'TRS_품목_코드',
    GOODS_NOTE          varchar(400)                         null comment '상품_비고',
    GOODS_IMG_INFO      json                                 null comment '상품_이미지_정보',
    CREATOR             varchar(100)                         not null comment '생성자',
    CREATED_AT          timestamp  default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER             varchar(100)                         not null comment '수정자',
    UPDATED_AT          timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create index mn_store_goods_m_idx
    on MN_STORE_GOODS_M (STORE_UNQCODE, STORE_GCODE, CREATED_AT);

create table MN_STORE_GOODS_SET
(
    SET_PID       bigint auto_increment comment '상품_세트_순번'
        primary key,
    STORE_UNQCODE varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE     varchar(5)                          not null comment '본사_코드',
    STORE_GCODE   varchar(26)                         not null comment '매장_상품코드',
    SET_SE_CODE   varchar(1)                          not null comment '세트_구분_코드',
    SET_GCODE     varchar(26)                         not null comment '세트_상품코드',
    SET_GOODS_CNT int       default 1                 not null comment '세트_상품_수',
    SET_GOODS_SEQ int                                 not null comment '세트_상품_순서',
    CREATOR       varchar(100)                        not null comment '생성자',
    CREATED_AT    timestamp default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER       varchar(100)                        not null comment '수정자',
    UPDATED_AT    timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create index mn_store_goods_set_idx
    on MN_STORE_GOODS_SET (STORE_UNQCODE, CREATED_AT);

create table MN_STORE_HOOKING_DLVRY
(
    HOOKING_DLVRY_PID bigint auto_increment comment '후킹_배달_순번'
        primary key,
    STORE_UNQCODE     varchar(12)                          not null comment '매장_고유코드',
    FCHQ_CODE         varchar(5)                           not null comment '본사_코드',
    DI_AT             varchar(1) default 'N'               not null comment '두잇_여부',
    OO_AT             varchar(1) default 'N'               not null comment '땡땡이_여부',
    SH_AT             varchar(1) default 'N'               not null comment '땡겨요_여부',
    KN_AT             varchar(1) default 'N'               not null comment '서구배달_여부',
    YE_AT             varchar(1) default 'N'               not null comment '요기요익스프레스_여부',
    BR_AT             varchar(1) default 'N'               not null comment '배민라이더스_여부',
    TG_AT             varchar(1) default 'N'               not null comment '배달특급_여부',
    MG_AT             varchar(1) default 'N'               not null comment '먹깨비_여부',
    BM_AT             varchar(1) default 'N'               not null comment '배민_여부',
    YG_AT             varchar(1) default 'N'               not null comment '요기요_여부',
    WM_AT             varchar(1) default 'N'               not null comment '위메프오_여부',
    CP_AT             varchar(1) default 'N'               not null comment '쿠팡_여부',
    CREATOR           varchar(100)                         not null comment '생성자',
    CREATED_AT        timestamp  default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER           varchar(100)                         not null comment '수정자',
    UPDATED_AT        timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create table MN_STORE_HOOKING_GOODS
(
    HOOKING_GOODS_PID bigint auto_increment comment '후킹_상품_순번'
        primary key,
    STORE_UNQCODE     varchar(12)                          not null comment '매장_고유코드',
    FCHQ_CODE         varchar(5)                           not null comment '본사_코드',
    STORE_GCODE       varchar(26)                          not null comment '매장_상품코드',
    DLVRY_GCODE       varchar(26)                          not null comment '배달_상품코드',
    DLVRY_GOODS_NM    varchar(50)                          not null comment '배달_상품_명',
    DLVRY_APP_CODE    varchar(2)                           not null comment '배달_앱_코드',
    DI_AT             varchar(1) default 'N'               not null comment '두잇_여부',
    OO_AT             varchar(1) default 'N'               not null comment '땡땡이_여부',
    SH_AT             varchar(1) default 'N'               not null comment '땡겨요_여부',
    KN_AT             varchar(1) default 'N'               not null comment '서구배달_여부',
    YE_AT             varchar(1) default 'N'               not null comment '요기요익스프레스_여부',
    BR_AT             varchar(1) default 'N'               not null comment '배민라이더스_여부',
    TG_AT             varchar(1) default 'N'               not null comment '배달특급_여부',
    MG_AT             varchar(1) default 'N'               not null comment '먹깨비_여부',
    BM_AT             varchar(1) default 'N'               not null comment '배민_여부',
    YG_AT             varchar(1) default 'N'               not null comment '요기요_여부',
    WM_AT             varchar(1) default 'N'               not null comment '위메프오_여부',
    CP_AT             varchar(1) default 'N'               not null comment '쿠팡_여부',
    CREATOR           varchar(100)                         not null comment '생성자',
    CREATED_AT        timestamp  default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER           varchar(100)                         not null comment '수정자',
    UPDATED_AT        timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create table MN_STORE_RECPT
(
    STORE_RECPT_PID    int auto_increment comment '매장_영수증_일련번호'
        primary key,
    STORE_UNQCODE      varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE          varchar(5)                          not null comment '본사_코드',
    ORDER_UNQNO        varchar(50)                         not null comment '주문_고유번호',
    SALES_DE           int                                 not null comment '영업_일자',
    ORDER_MERCHANT_ID  varchar(200)                        not null comment '결제_거래_ID',
    RECPT_UNQNO        varchar(50)                         not null comment '영수증_고유번호',
    POS_NO             varchar(20)                         not null comment '포스_번호',
    SALES_SE_CODE      varchar(1)                          null comment '매출_구분_코드',
    PRDLST_CNT         int                                 null comment '품목_수량',
    TOTAL_SALES_PRICE  int                                 null comment '총_매출_금액',
    TOTAL_DSC_PRICE    int                                 null comment '총_할인_금액',
    NORMAL_DSC_PRICE   int                                 null comment '일반_할인_금액',
    CPN_DSC_PRICE      int                                 null comment '쿠폰_할인_금액',
    ACT_SALES_PRICE    int                                 null comment '실제_매출_금액',
    PRICE              int                                 null comment '가액',
    VAT_PRICE          int                                 null comment '부가_금액',
    PAYMENT_SUM_PRICE  int                                 null comment '결제_합계_금액',
    CSH_PAYMENT_PRICE  int                                 null comment '현금_결제_금액',
    CARD_PAYMENT_PRICE int                                 null comment '카드_결제_금액',
    ETC_PAYMENT_PRICE  int                                 null comment '기타_결제_금액',
    CREATOR            varchar(100)                        not null comment '작성자',
    CREATED_AT         timestamp default CURRENT_TIMESTAMP not null comment '작성일시',
    UPDATER            varchar(100)                        not null comment '수정자',
    UPDATED_AT         timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정일시'
)
    charset = utf8mb4;

create index idx_mn_store_recpt_1
    on MN_STORE_RECPT (STORE_UNQCODE);

create index idx_mn_store_recpt_2
    on MN_STORE_RECPT (ORDER_UNQNO);

create index idx_mn_store_recpt_3
    on MN_STORE_RECPT (SALES_DE);

create table MN_STORE_RECPT_H
(
    STORE_RECPT_H_PID int auto_increment comment '매장_영수증_내역_일련번호'
        primary key,
    STORE_UNQCODE     varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE         varchar(5)                          not null comment '본사_코드',
    RECPT_UNQNO       varchar(50)                         not null comment '영수증_고유번호',
    GOODS_NM          varchar(50)                         not null comment '상품_명',
    CNT               int       default 1                 not null comment '수량',
    NORMAL_PRICE      int                                 null comment '정상_금액',
    SALE_PRICE        int                                 null comment '판매_금액',
    SALES_PRICE       int                                 null comment '매출_금액',
    DSC_PRICE         int                                 null comment '할인_금액',
    NORMAL_DSC_PRICE  int                                 null comment '일반_할인_금액',
    CPN_DSC_PRICE     int                                 null comment '쿠폰_할인_금액',
    CPN_CODE          varchar(7)                          null comment '쿠폰_코드',
    CPN_NM            varchar(50)                         null comment '쿠폰_명',
    ACT_SALES_PRICE   int                                 null comment '실제_매출_금액',
    VAT               int                                 null comment 'VAT',
    CREATOR           varchar(100)                        not null comment '작성자',
    CREATED_AT        timestamp default CURRENT_TIMESTAMP not null comment '작성일시',
    UPDATER           varchar(100)                        not null comment '수정자',
    UPDATED_AT        timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정일시'
)
    charset = utf8mb4;

create index idx_mn_store_recpt_h_1
    on MN_STORE_RECPT_H (STORE_UNQCODE);

create index idx_mn_store_recpt_h_2
    on MN_STORE_RECPT_H (RECPT_UNQNO);

create table MN_STORE_RETURN_MSG
(
    RETURN_MSG_PID bigint auto_increment comment '반품_메시지_순번'
        primary key,
    STORE_UNQCODE  varchar(12)                          not null comment '매장_고유코드',
    FCHQ_CODE      varchar(5)                           not null comment '본사_코드',
    MSG_CODE       varchar(2)                           not null comment '반품_코드',
    MSG_SE_CODE    varchar(1)                           not null comment '반품_구분_코드',
    RETURN_MSG     varchar(200)                         not null comment '반품_메시지',
    USE_AT         varchar(1) default 'Y'               not null comment '사용_여부',
    CREATOR        varchar(100)                         not null comment '작성자',
    CREATED_AT     timestamp  default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER        varchar(100)                         not null comment '수정자',
    UPDATED_AT     timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create table MN_STORE_STOCK_H
(
    STOCK_H_PID     bigint auto_increment comment '재고_내역_순번'
        primary key,
    STORE_UNQCODE   varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE       varchar(5)                          not null comment '본사_코드',
    STOCK_DE        int                                 not null comment '재고_일자',
    HIST_SE_CODE    varchar(1)                          not null comment '내역_구분_코드',
    STOCK_CNT       int                                 not null comment '재고_수',
    AFTER_STOCK_CNT int                                 not null comment '변경_재고_수',
    CREATOR         varchar(100)                        not null comment '생성자',
    CREATED_AT      timestamp default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER         varchar(100)                        not null comment '수정자',
    UPDATED_AT      timestamp default CURRENT_TIMESTAMP not null comment '수정_시각'
)
    charset = utf8mb4;

create index mn_store_stock_h_idx
    on MN_STORE_STOCK_H (CREATED_AT);

create table MN_STORE_STOCK_M
(
    GOODS_PID            bigint auto_increment comment '상품_순번'
        primary key,
    STORE_UNQCODE        varchar(12)                          not null comment '매장_고유코드',
    FCHQ_CODE            varchar(5)                           not null comment '본사_코드',
    STORE_GCODE          varchar(26)                          not null comment '매장_상품코드',
    CRNT_STOCK_CNT       int        default 0                 not null comment '현재_재고_수',
    IN_CNT               int        default 0                 not null comment '입고_수',
    IN_PRICE             int        default 0                 null comment '입고_금액',
    OUT_CNT              int        default 0                 not null comment '반품_수',
    OUT_PRICE            int        default 0                 null comment '반품_금액',
    STORE_SALE_CNT       int        default 0                 not null comment '매장_판매_수',
    STORE_SALE_PRICE     int        default 0                 null comment '매장_판매_금액',
    STOCK_DISPOSAL_CNT   int        default 0                 not null comment '재고_폐기_수',
    STOCK_DISPOSAL_PRICE int        default 0                 null comment '재고_폐기_금액',
    STOCK_ADJS_CNT       int        default 0                 not null comment '재고_조정_수',
    STOCK_ADJS_PRICE     int        default 0                 null comment '재고_조정_금액',
    SET_STOCK_CNT        int        default 0                 not null comment '세트_조정_수',
    SET_STOCK_PRICE      int        default 0                 null comment '세트_조정_금액',
    HIST_SE_CODE         varchar(1) default '0'               not null comment '내역_구분_코드',
    STOCK_DE             int                                  null comment '재고_일자',
    INIT_STOCK_DE        int                                  null comment '최초_입고_일자',
    LAST_STOCK_DE        int                                  null comment '최종_입고_일자',
    INIT_SALE_DE         int                                  null comment '최초_판매_일자',
    LAST_SALE_DE         int                                  null comment '최종_판매_일자',
    CREATOR              varchar(100)                         not null comment '생성자',
    CREATED_AT           timestamp  default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER              varchar(100)                         not null comment '수정자',
    UPDATED_AT           timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create index mn_store_stock_stt_idx
    on MN_STORE_STOCK_M (CREATED_AT);

create table MN_STORE_STOCK_MGMT
(
    STOCK_MGMT_PID bigint auto_increment comment '재고_관리_순번'
        primary key,
    STORE_UNQCODE  varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE      varchar(5)                          not null comment '본사_코드',
    MGMT_SE_CODE   varchar(1)                          not null comment '관리_구분_코드',
    PRGRS_SE_CODE  varchar(1)                          not null comment '진행_구분_코드',
    STOCK_MGMT_SEQ int                                 not null comment '재고_관리_순서',
    MGMT_SBJCT_NM  varchar(50)                         not null comment '관리_제목_명',
    REG_CNT        int       default 0                 not null comment '등록_수',
    ADJS_CNT       int       default 0                 null comment '조정_수',
    STOCK_MGMT_DE  int                                 not null comment '재고_관리_일자',
    REG_DE         int                                 not null comment '등록_일자',
    CONF_DE        int                                 null comment '확정_일자',
    CREATOR        varchar(100)                        not null comment '생성자',
    CREATED_AT     timestamp default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER        varchar(100)                        not null comment '수정자',
    UPDATED_AT     timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create index mn_store_stock_mgmt_idx
    on MN_STORE_STOCK_MGMT (CREATED_AT);

create table MN_STORE_STOCK_MGMT_GOODS
(
    STOCK_MGMT_GOODS_PID bigint auto_increment comment '재고_관리_상품_순번'
        primary key,
    STORE_UNQCODE        varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE            varchar(5)                          not null comment '본사_코드',
    STORE_GCODE          varchar(26)                         not null comment '매장_상품코드',
    STOCK_MGMT_DE        int                                 not null comment '재고_관리_일자',
    STOCK_MGMT_SEQ       int                                 not null comment '재고_관리_순서',
    MGMT_SE_CODE         varchar(1)                          not null comment '관리_구분_코드',
    MGMT_GOODS_CNT       int                                 not null comment '관리_상품_수',
    MGMT_GOODS_NOTE      varchar(400)                        null comment '관리_상품_비고',
    CREATOR              varchar(100)                        not null comment '생성자',
    CREATED_AT           timestamp default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER              varchar(100)                        not null comment '수정자',
    UPDATED_AT           timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create index mn_store_stock_mgmt_goods_idx
    on MN_STORE_STOCK_MGMT_GOODS (CREATED_AT);

create table MN_STORE_STOCK_SET_H
(
    SET_STOCK_PID     bigint auto_increment comment '세트_재고_순번'
        primary key,
    STORE_UNQCODE     varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE         varchar(5)                          not null comment '본사_코드',
    STORE_GCODE       varchar(26)                         not null comment '매장_상품코드',
    REGI_DE           int                                 not null comment '등록_일자',
    SET_STOCK_SE_CODE varchar(1)                          not null comment '세트_재고_구분_코드',
    SET_STOCK_CNT     int       default 0                 not null comment '세트_재고_수',
    CREATOR           varchar(100)                        not null comment '생성자',
    CREATED_AT        timestamp default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER           varchar(100)                        not null comment '수정자',
    UPDATED_AT        timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create table MN_STORE_TABLEORDER_GOODS
(
    TABLEORDER_GOODS_PID      bigint auto_increment comment '테이블오더_상품_순번'
        primary key,
    STORE_UNQCODE             varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE                 varchar(5)                          not null comment '본사_코드',
    TABLEORDER_GOODS_GRP_CODE varchar(7)                          not null comment '테이블오더_상품_그룹_코드',
    STORE_GCODE               varchar(26)                         not null comment '상품_코드',
    TABLEORDER_GOODS_SEQ      int       default 1                 not null comment '테이블오더_상품_순서',
    CREATOR                   varchar(100)                        not null comment '작성자',
    CREATED_AT                timestamp default CURRENT_TIMESTAMP not null comment '생성시간',
    UPDATER                   varchar(100)                        not null comment '수정자',
    UPDATED_AT                timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '변경시간'
)
    charset = utf8mb4;

create table MN_STORE_TABLEORDER_GOODS_GRP
(
    TABLEORDER_GOODS_GRP_PID  bigint auto_increment comment '테이블오더_상품_그룹_순번'
        primary key,
    STORE_UNQCODE             varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE                 varchar(5)                          not null comment '본사_코드',
    TABLEORDER_GOODS_GRP_CODE varchar(7)                          not null comment '테이블오더_상품_그룹_코드',
    TABLEORDER_GOODS_GRP_NM   varchar(50)                         not null comment '테이블오더_상품_그룹_명',
    TABLEORDER_GOODS_GRP_SEQ  int       default 1                 not null comment '테이블오더_상품_그룹_순서',
    CREATOR                   varchar(100)                        not null comment '생성자',
    CREATED_AT                timestamp default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER                   varchar(100)                        not null comment '수정자',
    UPDATED_AT                timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create table MN_STORE_VENDOR
(
    VENDOR_PID     bigint auto_increment comment '거래처_순번'
        primary key,
    STORE_UNQCODE  varchar(12)                          not null comment '매장_고유코드',
    FCHQ_CODE      varchar(5)                           not null comment '본사_코드',
    VENDOR_CODE    varchar(7)                           not null comment '거래처_코드',
    VENDOR_NM      varchar(50)                          not null comment '거래처_명',
    VENDOR_REP_NM  varchar(50)                          not null comment '거래처_대표자_명',
    VENDOR_SE_CODE varchar(7) default '7510001'         not null comment '거래처_구분_코드',
    VENDOR_USE_AT  varchar(1) default 'Y'               not null comment '거래처_사용_여부',
    VENDOR_VAT_AT  varchar(1) default 'N'               not null comment '거래처_부가세_여부',
    VENDOR_CORPNO  varchar(10)                          null comment '거래처_사업자번호',
    VENDOR_TYPE_NM varchar(50)                          null comment '거래처_업태_명',
    VENDOR_ITEM_NM varchar(50)                          null comment '거래처_종목_명',
    VENDOR_TELNO   varchar(20)                          null comment '거래처_전화번호',
    VENDOR_CELNO   varchar(20)                          null comment '거래처_핸드폰',
    VENDOR_FAXNO   varchar(20)                          null comment '거래처_팩스',
    VENDOR_EMAIL   varchar(100)                         null comment '거래처_이메일',
    VENDOR_POSTNO  varchar(5)                           null comment '거래처_우편번호',
    ROADNM_ADRES   varchar(100)                         null comment '도로명_주소',
    DETAIL_ADRES   varchar(100)                         null comment '상세_주소',
    VENDOR_NOTE    varchar(400)                         null comment '거래처_비고',
    CREATOR        varchar(100)                         not null comment '생성자',
    CREATED_AT     timestamp  default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER        varchar(100)                         not null comment '수정자',
    UPDATED_AT     timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create index mn_goods_vendor_idx
    on MN_STORE_VENDOR (STORE_UNQCODE, CREATED_AT);

create table MN_STORE_VENDOR_GOODS
(
    VENDOR_GOODS_PID bigint auto_increment comment '거래처_상품_순번'
        primary key,
    STORE_UNQCODE    varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE        varchar(5)                          not null comment '본사_코드',
    VENDOR_CODE      varchar(7)                          not null comment '거래처_코드',
    STORE_GCODE      varchar(26)                         not null comment '매장_상품코드',
    CREATOR          varchar(100)                        not null comment '생성자',
    CREATED_AT       timestamp default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER          varchar(100)                        not null comment '수정자',
    UPDATED_AT       timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create index mn_store_vendor_goods_idx
    on MN_STORE_VENDOR_GOODS (STORE_UNQCODE);

create table MN_STORE_VENDOR_INOUT
(
    VENDOR_INOUT_PID bigint auto_increment comment '거래처_입반출_순번'
        primary key,
    STORE_UNQCODE    varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE        varchar(5)                          not null comment '본사_코드',
    INOUT_NO         varchar(8)                          not null comment '입반출_번호',
    INOUT_SE_CODE    varchar(1)                          not null comment '입출_구분_코드',
    VENDOR_CODE      varchar(7)                          not null comment '거래처_코드',
    PRGRS_SE_CODE    varchar(1)                          not null comment '진행_구분_코드',
    ORDER_SE_CODE    varchar(1)                          not null comment '발주_구분_코드',
    ORDER_NO         varchar(8)                          null comment '발주_번호',
    PAY_NO           int                                 null comment '지급_순서',
    REQ_DE           int                                 not null comment '요청_일자',
    INOUT_NOTE       varchar(400)                        null comment '입출_비고',
    REG_CNT          int       default 0                 null,
    REG_DT           datetime                            not null comment '등록_일시',
    REG_NM           varchar(30)                         not null comment '등록자_명',
    CONF_DT          datetime                            null comment '확정_일시',
    CONF_NM          varchar(30)                         null comment '확정자_명',
    TOTAL_CNT        int       default 0                 null comment '총_수량',
    TOTAL_PRICE      int       default 0                 null comment '총_금액',
    PAY_PRICE        int       default 0                 null comment '지급_금액',
    CREATOR          varchar(100)                        not null comment '생성자',
    CREATED_AT       timestamp default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER          varchar(100)                        not null comment '수정자',
    UPDATED_AT       timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create index mn_store_vendor_inout_idx
    on MN_STORE_VENDOR_INOUT (CREATED_AT);

create table MN_STORE_VENDOR_INOUT_I
(
    VENDOR_INOUT_I_PID bigint auto_increment comment '거래처_입반출_상품_순번'
        primary key,
    STORE_UNQCODE      varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE          varchar(5)                          not null comment '본사_코드',
    INOUT_NO           varchar(8)                          not null comment '입출_번호',
    ORDER_NO           varchar(8)                          null comment '발주_번호',
    STORE_GCODE        varchar(26)                         not null comment '매장_상품코드',
    PRIME_COST         int       default 0                 not null comment '원가_단가',
    GOODS_CNT          int       default 0                 not null comment '상품_수',
    CREATOR            varchar(100)                        not null comment '생성자',
    CREATED_AT         timestamp default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER            varchar(100)                        not null comment '수정자',
    UPDATED_AT         timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create index mn_store_vendor_inout_i_idx
    on MN_STORE_VENDOR_INOUT_I (CREATED_AT);

create table MN_STORE_VENDOR_ORDER
(
    VENDOR_ORDER_PID  bigint auto_increment comment '거래처_발주_현황_순번'
        primary key,
    STORE_UNQCODE     varchar(12)                          not null comment '매장_고유코드',
    FCHQ_CODE         varchar(5)                           not null comment '본사_코드',
    VENDOR_CODE       varchar(7)                           not null comment '거래처_코드',
    ORDER_NO          varchar(8)                           not null comment '발주_번호',
    PRGRS_SE_CODE     varchar(1)                           null comment '진행_구분_코드',
    ORDER_TYPE_CODE   varchar(7)                           not null comment '발주_타입_코드',
    ORDER_DE          int                                  not null comment '발주_일자',
    STOCK_REQ_DE      int                                  not null comment '입고_요청_일자',
    ORDER_NOTE        varchar(400)                         null comment '발주_비고',
    REG_CNT           int        default 0                 null comment '등록_수',
    REG_DT            datetime                             not null comment '등록_일시',
    REG_NM            varchar(30)                          not null comment '등록자',
    CONF_DT           datetime                             null comment '확정_일시',
    CONF_NM           varchar(30)                          null comment '확정자',
    COMPT_DT          datetime                             null comment '완료_일시',
    COMPT_NM          varchar(30)                          null comment '완료자',
    NON_ORDER_SEQ     int                                  null comment '무발주_순서',
    NON_ORDER_AT      varchar(1) default 'N'               not null comment '무발주_여부',
    TOTAL_ORDER_CNT   int        default 0                 null comment '총_발주_수',
    TOTAL_ORDER_PRICE int        default 0                 null comment '총_발주_금액',
    TOTAL_STOCK_CNT   int        default 0                 null comment '총_입고_수',
    TOTAL_STOCK_PRICE int        default 0                 null comment '총_입고_금액',
    INIT_STOCK_DE     int                                  null comment '최초_입고_일자',
    LAST_STOCK_DE     int                                  null comment '최종_입고_일자',
    CREATOR           varchar(100)                         not null comment '생성자',
    CREATED_AT        timestamp  default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER           varchar(100)                         not null comment '수정자',
    UPDATED_AT        timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create index mn_store_vendor_order_stt_idx
    on MN_STORE_VENDOR_ORDER (CREATED_AT);

create table MN_STORE_VENDOR_ORDER_GOODS
(
    VENDOR_ORDER_GOODS_PID bigint auto_increment comment '거래처_발주_상품_순번'
        primary key,
    STORE_UNQCODE          varchar(12)                         not null comment '매장_고유코드',
    FCHQ_CODE              varchar(5)                          not null comment '본사_코드',
    ORDER_NO               varchar(8)                          not null comment '발주_번호',
    STORE_GCODE            varchar(26)                         not null comment '매장_상품코드',
    PRIME_COST             int       default 0                 not null comment '원가_단가',
    GOODS_CNT              int       default 0                 not null comment '상품_수',
    CREATOR                varchar(100)                        not null comment '생성자',
    CREATED_AT             timestamp default CURRENT_TIMESTAMP not null comment '생성_시각',
    UPDATER                varchar(100)                        not null comment '수정자',
    UPDATED_AT             timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '수정_시각'
)
    charset = utf8mb4;

create index mn_store_order_goods_idx
    on MN_STORE_VENDOR_ORDER_GOODS (CREATED_AT);

create table MN_WEATHER_GLOBAL_COOR
(
    GLOBAL_CODE    varchar(7)  not null comment '해외_코드'
        primary key,
    GLOBAL_CITY_NM varchar(50) not null comment '도시_명',
    GLOBAL_X_VAL   varchar(20) not null comment '지역_X_값',
    GLOBAL_Y_VAL   varchar(20) not null comment '지역_Y_값'
)
    charset = utf8mb4;

create table MN_WEATHER_INFO
(
    WEATHER_INFO_PID       bigint auto_increment comment '날씨_정보_순번'
        primary key,
    LOCAL_CODE             varchar(7)                          not null comment '지역_코드',
    TODAY_DE               int                                 not null comment '오늘_일자',
    TODAY_LOWTMP_VAL       varchar(50)                         not null comment '오늘_최저기온_값',
    TODAY_HIGHTMP_VAL      varchar(50)                         not null comment '오늘_최고기온_값',
    TODAY_SKY_VAL          varchar(50)                         not null comment '오늘_날씨_값',
    TODAY_AIR_VAL          varchar(50)                         null comment '오늘_미세먼지_값',
    TODAY_ULTRA_AIR_VAL    varchar(50)                         null comment '오늘_초_미세먼지_값',
    TOMORROW_DE            int                                 not null comment '내일_일자',
    TOMORROW_LOWTMP_VAL    varchar(50)                         not null comment '내일_최저기온_값',
    TOMORROW_HIGHTMP_VAL   varchar(50)                         not null comment '내일_최고기온_값',
    TOMORROW_SKY_VAL       varchar(50)                         not null comment '내일_날씨_값',
    TOMORROW_AIR_VAL       varchar(50)                         null comment '내일_미세먼지_값',
    TOMORROW_ULTRA_AIR_VAL varchar(50)                         null comment '내일_초_미세먼지_값',
    CREATED_AT             timestamp default CURRENT_TIMESTAMP not null,
    UPDATED_AT             timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP
)
    charset = utf8mb4;

create table MN_WEATHER_LOCAL_COOR
(
    LOCAL_CODE  varchar(7) not null comment '지역_코드',
    LOCAL_X_VAL varchar(3) not null comment '지역_X_값',
    LOCAL_Y_VAL varchar(3) not null comment '지역_Y_값'
)
    charset = utf8mb4;

