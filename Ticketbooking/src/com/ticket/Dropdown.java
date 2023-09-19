package com.ticket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class Dropdown extends TagSupport {

	private String table, col;
	private Connection con;

	public String getTable() {
		return table;
	}

	public void setTable(String table) {
		this.table = table;
	}

	public String getCol() {
		return col;
	}

	public void setCol(String col) {
		this.col = col;
	}

	public int doStartTag() {
		JspWriter out = pageContext.getOut();
		try {
			Class.forName("org.postgresql.Driver");

			// Establish a database connection
			Connection con = DriverManager.getConnection(
					"jdbc:postgresql://192.168.110.48:5432/plf_training?user=plf_training_admin&password=pff123");

			// Define your SQL query here to retrieve data for the dropdown
			String from = "SELECT " + col + " FROM " + table;
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(from);

			// Generate the HTML for the dropdown
			// out.println("<select>");
			while (rs.next()) {
				String columnValue = rs.getString(col);
				out.println("<option value='" + columnValue + "'>" + columnValue + "</option>");
			}
			// out.println("</select>");

			rs.close();
			st.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return SKIP_BODY;

	}
}
