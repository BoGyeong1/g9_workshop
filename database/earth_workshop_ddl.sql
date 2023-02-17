CREATE DATABASE earth_workshop DEFAULT CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI;

use earth_workshop;

SET sql_mode='';

CREATE TABLE ADDRESSES
(
  USER_UID     VARCHAR(255) NOT NULL COMMENT '사용자 UID',
  ADDRESS_UID  VARCHAR(255) NOT NULL COMMENT '주소 UID',
  ADDRESS_NAME VARCHAR(255) NOT NULL COMMENT '주소별명',
  ZIP_CODE     VARCHAR(255) NOT NULL COMMENT '우편번호',
  ADDRESS      VARCHAR(255) NOT NULL COMMENT '기본주소',
  DETAIL       VARCHAR(255) NULL     COMMENT '상세주소',
  EXPOSURE     VARCHAR(255) NOT NULL COMMENT '노출여부',
  PRIMARY KEY (ADDRESS_UID)
) COMMENT '주소들';

CREATE TABLE ADMINS
(
  ADMIN_UID  VARCHAR(255) NOT NULL COMMENT '어드민 UID',
  ID         VARCHAR(255) NOT NULL COMMENT 'ID',
  PASSWORD   VARCHAR(255) NOT NULL COMMENT 'PASSWORD',
  ADMIN_NAME VARCHAR(255) NOT NULL COMMENT '관리자명',
  NICKNAME   VARCHAR(255) NOT NULL COMMENT '별명',
  PRIMARY KEY (ADMIN_UID)
) COMMENT '관리자들';

CREATE TABLE BRANDS
(
  BRAND_UID  VARCHAR(255) NOT NULL COMMENT '브랜드 UID',
  BRAND_NAME VARCHAR(255) NOT NULL COMMENT '브랜드명',
  PRIMARY KEY (BRAND_UID)
) COMMENT '브랜드들';

CREATE TABLE CANCELLED_ORDERS
(
  CANCELLED_ORDER_UID VARCHAR(255) NOT NULL COMMENT '취소 주문 UID',
  REASON_UID          VARCHAR(255) NOT NULL COMMENT '사유 UID',
  ORDER_DETAIL_UID    VARCHAR(255) NOT NULL COMMENT '주문 세부 내역 UID',
  PRIMARY KEY (CANCELLED_ORDER_UID)
) COMMENT '취소 주문들';

CREATE TABLE CANCELLED_REASONS
(
  REASON_UID VARCHAR(255) NOT NULL COMMENT '사유 UID',
  REASON     VARCHAR(255) NOT NULL COMMENT '사유 내용',
  EXPOSURE   VARCHAR(255) NOT NULL COMMENT '노출여부',
  PRIMARY KEY (REASON_UID)
) COMMENT '취소 사유들';

CREATE TABLE CARTS
(
  CART_UID    VARCHAR(255) NOT NULL COMMENT '장바구니 UID',
  USER_UID    VARCHAR(255) NOT NULL COMMENT '사용자 UID',
  PRODUCT_UID VARCHAR(255) NOT NULL COMMENT '상품 UID',
  QUANTITY    INTEGER      NOT NULL COMMENT '수량',
  PRIMARY KEY (CART_UID)
) COMMENT '장바구니들';

CREATE TABLE CATEGORIES
(
  CATEGORY_UID  VARCHAR(255) NOT NULL COMMENT '카테고리 UID',
  CATEGORY_NAME VARCHAR(255) NOT NULL COMMENT '카테고리명',
  PRIMARY KEY (CATEGORY_UID)
) COMMENT '카테고리들';

CREATE TABLE DELIVERY_LOCATIONS
(
  DELIVERY_LOCATION_UID VARCHAR(255) NOT NULL COMMENT '배송장소  UID',
  DELIVERY_LOCATION     VARCHAR(255) NOT NULL COMMENT '배송장소명',
  EXPOSURE              VARCHAR(255) NOT NULL COMMENT '노출여부',
  PRIMARY KEY (DELIVERY_LOCATION_UID)
) COMMENT '배송장소들';

