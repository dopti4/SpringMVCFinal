

05/15

-----이메일 인증
1. FB_Member_Auth 테이블 생성<br>
    DROP TABLE FB_Member_Auth;
    
    CREATE TABLE FB_Member_Auth(
    auth_no NUMBER(8) PRIMARY KEY,
    member_no NUMBER(8),
    auth_certification VARCHAR2(4),
    auth_key VARCHAR2(100)
    );

    DROP SEQUENCE FB_Member_Auth_seq;
    
    CREATE SEQUENCE FB_Member_Auth_seq;
    
2. AuthVo

3. AuthSQLMapper

4. AuthSQLMapper.xml

5. MemberController - joinMemberProcess 수정

6. MemberServiceImpl - joinMember 수정

7. MemberSQLMapper - selectByIdAndPw 수정

8. pom.xml 외부 라이브러리 2개 등록

9. servlet-context.xml 빈 추가

10. MemberController - 스레드 추가, certificationProcess 추가

11. MemberServiceImpl - certification 추가

-----AJAX
1. join_member_page.jsp - AJAX 코드 추가**

2. testAjax.jsp**
