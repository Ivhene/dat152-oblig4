package no.hvl.dat152.obl4.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SearchItemDAO {

	public List<SearchItem> getSearchHistoryLastFive() {
		String sql = "SELECT * FROM SecOblig.History ORDER BY datetime DESC";
		// Derby lacks LIMIT
		return getSearchItemList(sql, 5);
	}

	public List<SearchItem> getSearchHistoryForUser(String username) {
		String sql = "SELECT * FROM SecOblig.History WHERE username = ? ORDER BY datetime DESC";
		// Derby lacks LIMIT
		return getSearchItemList(sql, username, 50);
	}

	public List<SearchItem> getSearchHistoryForUser(String username, String sortkey) {
		String sql = "SELECT * FROM SecOblig.History WHERE username = ? ORDER BY ? ASC";
		// Derby lacks LIMIT
		return getSearchItemList(sql, username, sortkey, 50);
	}

	private List<SearchItem> getSearchItemList(String sql, Object... params) {
		List<SearchItem> result = new ArrayList<>();
		Connection c = null;
		PreparedStatement ps = null;
		ResultSet r = null;

		try {
			c = DatabaseHelper.getConnection();
			ps = c.prepareStatement(sql);

			for (int i = 0; i < params.length; i++) {
				ps.setObject(i + 1, params[i]);
			}

			r = ps.executeQuery();

			while (r.next()) {
				SearchItem item = new SearchItem(r.getTimestamp("datetime"), r.getString("username"),
						r.getString("searchkey"));
				result.add(item);
			}

		} catch (Exception e) {
			e.printStackTrace();
			// Handle or log exception
		} finally {
			DatabaseHelper.closeConnection(r, ps, c);
		}

		return result;
	}

	public void saveSearch(SearchItem search) {
		String sql = "INSERT INTO SecOblig.History VALUES (?, ?, ?)";

		Connection c = null;
		PreparedStatement ps = null;

		try {
			c = DatabaseHelper.getConnection();
			ps = c.prepareStatement(sql);
			ps.setTimestamp(1, search.getDatetime());
			ps.setString(2, search.getUsername());
			ps.setString(3, search.getSearchkey());
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DatabaseHelper.closeConnection(null, ps, c);
		}
	}
}