CREATE TABLE EVENT_BANNERS
(
  EVENT_BANNER_UID   VARCHAR(255) NOT NULL COMMENT '이벤트 배너 UID',
  EVENT_UID          VARCHAR(255) NOT NULL COMMENT '이벤트 UID',
  ORIGIN_FILE_NAME   VARCHAR(255) NOT NULL COMMENT '원본 파일 이름',
  PHYSICAL_FILE_NAME VARCHAR(255) NOT NULL COMMENT '저장 파일 이름',
  DIRECTORY_NAME     VARCHAR(255) NOT NULL COMMENT '디렉토리 이름',
  PRIMARY KEY (EVENT_BANNER_UID)
) COMMENT '이벤트 베너들';

CREATE TABLE EVENT_DETAILS
(
  EVENT_UID      VARCHAR(255) NOT NULL COMMENT '이벤트 UID',
  ADMIN_UID      VARCHAR(255) NOT NULL COMMENT '어드민 UID',
  CREATE_DATE    TIMESTAMP    NOT NULL COMMENT '작성 날짜',
  START_DATE     TIMESTAMP    NOT NULL COMMENT '시작 날짜',
  END_DATE       TIMESTAMP    NOT NULL COMMENT '종료 날짜',
  URL            VARCHAR(255) NOT NULL COMMENT '랜딩 URL',
  EXPOSURE       VARCHAR(255) NOT NULL COMMENT '노출여부',
  EXPOSURE_ORDER INTEGER      NOT NULL COMMENT '노출 순서',
  PRIMARY KEY (EVENT_UID)
) COMMENT '이벤트들';

CREATE TABLE EXCHANGE_ORDERS
(
  EXCHANGE_ORDER_UID VARCHAR(255) NOT NULL COMMENT '교환 주문 UID',
  ORDER_DETAIL_UID   VARCHAR(255) NOT NULL COMMENT '주문 세부 내역 UID',
  REASON_UID         VARCHAR(255) NOT NULL COMMENT '사유 UID',
  REASON_DETAIL      VARCHAR(255) NULL     COMMENT '상세 사유',
  PRIMARY KEY (EXCHANGE_ORDER_UID)
) COMMENT '교환 주문들';

CREATE TABLE FAQS
(
  FAQ_UID              VARCHAR(255) NOT NULL COMMENT 'FAQ UID',
  INQUIRY_CATEGORY_UID VARCHAR(255) NOT NULL COMMENT '문의 카테고리 UID',
  ADMIN_UID            VARCHAR(255) NOT NULL COMMENT '어드민 UID',
  TITLE                VARCHAR(255) NOT NULL COMMENT 'FAQ 제목',
  CONTENT              VARCHAR(255) NOT NULL COMMENT 'FAQ 내용',
  UPDATE_DATE          TIMESTAMP    NOT NULL COMMENT '업데이트 날짜',
  PRIMARY KEY (FAQ_UID)
) COMMENT 'FAQ';

CREATE TABLE FAVORITES
(
  USER_UID    VARCHAR(255) NOT NULL COMMENT '사용자 UID',
  PRODUCT_UID VARCHAR(255) NOT NULL COMMENT '상품 UID'
) COMMENT '찜목록';

CREATE TABLE INQUIRY_CATEGORIES
(
  INQUIRY_CATEGORY_UID VARCHAR(255) NOT NULL COMMENT '문의 카테고리 UID',
  CATEGORY_NAME        VARCHAR(255) NOT NULL COMMENT '카테고리명',
  PRIMARY KEY (INQUIRY_CATEGORY_UID)
) COMMENT '문의 카테고리들';

CREATE TABLE LOGISTICS
(
  LOGISTICS_UID  VARCHAR(255) NOT NULL COMMENT '택배사 UID',
  LOGISTICS_NAME VARCHAR(255) NOT NULL COMMENT '택배사명',
  PRIMARY KEY (LOGISTICS_UID)
) COMMENT '택배사들';

CREATE TABLE ORDER_CONDITIONS
(
  ORDER_CONDITION_UID VARCHAR(255) NOT NULL COMMENT '상태 UID',
  CONDITION_NAME      VARCHAR(255) NOT NULL COMMENT '상태',
  PRIMARY KEY (ORDER_CONDITION_UID)
) COMMENT '주문 상태들';

