

05/18

타이머 -> Ajax로 처리하자

-----아이디 중복 확인
1. join_member_page.jsp - fuction confirmId - Ajax 기본 구조

2. MemberController - confirmId - 로그 찍어보고

3. MemberSQLMapper - selectById

4. MemberServiceImpl - confirmId

5. MemberController - confirmId - 서비스 메소드 실행, @ResponseBody

6. join_member_page.jsp - funtion 로직 추가, isConfirmId 유효성검사(반드시 중복확인 해야하게끔)

7. join_member_page.jsp - confirmId_jQuery() - 슬림버전 지워줘야함

비동기식 : 스레드 느낌


-----댓글
1. read_content_page.do - UI 잡고

2. 테이블 생성
CREATE TABLE FB_Reply(
    reply_no NUMBER(8) PRIMARY KEY,
    board_no NUMBER(8),
    member_no NUMBER(8),
    reply_content VARCHAR2(1000),
    reply_writedate DATE
);

3. ReplyVo

4. ReplySQLMapper

5. ReplySQLMapper.xml

6. BoardServiceImpl - getRepleList, writeReply 추가

7. RESTfulBoardController - writeReplyProcess

----

8. read_content_page.jsp - onclick, writeReply()

9. RESTfulBoardController - getReplyList()

10. pom.xml - JSON 변환 라이브러리 추가

11. read_content_page.jsp - refreshReplyList(), 밑에 id 지정(

12. read_content_page.jsp - body에 onload 추가

