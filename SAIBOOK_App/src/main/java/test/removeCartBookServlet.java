package test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/removeBook")
public class removeCartBookServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession hs=req.getSession(false);
		if (hs == null) {
			req.setAttribute("msg", "<h3 style='color: red;'>Session Expired....Try again....</h3><br>");
			req.getRequestDispatcher("userRegister.jsp").forward(req, res);
			return;
		}
		String bCode=(String)req.getParameter("bcode");
		ArrayList<AddCartBean> acb = (ArrayList<AddCartBean>) hs.getAttribute("acb");
		for (AddCartBean acbean : acb) {
			if (bCode.equals(acbean.getCode().trim())) {
				acb.remove(acbean);
				hs.setAttribute("acb", acb);
				req.setAttribute("msg", "<h3 style='color: green;'>Book with code " + bCode + " Removed from the cart....</h3><br>");
				req.getRequestDispatcher("ViewCart.jsp").forward(req, res);
			}
		}
	}
}