CREATE TABLE ORDER_DETAILS
(
  ORDER_DETAIL_UID    VARCHAR(255) NOT NULL COMMENT '주문 세부 내역 UID',
  ORDER_UID           VARCHAR(255) NOT NULL COMMENT '주문 UID',
  PRODUCT_UID         VARCHAR(255) NOT NULL COMMENT '상품 UID',
  QUANTITY            INTEGER      NOT NULL COMMENT '주문 수량',
  PRICE               INTEGER      NOT NULL COMMENT '가격',
  ORDER_CONDITION_UID VARCHAR(255) NOT NULL COMMENT '상태 UID',
  WAYBILL_UID         VARCHAR(255) NOT NULL COMMENT '운송장 UID',
  PRIMARY KEY (ORDER_DETAIL_UID)
) COMMENT '주문 세부 사항들';

CREATE TABLE ORDERS
(
  ORDER_UID             VARCHAR(255) NOT NULL COMMENT '주문 UID',
  USER_UID              VARCHAR(255) NOT NULL COMMENT '사용자 UID',
  ADDRESS_UID           VARCHAR(255) NOT NULL COMMENT '주소 UID',
  DELIVERY_LOCATION_UID VARCHAR(255) NOT NULL COMMENT '배송장소  UID',
  PAYMENT_METHOD_UID    VARCHAR(255) NOT NULL COMMENT '결제수단 UID',
  ORDER_DATE            TIMESTAMP    NOT NULL COMMENT '주문 날짜',
  RECIPIENT_NAME        VARCHAR(255) NOT NULL COMMENT '수령인 이름',
  RECIPIENT_TEL         VARCHAR(255) NOT NULL COMMENT '수령인 연락처',
  PRIMARY KEY (ORDER_UID)
) COMMENT '주문내역들';

CREATE TABLE ORIGINS
(
  ORIGIN_UID  VARCHAR(255) NOT NULL COMMENT '원산지 UID',
  ORIGIN_NAME VARCHAR(255) NOT NULL COMMENT '원산지명',
  PRIMARY KEY (ORIGIN_UID)
) COMMENT '원산지들';

CREATE TABLE PAYMENT_METHODS
(
  PAYMENT_METHOD_UID VARCHAR(255) NOT NULL COMMENT '결제수단 UID',
  PAYMENT_METHOD     VARCHAR(255) NOT NULL COMMENT '결제수단명',
  PRIMARY KEY (PAYMENT_METHOD_UID)
) COMMENT '결제수단';

CREATE TABLE POST_CATEGOIES
(
  POST_CATEGORY_UID VARCHAR(255) NOT NULL COMMENT '게시판 카테고리 UID',
  CATEGORY_NAME     VARCHAR(255) NOT NULL COMMENT '게시판 카테고리명',
  PRIMARY KEY (POST_CATEGORY_UID)
) COMMENT '게시판 카테고리들';

CREATE TABLE POSTS
(
  POST_UID          VARCHAR(255) NOT NULL COMMENT '게시글 UID',
  POST_CATEGORY_UID VARCHAR(255) NOT NULL COMMENT '게시판 카테고리 UID',
  ADMIN_UID         VARCHAR(255) NOT NULL COMMENT '어드민 UID',
  TITLE             VARCHAR(255) NOT NULL COMMENT '게시글 제목',
  CONTENT           VARCHAR(255) NOT NULL COMMENT '게시글 내용',
  CREATE_DATE       TIMESTAMP    NOT NULL COMMENT '작성 날짜',
  MODIFIED_DATE     TIMESTAMP    NOT NULL COMMENT '수정 날짜',
  PRIMARY KEY (POST_UID)
) COMMENT '게시글 목록를';

CREATE TABLE PRIVATE_INQUIRIES
(
  PRIVATE_INQUIRY_UID  VARCHAR(255) NOT NULL COMMENT '일대일 문의 UID',
  USER_UID             VARCHAR(255) NOT NULL COMMENT '사용자 UID',
  INQUIRY_CATEGORY_UID VARCHAR(255) NOT NULL COMMENT '문의 카테고리 UID',
  TITLE                VARCHAR(255) NOT NULL COMMENT '문의 제목',
  CONTENT              VARCHAR(255) NOT NULL COMMENT '문의 내용',
  CREATE_DATE          VARCHAR(255) NOT NULL COMMENT '작성일자',
  PRIMARY KEY (PRIVATE_INQUIRY_UID)
) COMMENT '일대일 문의들';

