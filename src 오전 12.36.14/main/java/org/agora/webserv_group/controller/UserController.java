package org.agora.webserv_group.controller;

import org.agora.webserv_group.dao.PostDAO;
import org.agora.webserv_group.dao.UserDAO;
import org.agora.webserv_group.model.Post;
import org.agora.webserv_group.model.User;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserController", value = "/user")
public class UserController extends HttpServlet {
    private UserDAO dao;
    private PostDAO postdao;
    private ServletContext ctx;
    // 웹 리소스 기본 경로 지정
    private final String START_PAGE = ""; //설정해야함

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        dao = new UserDAO();
        ctx = getServletContext();
    }

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        dao = new UserDAO();
        postdao = new PostDAO();
        // 자바 리플렉션을 사용해 if, switch 없이 요청에 따라 구현 메서드가 실행되도록 함. 즉 action이름과 동일한 메서드를 호출
        Method m;
        String view = null;
        // action 파라미터 없이 접근한 경우
        if (action == null) {
            action = ""; //설정해야함
        }
        try {
            // 현재 클래스에서 action 이름과 HttpServletRequest 를 파라미터로 하는 메서드 찾음
            m = this.getClass().getMethod(action, HttpServletRequest.class);
            // 메서드 실행후 리턴값 받아옴
            view = (String) m.invoke(this, request);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
            // 에러 로그를 남기고 view 를 로그인 화면으로 지정, 앞에서와 같이 redirection 사용도 가능.
            ctx.log("요청 action 없음!!");
            request.setAttribute("error", "action 파라미터가 잘못 되었습니다!!");
            view = START_PAGE;
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (view.startsWith("redirect:/")) {
            // redirect:/ 문자열 이후 경로만 가지고 옴
            String rview = view.substring("redirect:/".length());
            response.sendRedirect(rview);
        } else {
            // 지정된 뷰로 포워딩, 포워딩시 컨텍스트경로는 필요없음.
            RequestDispatcher dispatcher = request.getRequestDispatcher(view);
            dispatcher.forward(request, response);
        }

    }

    public String register(HttpServletRequest request) { //반환 값 필요시 지정
        User n = new User();
        try {
            // 입력값을 User 객체로 매핑
            BeanUtils.populate(n, request.getParameterMap());
            dao.addUser(n);
            request.setAttribute("login", "회원가입이 정상적으로 완료되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            ctx.log("유저 추가 과정에서 문제 발생!!");
            request.setAttribute("error", "유저가 정상적으로 등록되지 않았습니다!!");
        }
        return "index.jsp";
    }

    public String mypage(HttpServletRequest request) throws SQLException { //유저 리스트부분 추가 필요
        String uid = request.getParameter("uid");
        List<Post> group, mypost;

        try {
            User n = dao.getUser(uid); //내 정보
            group = postdao.getMyGroupPostsByUid(uid); //내가 속한 그룹의 포스트
            mypost = postdao.getPostsByWriter(uid); //내가 작성한 포스트

            request.setAttribute("user", n);
            request.setAttribute("group", group);
            request.setAttribute("mypost", mypost);

        } catch (SQLException e) {
            e.printStackTrace();
            ctx.log("유저 정보를 가져오는 과정에서 문제 발생!!");
            request.setAttribute("error", "유저 정보를 정상적으로 가져오지 못했습니다!!");
        }
        return "mypage.jsp"; //유저 생성 글과 유저 포함 글로 전달
    }


    public String login(HttpServletRequest request) { //로그인 버튼 입력시 실행된다
        String uid = request.getParameter("uid");
        String password = request.getParameter("upw");
        try {
            boolean login = dao.login(uid,password);
            if(login){
//                request.setAttribute("login","로그인 되었습니다.");
                request.setAttribute("uid", uid);
            }
            else{
                request.setAttribute("login","아이디 또는 비밀번호가 틀립니다.");
                return "login.jsp"; //db에 없는 경우
            }
        } catch (SQLException e) {
            e.printStackTrace();
            ctx.log("로그인 과정에서 문제 발생!!");
            request.setAttribute("error", "로그인을 하지 못했습니다!!");
            return "login.jsp"; // 세션세팅으로 가면 안됨
        }
//        return "index.jsp";
        return "set_session.jsp"; //db에 존재하는 경우
    }

    public String findid(HttpServletRequest request) { //아이디 찾기 버튼 입력시 실행된다
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String id = "";

        try {
            id = dao.findId(name, email); //아디이 찾기 함수 실행
            request.setAttribute("id", id);
        } catch(Exception e) {
            e.printStackTrace();
            ctx.log("아이디 찾는 과정에서 문제 발생!!");
            request.setAttribute("error", "아이디를 찾는 과정에 문제 발생!!");
        }
        return "login.jsp";
    }

    public String findpw(HttpServletRequest request) { //비밀번호 찾기 버튼 입력시 실행된다
        String uid = request.getParameter("uid");
        String password = "";
        try {
            password = dao.findPassword(uid); //비밀 번호 찾기 함수 실행
            request.setAttribute("password", password);
        } catch(Exception e) {
            e.printStackTrace();
            ctx.log("비밀번호를 찾는 과정에서 문제 발생!!");
            request.setAttribute("error", "비밀번호를 찾는 과정에 문제 발생!!");
        }
        return "login.jsp";
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
