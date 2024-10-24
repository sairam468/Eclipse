package test;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/buyAllBooks")
public class CartBooksBuyServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession hs=req.getSession(false);
		
		if (hs == null) {
			req.setAttribute("msg", "<h3 style='color: red;'>Session Expired....Try again....</h3><br>");
			req.getRequestDispatcher("userRegister.jsp").forward(req, res);
			return;
		}
		ArrayList<BookBean> al=(ArrayList<BookBean>) hs.getAttribute("al");
		ArrayList<AddCartBean> acb=(ArrayList<AddCartBean>) hs.getAttribute("acb");
		int size=acb.size();
		int i = 0,k;
		for(AddCartBean acbean:acb) {
			k=new CartBooksBuyDAO().buyBooks(acbean);
			if(k==1) {
				i++;
				
				for(BookBean bbean: al) {
					if(acbean.getCode().equals(bbean.getCode())) {
						Integer Q=bbean.getQty()-acbean.getNoOfBooks();
						bbean.setQty(Q);
					}
				}
			}
		}
		if(size==i) {
			hs.setAttribute("al", al);
			hs.removeAttribute("acb");
			req.setAttribute("msg", "<h3 style='color: green;'>Books Purchased Sucessfully...</h3><br>");
		}
		else {
			req.setAttribute("msg", "<h3 style='color: red;'>Error Purchasing Books...</h3><br>");
		}
		req.getRequestDispatcher("UserViewBooks.jsp").forward(req, res);
		
		
	}

}