CREATE TABLE PRIVATE_INQUIRY_ANSWERS
(
  PRIVATE_INQUIRY_ANSWER_UID VARCHAR(255) NOT NULL COMMENT '일대일 문의 답변 UID',
  PRIVATE_INQUIRY_UID        VARCHAR(255) NOT NULL COMMENT '일대일 문의 UID',
  ADMIN_UID                  VARCHAR(255) NOT NULL COMMENT '어드민 UID',
  CONTENT                    VARCHAR(255) NOT NULL COMMENT '답변 내용',
  CREATE_DATE                VARCHAR(255) NOT NULL COMMENT '작성 날짜',
  PRIMARY KEY (PRIVATE_INQUIRY_ANSWER_UID)
) COMMENT '일대일 문의 응답들';

CREATE TABLE PRODUCT_DETAIL_IMGS
(
  DETAIL_IMG_UID     VARCHAR(255) NOT NULL COMMENT '상품 상세 이미지 UID',
  PRODUCT_UID        VARCHAR(255) NOT NULL COMMENT '상품 UID',
  ORIGIN_FILE_NAME   VARCHAR(255) NOT NULL COMMENT '원본 파일 이름',
  PHYSICAL_FILE_NAME VARCHAR(255) NOT NULL COMMENT '저장 파일 이름',
  DIRECTORY_NAME     VARCHAR(255) NOT NULL COMMENT '디렉토리 이름',
  EXPOSURE_ORDER     INTEGER      NOT NULL COMMENT '순서',
  PRIMARY KEY (DETAIL_IMG_UID)
) COMMENT '상품 상세 이미지들';

CREATE TABLE PRODUCT_IMGS
(
  IMG_UID            VARCHAR(255) NOT NULL COMMENT '상품 이미지 UID',
  PRODUCT_UID        VARCHAR(255) NOT NULL COMMENT '상품 UID',
  ORIGIN_FILE_NAME   VARCHAR(255) NOT NULL COMMENT '원본 파일 이름',
  PHYSICAL_FILE_NAME VARCHAR(255) NULL     COMMENT '저장 파일 이름',
  DIRECTORY_NAME     VARCHAR(255) NOT NULL COMMENT '디렉토리 이름',
  EXPOSURE_ORDER     INTEGER      NOT NULL COMMENT '순서',
  PRIMARY KEY (IMG_UID)
) COMMENT '상품 이미지들';

CREATE TABLE PRODUCT_INQUIRIES
(
  PRODUCT_INQUIRY_UID VARCHAR(255) NOT NULL COMMENT '상품 문의 UID',
  USER_UID            VARCHAR(255) NOT NULL COMMENT '사용자 UID',
  PRODUCT_UID         VARCHAR(255) NOT NULL COMMENT '상품 UID',
  CONTENT             VARCHAR(255) NOT NULL COMMENT '문의 내용',
  CREATE_DATE         TIMESTAMP    NOT NULL COMMENT '작성 날짜',
  PRIMARY KEY (PRODUCT_INQUIRY_UID)
) COMMENT '상품별 문의들';

CREATE TABLE PRODUCT_INQUIRY_ANSWERS
(
  PRODUCT_INQUIRY_ANSWER_UID VARCHAR(255) NOT NULL COMMENT '상품 문의 응답 UID',
  PRODUCT_INQUIRY_UID        VARCHAR(255) NOT NULL COMMENT '상품 문의 UID',
  CONTENT                    VARCHAR(255) NOT NULL COMMENT '답변 내용',
  CREATE_DATE                TIMESTAMP    NOT NULL COMMENT '작성 날짜',
  ADMIN_UID                  VARCHAR(255) NOT NULL COMMENT '어드민 UID',
  PRIMARY KEY (PRODUCT_INQUIRY_ANSWER_UID)
) COMMENT '상품 문의 응답들';

