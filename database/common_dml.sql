INSERT INTO USER_CONDITIONS
VALUES ('UC1', '정상'),
('UC2', '휴면'),
('UC3', '탈퇴');

INSERT INTO USERS
VALUES ('U1', 'email1@email.com', '유저1', 'password1', '010-0000-0000', 'YES', 'YES', 0, sysdate(), 'UC1', 'USER'),
('U2', 'email2@email.com', '유저2', 'password2', '010-0000-0000', 'YES', 'YES', 0, sysdate(), 'UC1', 'USER'),
('U3', 'email3@email.com', '유저3', 'password3', '010-0000-0000', 'YES', 'YES', 0, sysdate(), 'UC1', 'USER'),
('U4', 'email4@email.com', '유저4', 'password4', '010-0000-0000', 'YES', 'YES', 0, sysdate(), 'UC1', 'USER'),
('U5', 'email5@email.com', '유저5', 'password5', '010-0000-0000', 'YES', 'YES', 0, sysdate(), 'UC1', 'USER');

INSERT INTO ADDRESSES
VALUES ('U1', 'ADR1', '집', '12345', '서울시 강남구 689-10', '3층', 'YES'),
('U2', 'ADR2', '집', '12345', '서울시 강남구 689-10', '3층', 'YES'),
('U3', 'ADR3', '집', '12345', '서울시 강남구 689-10', '3층', 'YES'),
('U4', 'ADR4', '집', '12345', '서울시 강남구 689-10', '3층', 'YES'),
('U5', 'ADR5', '집', '12345', '서울시 강남구 689-10', '3층', 'YES');

INSERT INTO DELIVERY_LOCATIONS
VALUES ('DL1', '문 앞', 'YES'),
('DL2', '직접 받고 부재 시 문 앞', 'YES'),
('DL3', '경비실', 'YES'),
('DL4', '택배함', 'YES');

INSERT INTO LOGISTICS
VALUES ('L1', '롯데택배'),
('L2', '한진택배'),
('L3', '로젠택배'),
('L4', '우체국택배');

INSERT INTO WAYBILL_TYPES
VALUES ('WAY1', '배송'),
('WAY2', '반송');

INSERT INTO CANCELLED_REASONS
VALUES ('CR1', '단순변심', 'YES'),
('CR2', '다른 상품 추가', 'YES'),
('CR3', '결제 수단 변경', 'YES')
('CR4', '기타', 'YES');

INSERT INTO REFUND_EXCHANGE_REASONS
VALUES ('RE1', '단순변심', 'YES'),
('RE2', '다른 상품이 배송됨', 'YES'),
('RE3', '상품의 구성품/부속품 누락', 'YES'),
('RE4', '상품이 설명과 다름', 'YES'),
('RE5', '상품이 파손되어 배송됨', 'YES'),
('RE6', '상품에 결함/기능에 이상이 있음', 'YES');

INSERT INTO ORDER_CONDITIONS
VALUES ('OC1', '상품준비중'),
('OC2', '배송중'),
('OC3', '배송완료'),
('OC4', '취소완료'),
('OC5', '교환진행중'),
('OC6', '환불진행중'),
('OC7', '교환완료'),
('OC8', '환불완료');

INSERT INTO CATEGORIES
VALUES ('C1', 'PAPPER' ),
('C2', 'FABRIC'),
('C3', 'PLASTIC'),
('C4', 'GLASS'),
('C5', 'ETC');

INSERT INTO PURPOSES
VALUES ('P1', 'LIVING'),
('P2', 'KITCHEN'),
('P3', 'STATIONERY'),
('P4', 'ACCESSORIES'),
('P5', 'ETC');

INSERT INTO BRANDS
VALUES ('B1', '지구공방');

INSERT INTO ORIGINS
VALUES ('O1', '상세페이지 참조'),
('O2', '대한민국'),
('O3', '미국'),
('O4', '영국'),
('O5', '프랑스'),
('O6', '독일');

INSERT INTO INQUIRY_CATEGORIES
VALUES ('IC1', '배송문의'),
('IC2', '취소/교환/반품'),
('IC3', '환불'),
('IC4', '주문/결제'),
('IC5', '상품'),
('IC6', '기타');

INSERT INTO POST_CATEGOIES
VALUES ('PC1', '공지'),
('PC2', '이벤트'),
('PC3', '소식');

INSERT INTO ADMINS
VALUES ('AD1', 'ADMIN_SOO', 'ADMIN_SOO1', '하성수', 'SOO', 'ADMIN'),
('AD2', 'ADMIN_GYEONG', 'ADMIN_GYEONG1', '진보경', 'GYEONG', 'ADMIN'),
('AD3', 'ADMIN_JUNG', 'ADMIN_JUNG1', '김현정', 'JUNG', 'ADMIN');

INSERT INTO REFUND_EXCHANGE_REASONS
VALUES ('RER1', '단순변심', 'YES'),
('RER2', '색상 및 사이즈 변경', 'YES'),
('RER3', '다른 상품 잘못 주문', 'YES'),
('RER4', '서비스 및 상품 불만족', 'YES'),
('RER5', '배송지연', 'YES'),
('RER6', '배송누락', 'YES'),
('RER7', '상품파손', 'YES'),
('RER8', '상품정보 상이', 'YES'),
('RER9', '오배송', 'YES'),
('RER10', '색상 등 다른 상품 잘못 배송', 'YES'),
('RER11', '기타', 'YES')
;