/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ttc.util;

/**
 *
 * @author Masaki
 */

import java.util.Comparator;
import ttc.bean.DirectMessageBean;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.text.ParseException;

public class DMComparator implements Comparator<DirectMessageBean>{
	public int compare(DirectMessageBean dm1,DirectMessageBean dm2){
		String dateStr1 = dm1.getDate();
		String dateStr2 = dm2.getDate();
		int diff = 0;
		try{
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date1 = formatter.parse(dateStr1);
			Date date2 = formatter.parse(dateStr2);
			diff = date1.compareTo(date2);
		}catch(ParseException e){
			e.printStackTrace();
		}
		
		if(diff > 0){
			return 1;
		}else if(diff == 0){
			return 0;
		}else{
			return -1;
		}
	}
}