CREATE TABLE PRODUCTS
(
  PRODUCT_UID   VARCHAR(255) NOT NULL COMMENT '상품 UID',
  CATEGORY_UID  VARCHAR(255) NOT NULL COMMENT '카테고리 UID',
  PURPOSE_UID   VARCHAR(255) NOT NULL COMMENT '사용용도 UID',
  BRAND_UID     VARCHAR(255) NOT NULL COMMENT '브랜드 UID',
  ORIGIN_UID    VARCHAR(255) NOT NULL COMMENT '원산지 UID',
  PRODUCT_NAME  VARCHAR(255) NOT NULL COMMENT '상품명',
  PRODUCT_DESC  VARCHAR(255) NOT NULL COMMENT '상품 간략 설명',
  PRICE         INTEGER      NOT NULL COMMENT '가격',
  DISCOUNT_RATE INTEGER      NOT NULL COMMENT '할인율',
  STOCK         INTEGER      NOT NULL COMMENT '재고',
  CREATE_DATE   TIMESTAMP    NOT NULL COMMENT '등록 날짜',
  PRIMARY KEY (PRODUCT_UID)
) COMMENT '상품들';

CREATE TABLE PURPOSES
(
  PURPOSE_UID  VARCHAR(255) NOT NULL COMMENT '사용용도 UID',
  PURPOSE_NAME VARCHAR(255) NULL     COMMENT '용도명',
  PRIMARY KEY (PURPOSE_UID)
) COMMENT '사용용도들';

CREATE TABLE REFUND_EXCHANGE_REASONS
(
  REASON_UID VARCHAR(255) NOT NULL COMMENT '사유 UID',
  REASON     VARCHAR(255) NOT NULL COMMENT '사유 내용',
  EXPOSURE   VARCHAR(255) NOT NULL COMMENT '노출여부',
  PRIMARY KEY (REASON_UID)
) COMMENT '교환 환불 사유들';

CREATE TABLE REFUND_ORDERS
(
  REFUND_ORDER_UID VARCHAR(255) NOT NULL COMMENT '환불 주문 UID',
  ORDER_DETAIL_UID VARCHAR(255) NOT NULL COMMENT '주문 세부 내역 UID',
  REASON_UID       VARCHAR(255) NOT NULL COMMENT '사유 UID',
  REASON_DETAIL    VARCHAR(255) NULL     COMMENT '상세 사유',
  PRIMARY KEY (REFUND_ORDER_UID)
) COMMENT '환불 주문들';

CREATE TABLE REVIEWS
(
  REVIEW_UID       VARCHAR(255) NOT NULL COMMENT '리뷰 UID',
  PRODUCT_UID      VARCHAR(255) NOT NULL COMMENT '상품 UID',
  RATING           INTEGER      NOT NULL COMMENT '별점',
  CONTENT          VARCHAR(255) NULL     COMMENT '리뷰내용',
  CREATE_DATE      TIMESTAMP    NOT NULL COMMENT '작성 날짜',
  ORDER_DETAIL_UID VARCHAR(255) NOT NULL COMMENT '주문 세부 내역 UID',
  PRIMARY KEY (REVIEW_UID)
) COMMENT '리뷰들';

CREATE TABLE USER_CONDITIONS
(
  USER_CONDITION_UID VARCHAR(255) NOT NULL COMMENT '상태 UID',
  CONDITION_NAME     VARCHAR(255) NOT NULL COMMENT '상태명',
  PRIMARY KEY (USER_CONDITION_UID)
) COMMENT '회원 상태들';

CREATE TABLE USERS
(
  USER_UID           VARCHAR(255) NOT NULL COMMENT '사용자 UID',
  EMAIL              VARCHAR(255) NOT NULL COMMENT '이메일',
  USER_NAME          VARCHAR(255) NOT NULL COMMENT '이름',
  PASSWORD           VARCHAR(255) NOT NULL COMMENT '비밀번호',
  TEL                VARCHAR(255) NOT NULL COMMENT '휴대폰번호',
  EMAIL_INFO_AGREE   VARCHAR(255) NOT NULL COMMENT '이메일 수신 동의',
  TEL_INFO_AGREE     VARCHAR(255) NOT NULL COMMENT '휴대폰 수신 동의',
  POINT              INTEGER      NOT NULL COMMENT '보유 포인트',
  JOIN_DATE          TIMESTAMP    NOT NULL COMMENT '가입 날짜',
  USER_CONDITION_UID VARCHAR(255) NOT NULL COMMENT '상태 UID',
  PRIMARY KEY (USER_UID)
) COMMENT '사용자들';

