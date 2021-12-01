/**
 * 
 */
package com.ITP.Services;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;

import com.ITP.Model.OTbonus;
import com.ITP.Model.SalaryChanges;
import com.ITP.Utility.DBConnection;

/**
 * @author Tharindu
 *
 */
public class SalaryChangesServicesImpl implements SalaryChangeServices{
	

	static Connection con;
	static PreparedStatement ps;

	@Override
	public void addNewChange(SalaryChanges SC) {
		// TODO Auto-generated method stub
		
		int previousID = 0;
//		LocalDate d  = LocalDate.now();
//		
//		ZoneId defaultZoneId = ZoneId.systemDefault();
//        Date date = Date.from(d.atStartOfDay(defaultZoneId).toInstant());
//        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		
		try {
			con = DBConnection.getConnection();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			ps = con.prepareStatement("SELECT * FROM salary_adjustments ORDER BY SD_ID DESC LIMIT 1");
			
			ResultSet rs = ps.executeQuery();
			
			System.out.println("Stuff is happening");
			
			
			if(rs != null) {
				while(rs.next()) {
					previousID = rs.getInt("SD_ID");
				}
				previousID++;
			} else {
				System.out.println("RS is null");
				previousID = 1;
			}
			
			ps = con.prepareStatement("INSERT INTO salary_adjustments values(?,?,?,?,?,?,?)");
			ps.setInt(1, previousID);
			ps.setString(2, SC.getName());
			ps.setDouble(3, SC.getRate());
			ps.setString(4, SC.getChangeFor());
			ps.setString(5, SC.getType());
			ps.setString(6, SC.getHour_per());
			ps.setString(7, "Active");
			
			System.out.println("Stuff is happening sql entry");
			
			int status = ps.executeUpdate();
			con.close();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

	@Override
	public ArrayList<SalaryChanges> getChanges() {
		// TODO Auto-generated method stub
		
		ArrayList ChangesList = new ArrayList();
		
		try {
			con = DBConnection.getConnection();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			ps = con.prepareStatement("Select * from salary_adjustments");
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				SalaryChanges SC = new SalaryChanges();
				SC.setID(rs.getInt("SD_ID"));
				SC.setName(rs.getString("Ad_Name"));
				SC.setRate(rs.getDouble("Rate"));
				SC.setChangeFor(rs.getString("Ad_for"));
				SC.setType(rs.getString("Ad_Type"));
				SC.setHour_per(rs.getString("Hourly_or_Percentage"));
				SC.setStatus(rs.getString("sd_Status"));
				
				ChangesList.add(SC);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ChangesList;
	}
	
	public ArrayList<SalaryChanges> getChanges(String department) {
		// TODO Auto-generated method stub
		
		ArrayList ChangesList = new ArrayList();
		
		try {
			con = DBConnection.getConnection();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			ps = con.prepareStatement("Select * from salary_adjustments where Ad_for = ? OR Ad_for = 'all'");
			ps.setString(1, department);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				SalaryChanges SC = new SalaryChanges();
				SC.setID(rs.getInt("SD_ID"));
				SC.setName(rs.getString("Ad_Name"));
				SC.setRate(rs.getDouble("Rate"));
				SC.setChangeFor(rs.getString("Ad_for"));
				SC.setType(rs.getString("Ad_Type"));
				SC.setHour_per(rs.getString("Hourly_or_Percentage"));
				SC.setStatus(rs.getString("sd_Status"));
				
				ChangesList.add(SC);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ChangesList;
	}
	
	
	@Override
	public void updateChange(SalaryChanges SC) {
		// TODO Auto-generated method stub
		
		SalaryChangesServicesImpl SCI = new SalaryChangesServicesImpl();
		
		SCI.RemoveChange(SC.getID());
		System.out.println("The ID is : " + SC.getID());
		
		SCI.addNewChange(SC);
		
	}
	
	

	@Override
	public void RemoveChange(int salaryID) {
		// TODO Auto-generated method stub
		String r = "Removed";
		
		try {
			con = DBConnection.getConnection();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			ps = con.prepareStatement("UPDATE salary_adjustments SET sd_Status = ? where SD_ID = ?");
			
			ps.setString(1, r);
			ps.setInt(2, salaryID);
			int i = ps.executeUpdate();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void addSalaryBonusRelation(int salID, int bonusID) {
		
		try {
			con = DBConnection.getConnection();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			ps = con.prepareStatement("Insert into salary_use_sd values(?, ?)");
			
			ps.setInt(1, salID);
			ps.setInt(2, bonusID);
			int i = ps.executeUpdate();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public SalaryChanges getSalaryChange(int SCID) {
		
		SalaryChanges SC = new SalaryChanges();
		
		
		try {
			con = DBConnection.getConnection();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			ps = con.prepareStatement("Select * from salary_adjustments where SD_ID = ?");
			ps.setInt(1, SCID);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				SC.setID(rs.getInt("SD_ID"));
				SC.setName(rs.getString("Ad_Name"));
				SC.setRate(rs.getDouble("Rate"));
				SC.setChangeFor(rs.getString("Ad_for"));
				SC.setType(rs.getString("Ad_Type"));
				SC.setHour_per(rs.getString("Hourly_or_Percentage"));
				SC.setStatus(rs.getString("sd_Status"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return SC;
		
	}

	@Override
	public OTbonus getOTbonus() {
		// TODO Auto-generated method stub
		
		OTbonus OT = new OTbonus();
		
		try {
			con = DBConnection.getConnection();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			ps = con.prepareStatement("Select * from otbonus");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				OT.setName(rs.getString("Department"));
				OT.setRate(rs.getDouble("Bonus"));
			}
			
			con.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return OT;
		
	}

	@Override
	public void updateOTbonus(OTbonus OT) {
		// TODO Auto-generated method stub
		
		try {
			con = DBConnection.getConnection();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			ps = con.prepareStatement("UPDATE otbonus SET Bonus = ? where Department = 'OT Bonus'");
			ps.setDouble(1, OT.getRate());
			
			ps.executeUpdate();
			
			
			con.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	
	
	

}
