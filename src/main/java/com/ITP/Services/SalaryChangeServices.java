package com.ITP.Services;

import java.util.ArrayList;

import com.ITP.Model.OTbonus;
import com.ITP.Model.SalaryChanges;

public interface SalaryChangeServices {
	
	public void addNewChange(SalaryChanges SC);
	
	public ArrayList<SalaryChanges> getChanges();
	
	public void updateChange(SalaryChanges SC);
	
	public void RemoveChange(int salaryID);
	
	public ArrayList<SalaryChanges> getChanges(String department);
	
	public SalaryChanges getSalaryChange(int SCID);
	
	public OTbonus getOTbonus();
	
	public void updateOTbonus(OTbonus OT);

}