CREATE TABLE WAYBILL_TYPES
(
  WAYBILL_TYPE_UID VARCHAR(255) NOT NULL COMMENT '운송장 타입 UID',
  WAYBILL_TYPE     VARCHAR(255) NOT NULL COMMENT '운송장 타입',
  PRIMARY KEY (WAYBILL_TYPE_UID)
) COMMENT '운송장 타입';

CREATE TABLE WAYBILLS
(
  WAYBILL_UID      VARCHAR(255) NOT NULL COMMENT '운송장 UID',
  LOGISTICS_UID    VARCHAR(255) NOT NULL COMMENT '택배사 UID',
  WAYBILL_TYPE_UID VARCHAR(255) NOT NULL COMMENT '운송장 타입 UID',
  WAYBILL_CODE     VARCHAR(255) NOT NULL COMMENT '운송장 번호',
  PRIMARY KEY (WAYBILL_UID)
) COMMENT '운송장 정보들';

ALTER TABLE ADDRESSES
  ADD CONSTRAINT FK_USERS_TO_ADDRESSES
    FOREIGN KEY (USER_UID)
    REFERENCES USERS (USER_UID);

ALTER TABLE PRODUCTS
  ADD CONSTRAINT FK_CATEGORIES_TO_PRODUCTS
    FOREIGN KEY (CATEGORY_UID)
    REFERENCES CATEGORIES (CATEGORY_UID);

ALTER TABLE PRODUCTS
  ADD CONSTRAINT FK_PURPOSES_TO_PRODUCTS
    FOREIGN KEY (PURPOSE_UID)
    REFERENCES PURPOSES (PURPOSE_UID);

ALTER TABLE PRODUCTS
  ADD CONSTRAINT FK_BRANDS_TO_PRODUCTS
    FOREIGN KEY (BRAND_UID)
    REFERENCES BRANDS (BRAND_UID);

ALTER TABLE PRODUCTS
  ADD CONSTRAINT FK_ORIGINS_TO_PRODUCTS
    FOREIGN KEY (ORIGIN_UID)
    REFERENCES ORIGINS (ORIGIN_UID);

ALTER TABLE PRODUCT_IMGS
  ADD CONSTRAINT FK_PRODUCTS_TO_PRODUCT_IMGS
    FOREIGN KEY (PRODUCT_UID)
    REFERENCES PRODUCTS (PRODUCT_UID);

ALTER TABLE FAVORITES
  ADD CONSTRAINT FK_USERS_TO_FAVORITES
    FOREIGN KEY (USER_UID)
    REFERENCES USERS (USER_UID);

ALTER TABLE FAVORITES
  ADD CONSTRAINT FK_PRODUCTS_TO_FAVORITES
    FOREIGN KEY (PRODUCT_UID)
    REFERENCES PRODUCTS (PRODUCT_UID);

ALTER TABLE ORDERS
  ADD CONSTRAINT FK_USERS_TO_ORDERS
    FOREIGN KEY (USER_UID)
    REFERENCES USERS (USER_UID);

ALTER TABLE ORDERS
  ADD CONSTRAINT FK_ADDRESSES_TO_ORDERS
    FOREIGN KEY (ADDRESS_UID)
    REFERENCES ADDRESSES (ADDRESS_UID);

ALTER TABLE PRODUCT_DETAIL_IMGS
  ADD CONSTRAINT FK_PRODUCTS_TO_PRODUCT_DETAIL_IMGS
    FOREIGN KEY (PRODUCT_UID)
    REFERENCES PRODUCTS (PRODUCT_UID);

ALTER TABLE ORDER_DETAILS
  ADD CONSTRAINT FK_ORDERS_TO_ORDER_DETAILS
    FOREIGN KEY (ORDER_UID)
    REFERENCES ORDERS (ORDER_UID);

ALTER TABLE ORDER_DETAILS
  ADD CONSTRAINT FK_PRODUCTS_TO_ORDER_DETAILS
    FOREIGN KEY (PRODUCT_UID)
    REFERENCES PRODUCTS (PRODUCT_UID);

ALTER TABLE FAQS
  ADD CONSTRAINT FK_INQUIRY_CATEGORIES_TO_FAQS
    FOREIGN KEY (INQUIRY_CATEGORY_UID)
    REFERENCES INQUIRY_CATEGORIES (INQUIRY_CATEGORY_UID);

