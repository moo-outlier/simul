<h2 align="center">Outlier Cmm Cloud</h2>
<p align="center">Outlier Cmm Cloud 패키지입니다.</p>

## cmmcloud 사용시 주의점
- [cmmcloud](https://github.com/BazerHanMinSu/cmmcloud) 에서 git clone 받아서 사용
  - /src/main/java 디렉토리에서 git clone https://github.com/BazerHanMinSu/cmmcloud.git
  - 이후에 cmmcloud가 업데이트 될 때마다 해당 디렉토리로 이동해서 git pull (cmmcloud-helper.sh 사용)
  - cbm프로젝트의 경우 임시로 버전을 분기해서 관리한다. (git pull할때도 cbm브랜치에서 pull)


## Release History

---
> ## v2.0.2 (2024-04-02)
> #### 추가 및 수정 내역:
> - 없음
> #### 버그 픽스 내역:
> - CamelLinkedHashMap 클래스 사용시 이미 카멜케이스인 문자열이 다르게 적용되는 현상 수정
>
> ## v2.0.1 (2024-03-25)
> #### 추가 및 수정 내역:
> - cbm ApiService Header 구성 로직 변경 GP -> CBM
> - cbm CommonUtil checkHeaderAndPutRequestData 메소드 CBM 프로젝트에 맞게 설정 (storeUnqcode 삭제)
> - RestTemplateConfig Request Factory 변경
> #### 버그 픽스 내역:
> - 없음
>
> ## v2.0.0 (2024-03-07)
> #### 추가 및 수정 내역:
> - cbm 프로젝트용 브랜치 분기
> - cbm 프로젝트용 cmmcloud 재구성
> - CamelLinkedHashMap 생성
> #### 버그 픽스 내역:
> - 없음
>
> ## v1.0.29 (2023-10-12)
>
> #### 추가 및 수정 내역:
>
> - 여러매장 API 버전 업데이트 기능 추가
> #### 버그 픽스 내역:
> - 없음
> ## v1.0.28 (2023-10-05)
>
> #### 추가 및 수정 내역:
>
> - CustomExceptionHandler 모니터링 기능 수정
> #### 버그 픽스 내역:
> - 없음
> ## v1.0.27 (2023-09-14)
>
> #### 추가 및 수정 내역:
>
> - CustomExceptionHandler 모니터링 메일 전송 기능 추가
> #### 버그 픽스 내역:
> - 없음
> ## v1.0.26 (2023-08-28)
>
> #### 추가 및 수정 내역:
>
> - ApiService GET 요청 Body에 담아서 보내는 메소드 추가
> #### 버그 픽스 내역:
> - 없음
> ## v1.0.25 (2023-08-14)
>
> #### 추가 및 수정 내역:
>
> - AES256Util 클래스 추가
> #### 버그 픽스 내역:
> - 없음
> ## v1.0.24 (2023-08-08)
>
> #### 추가 및 수정 내역:
>
> - CommonUtil getUserNmInHeaders 메소드 추가
> #### 버그 픽스 내역:
> - 없음
> ## v1.0.23 (2023-07-27)
>
> #### 추가 및 수정 내역:
>
> - ApiService 헤더 넘길때 'x-real-ip' 넘기도록 추가
> #### 버그 픽스 내역:
> - 없음

> ## v1.0.22 (2023-07-25)
>
> #### 추가 및 수정 내역:
>
> - 포스 클라이언트 마스터 API 버전 업데이트 메소드 변경
    >   - 단일 업데이트, 다중 업데이트 메소드 오버로딩
> #### 버그 픽스 내역:
> - 없음
> ## v1.0.21 (2023-07-24)
>
> #### 추가 및 수정 내역:
>
> - 포스 클라이언트 마스터 API 버전 업데이트 서비스 수정
> #### 버그 픽스 내역:
> - 버전 업데이트 엔드포인트 수정
> ## v1.0.20 (2023-07-17)
>
> #### 추가 및 수정 내역:
>
> - 포스 클라이언트 마스터 API 버전 업데이트 서비스 추가
    >   - PosClientApi Enum 추가
    >   - PosClientService 추가
> #### 버그 픽스 내역:
> - 없음
> ## v1.0.19 (2023-07-07)
>
> #### 추가 및 수정 내역:
>
> - ExceptionError Enum 추가
    >   - SQLNonTransientConnectionException
> #### 버그 픽스 내역:
> - 없음
> ## v1.0.18 (2023-06-27)
>
> #### 추가 및 수정 내역:
>
> - RestTemplateConfig Request Factory 변경
    >   - PATCH api 적용
> - CustomException 추가
    >   - Transaction을 위한 CustomException 추가
> #### 버그 픽스 내역:
> - ApiService 헤더 할당 로직 수정
    >   - PostMan 기본 헤더로 인한 서버 API 헤더 오류 수정
> ## v1.0.17 (2023-06-15)
>
> #### 추가 및 수정 내역:
>
> - 헤더체크 로직 변경
    >   - 본사코드 7자리에서 5자리로 변경
> #### 버그 픽스 내역:
> - 없음
> ## v1.0.16 (2023-06-13)
>
> #### 추가 및 수정 내역:
>
> - Request 로그 기능 수정
    >   - CommonUtil 헤더체크 메소드에서 로그 기능 제거
    >   - Filter에서 GP 헤더, Param, Body 로그 기능 추가
> #### 버그 픽스 내역:
> - 없음
> ## v1.0.15 (2023-06-01)
>
> #### 추가 및 수정 내역:
>
> - RestTemplate ApiService 기본 헤더 설정 변경
> #### 버그 픽스 내역:
> - 없음
> ## v1.0.14 (2023-05-23)
>
> #### 추가 및 수정 내역:
>
> - ExceptionUtil 클래스 추가
    >   - getResObjByException 메소드 추가
> #### 버그 픽스 내역:
> - 없음
> ## v1.0.13 (2023-05-16)
>
> #### 추가 및 수정 내역:
>
> - CheckDuplicateKeyAtInsert 메소드 추가
> - CheckDuplicateKeyAtUpdateOrDelete 메소드 추가
> #### 버그 픽스 내역:
> - 없음
> ## v1.0.12 (2023-05-11)
>
> #### 추가 및 수정 내역:
>
> - EtcError 예외 추가
    >   - DUPLICATED_DATA_IN_BODY
    >   - NOT_EXIST_DATA_IN_BODY
> - RequestError 예외 추가
    >   - DUPLICATED_DATA
> #### 버그 픽스 내역:
> - 없음
> ## v1.0.11 (2023-04-04)
>
> #### 추가 및 수정 내역:
>
> - ApiService 변경
    >   - Get API Call 쿼리스트링 Map으로 넘기도록 메소드 오버로딩
> - checkHeaderAndPutData 메소드 Deprecated
> #### 버그 픽스 내역:
> - 없음
> ## v1.0.10 (2023-03-15)
>
> #### 추가 및 수정 내역:
>
> - ApiService 변경
> #### 버그 픽스 내역:
> - 없음
> ## v1.0.9 (2023-02-20)
>
> #### 추가 및 수정 내역:
>
> - convertIntegerByPagingCondition 페이징 공통 메소드 추가
> - RequestError 예외 추가
    >   - NOT_ENOUGH_QUERY_PAGING_FIELD
    >   - WRONG_PAGING_FIELD
> - 페이징 recordSize 0일경우 기본값 return 하도록 수정
> #### 버그 픽스 내역:
> - 없음
> ## v1.0.8 (2023-02-09)
>
> #### 추가 및 수정 내역:
>
> - Filter 파일업로드인 경우 제외 로직 추가
> - getNowDts 공통 함수 추가
> - 페이징 recordSize 0일경우 기본값 return 하도록 수정
> #### 버그 픽스 내역:
> - 없음
> ## v1.0.7 (2023-01-12)
>
> #### 추가 및 수정 내역:
>
> - 헤더 검증 메소드 신규 버전 생성 (checkHeaderAndPutRequestData)
    >   - 기존 API들을 전부 수정해야 하므로 신규 버전 메소드 생성
    >   - 신규 API들은 신규 버전 사용 및 기존 API들은 순차적으로 추후 적용
> #### 버그 픽스 내역:
> - 없음
> ## v1.0.6 (2023-01-09)
>
> #### 추가 및 수정 내역:
>
> - 매장고유코드 key 변경
    >   - storeUnqcode -> storeUnqcode
> - Header, Body, Param 입력받은 값 로그 추가
> #### 버그 픽스 내역:
> - 없음
> ## v1.0.5 (2023-01-05)
>
> #### 추가 및 수정 내역:
>
> - ReadableRequestWrapper 수정
    >   - body를 obj로 한번 더 감싸던 방식 제거
> - 매장고유코드 key 변경
    >   - storeUnqcode -> storeUnqcode
> #### 버그 픽스 내역:
> - 없음
> ## v1.0.4 (2022-12-22)
>
> #### 추가 및 수정 내역:
>
> - getNowDe 공통 메소드 생성
> - getNowDt 공통 메소드 생성
> - AuthError 예외 추가
    >   - WITHRAWAL_USER
>
> #### 버그 픽스 내역:
> - 없음
> ## v1.0.3 (2022-12-20)
>
> #### 추가 및 수정 내역:
>
> - checkHeaderAndPutData 메소드 권한, 메뉴코드도 가져오도록 수정
> - isDateTimeFormat 공통 메소드 생성
> - compareDateTime 공통 메소드 생성
> - EtcError 예외 추가
    >   - IS_NOT_DATE_FORMAT
    >   - TWO_VALUES_DIFFERENT_LENGTH
>   - START_DATE_GREATER_THAN_END_DATE
>
> #### 버그 픽스 내역:
> - 없음
> ## v1.0.2 (2022-12-06)
>
> #### 추가 및 수정 내역:
>
> - checkHeaderAndPutData 공통 메소드 생성
> - EtcError 예외 추가
    >   - WRONG_STORE_UNQCODE
> - ApiService 생성
>
> #### 버그 픽스 내역:
> - 없음
> ## v1.0.1 (2022-11-22)
>
> #### 추가 및 수정 내역:
>
> - 페이징 defaultRecordSize 20으로 설정
> - RestTemplate, Transaction Config 생성
> - ApiService 생성
>
> #### 버그 픽스 내역:
> - 없음
> ## v1.0.0 (2022-11-17)
> 
> #### 추가 및 수정 내역:
> 
> - 초기 패키지 생성
> 
> #### 버그 픽스 내역:
> - 없음
> 
