# 개요
- 프로젝트 아카
- JSP Servlet을 사용하여 회원관리(로그인, 회원가입, 회원관리 등), 차량 예약, 고객 리뷰, 고객센터 등의 페이지를 반응형으로 구현하였습니다.

# 기술 환경
- Language : Java(JDK 11.0.10)
- IDE : Eclipse
- DB : Oracle(mysql 8.0)
- Server : Apache Tomcat 8.5
# 프로젝트 설명
- 반응형 웹페이지
- 차량 대여 서비스 구현


< PC ><br>
<img width="300" alt="스크린샷 2022-05-19 오후 4 38 34" src="https://user-images.githubusercontent.com/88490416/173757148-dde9a3c7-e0e2-42bf-851d-9522d427405c.png"><br>
< Mobile ><br>
<img width="150" alt="스크린샷 2022-05-19 오후 4 45 11" src="https://user-images.githubusercontent.com/88490416/173757160-f83ece6d-1dd8-4735-bd65-e38a3e9da364.png">

# 회원관리
- 회원가입 및 로그인 화면
  - input 값 유효성 체크 및 중복 확인
  - 세션을 이용한 로그인 쿠키 생성
  - 로그인 및 로그아웃(세션파괴)
<br><img width="300" alt="스크린샷 2022-06-15 오후 3 00 48" src="https://user-images.githubusercontent.com/88490416/173757094-c1d302df-41a1-4b52-98ca-78db0faa6ad4.png">  <img width="300" alt="스크린샷 2022-06-15 오후 3 00 56" src="https://user-images.githubusercontent.com/88490416/173757103-93852dda-b42b-43bf-97d3-fb20f6e52948.png">

- 관리자 버전
  - 회원 리스트
  - 차량 예약 리스트
  - Update(수정) 및 Delete(삭제) 권한
<br><img width="300" alt="스크린샷 2022-05-20 오후 12 01 05" src="https://user-images.githubusercontent.com/88490416/173757345-1c215d65-1c61-4236-b941-4f6f2e03f335.png">

- 회원 버전
  - 회원 정보 확인 및 수정
  - 회원 차량 예약 확인
<br><img width="300" alt="스크린샷 2022-05-20 오후 12 01 52" src="https://user-images.githubusercontent.com/88490416/173760765-c04cf86a-4238-4698-b4be-b4f0d6a8788b.png">

# 차량예약
- 차량 리스트
  - 차량 예약 버튼 클릭 시 차량 날짜 입력 페이지로 이동
  - 예약 시 예약 불가로 버튼 변경
<br><img width="300" alt="스크린샷 2022-05-20 오후 3 31 43" src="https://user-images.githubusercontent.com/88490416/173760636-63a782df-b4cf-4445-9ac0-195b55504df8.png">

- 차량 날짜 입력 페이지
  - 예약 날짜 값 유효성 체크
  - Date picker를 이용한 날짜 선택
  - 해당 차량 상세 내용
<br><img width="300" alt="스크린샷 2022-05-20 오후 3 35 38" src="https://user-images.githubusercontent.com/88490416/173760515-d34379e9-cf64-4329-aef0-f78593b9fffe.png">


# 고객 리뷰
- 게시판 CRUD 기능 구현
- 게시글 수정, 삭제 시 비밀번호 유효성 검사
<br><img width="300" alt="스크린샷 2022-05-20 오후 12 00 37" src="https://user-images.githubusercontent.com/88490416/173760817-9ae95533-4b84-4326-9dcc-2a505c5cb954.png"><br><img width="300" alt="스크린샷 2022-05-20 오후 4 39 18" src="https://user-images.githubusercontent.com/88490416/173757358-8a5184de-8e03-47d6-b4aa-7afd21f4f375.png">

# 고객센터
- 게시판 CRUD 기능 구현
- 관리자 댓글, 대댓글 기능 구현
- 게시글 수정, 삭제 시 비밀번호 유효성 검사
<br><img width="300" alt="스크린샷 2022-05-20 오후 4 15 02" src="https://user-images.githubusercontent.com/88490416/173757296-91db8e75-08ce-4e60-9ece-f56a94c942c7.png">



# 추가 해야할 기능
- 차량 예약 기간 만료 시 자동 변경 기능
- 차량 이용 고객만 리뷰 작성 권한 부여