ALTER TABLE POSTS
  ADD CONSTRAINT FK_POST_CATEGOIES_TO_POSTS
    FOREIGN KEY (POST_CATEGORY_UID)
    REFERENCES POST_CATEGOIES (POST_CATEGORY_UID);

ALTER TABLE EVENT_BANNERS
  ADD CONSTRAINT FK_EVENT_DETAILS_TO_EVENT_BANNERS
    FOREIGN KEY (EVENT_UID)
    REFERENCES EVENT_DETAILS (EVENT_UID);

ALTER TABLE PRODUCT_INQUIRIES
  ADD CONSTRAINT FK_USERS_TO_PRODUCT_INQUIRIES
    FOREIGN KEY (USER_UID)
    REFERENCES USERS (USER_UID);

ALTER TABLE PRODUCT_INQUIRIES
  ADD CONSTRAINT FK_PRODUCTS_TO_PRODUCT_INQUIRIES
    FOREIGN KEY (PRODUCT_UID)
    REFERENCES PRODUCTS (PRODUCT_UID);

ALTER TABLE PRODUCT_INQUIRY_ANSWERS
  ADD CONSTRAINT FK_PRODUCT_INQUIRIES_TO_PRODUCT_INQUIRY_ANSWERS
    FOREIGN KEY (PRODUCT_INQUIRY_UID)
    REFERENCES PRODUCT_INQUIRIES (PRODUCT_INQUIRY_UID);

ALTER TABLE PRIVATE_INQUIRIES
  ADD CONSTRAINT FK_USERS_TO_PRIVATE_INQUIRIES
    FOREIGN KEY (USER_UID)
    REFERENCES USERS (USER_UID);

ALTER TABLE PRIVATE_INQUIRIES
  ADD CONSTRAINT FK_INQUIRY_CATEGORIES_TO_PRIVATE_INQUIRIES
    FOREIGN KEY (INQUIRY_CATEGORY_UID)
    REFERENCES INQUIRY_CATEGORIES (INQUIRY_CATEGORY_UID);

ALTER TABLE PRIVATE_INQUIRY_ANSWERS
  ADD CONSTRAINT FK_PRIVATE_INQUIRIES_TO_PRIVATE_INQUIRY_ANSWERS
    FOREIGN KEY (PRIVATE_INQUIRY_UID)
    REFERENCES PRIVATE_INQUIRIES (PRIVATE_INQUIRY_UID);

ALTER TABLE REVIEWS
  ADD CONSTRAINT FK_PRODUCTS_TO_REVIEWS
    FOREIGN KEY (PRODUCT_UID)
    REFERENCES PRODUCTS (PRODUCT_UID);

ALTER TABLE CARTS
  ADD CONSTRAINT FK_USERS_TO_CARTS
    FOREIGN KEY (USER_UID)
    REFERENCES USERS (USER_UID);

ALTER TABLE CARTS
  ADD CONSTRAINT FK_PRODUCTS_TO_CARTS
    FOREIGN KEY (PRODUCT_UID)
    REFERENCES PRODUCTS (PRODUCT_UID);

ALTER TABLE REVIEWS
  ADD CONSTRAINT FK_ORDER_DETAILS_TO_REVIEWS
    FOREIGN KEY (ORDER_DETAIL_UID)
    REFERENCES ORDER_DETAILS (ORDER_DETAIL_UID);

ALTER TABLE REFUND_ORDERS
  ADD CONSTRAINT FK_ORDER_DETAILS_TO_REFUND_ORDERS
    FOREIGN KEY (ORDER_DETAIL_UID)
    REFERENCES ORDER_DETAILS (ORDER_DETAIL_UID);

ALTER TABLE EXCHANGE_ORDERS
  ADD CONSTRAINT FK_ORDER_DETAILS_TO_EXCHANGE_ORDERS
    FOREIGN KEY (ORDER_DETAIL_UID)
    REFERENCES ORDER_DETAILS (ORDER_DETAIL_UID);

ALTER TABLE REFUND_ORDERS
  ADD CONSTRAINT FK_REFUND_EXCHANGE_REASONS_TO_REFUND_ORDERS
    FOREIGN KEY (REASON_UID)
    REFERENCES REFUND_EXCHANGE_REASONS (REASON_UID);

ALTER TABLE EXCHANGE_ORDERS
  ADD CONSTRAINT FK_REFUND_EXCHANGE_REASONS_TO_EXCHANGE_ORDERS
    FOREIGN KEY (REASON_UID)
    REFERENCES REFUND_EXCHANGE_REASONS (REASON_UID);

ALTER TABLE FAQS
  ADD CONSTRAINT FK_ADMINS_TO_FAQS
    FOREIGN KEY (ADMIN_UID)
    REFERENCES ADMINS (ADMIN_UID);

ALTER TABLE PRIVATE_INQUIRY_ANSWERS
  ADD CONSTRAINT FK_ADMINS_TO_PRIVATE_INQUIRY_ANSWERS
    FOREIGN KEY (ADMIN_UID)
    REFERENCES ADMINS (ADMIN_UID);

ALTER TABLE PRODUCT_INQUIRY_ANSWERS
  ADD CONSTRAINT FK_ADMINS_TO_PRODUCT_INQUIRY_ANSWERS
    FOREIGN KEY (ADMIN_UID)
    REFERENCES ADMINS (ADMIN_UID);

ALTER TABLE POSTS
  ADD CONSTRAINT FK_ADMINS_TO_POSTS
    FOREIGN KEY (ADMIN_UID)
    REFERENCES ADMINS (ADMIN_UID);

ALTER TABLE EVENT_DETAILS
  ADD CONSTRAINT FK_ADMINS_TO_EVENT_DETAILS
    FOREIGN KEY (ADMIN_UID)
    REFERENCES ADMINS (ADMIN_UID);

ALTER TABLE USERS
  ADD CONSTRAINT FK_USER_CONDITIONS_TO_USERS
    FOREIGN KEY (USER_CONDITION_UID)
    REFERENCES USER_CONDITIONS (USER_CONDITION_UID);

ALTER TABLE ORDERS
  ADD CONSTRAINT FK_DELIVERY_LOCATIONS_TO_ORDERS
    FOREIGN KEY (DELIVERY_LOCATION_UID)
    REFERENCES DELIVERY_LOCATIONS (DELIVERY_LOCATION_UID);

ALTER TABLE ORDERS
  ADD CONSTRAINT FK_PAYMENT_METHODS_TO_ORDERS
    FOREIGN KEY (PAYMENT_METHOD_UID)
    REFERENCES PAYMENT_METHODS (PAYMENT_METHOD_UID);

ALTER TABLE ORDER_DETAILS
  ADD CONSTRAINT FK_ORDER_CONDITIONS_TO_ORDER_DETAILS
    FOREIGN KEY (ORDER_CONDITION_UID)
    REFERENCES ORDER_CONDITIONS (ORDER_CONDITION_UID);

ALTER TABLE CANCELLED_ORDERS
  ADD CONSTRAINT FK_ORDER_DETAILS_TO_CANCELLED_ORDERS
    FOREIGN KEY (ORDER_DETAIL_UID)
    REFERENCES ORDER_DETAILS (ORDER_DETAIL_UID);

ALTER TABLE CANCELLED_ORDERS
  ADD CONSTRAINT FK_CANCELLED_REASONS_TO_CANCELLED_ORDERS
    FOREIGN KEY (REASON_UID)
    REFERENCES CANCELLED_REASONS (REASON_UID);

ALTER TABLE WAYBILLS
  ADD CONSTRAINT FK_LOGISTICS_TO_WAYBILLS
    FOREIGN KEY (LOGISTICS_UID)
    REFERENCES LOGISTICS (LOGISTICS_UID);

ALTER TABLE WAYBILLS
  ADD CONSTRAINT FK_WAYBILL_TYPES_TO_WAYBILLS
    FOREIGN KEY (WAYBILL_TYPE_UID)
    REFERENCES WAYBILL_TYPES (WAYBILL_TYPE_UID);

ALTER TABLE ORDER_DETAILS
  ADD CONSTRAINT FK_WAYBILLS_TO_ORDER_DETAILS
    FOREIGN KEY (WAYBILL_UID)
    REFERENCES WAYBILLS (WAYBILL_UID);
