package ttc.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import ttc.exception.integration.IntegrationException;
import java.text.ParseException;

public abstract class DateConversion{
    private static Timestamp dateTime;
    public static String doFormatTime(String date)throws IntegrationException{
        try {
            Long dateTimeLong = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date).getTime();
            dateTime = new Timestamp(dateTimeLong);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        String dateTimeStr = new SimpleDateFormat("HH:mm").format(dateTime);
        return dateTimeStr;
    }

    public static String doFormatDateMonth(String date)throws IntegrationException{
        try {
            Long dateTimeLong = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date).getTime();
            dateTime = new Timestamp(dateTimeLong);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        String dateTimeStr = new SimpleDateFormat("M月d日 HH:mm").format(dateTime);
        return dateTimeStr;
    }

    public static String doFormatDateYear(String date)throws IntegrationException{
        try {
            Long dateTimeLong = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date).getTime();
            dateTime = new Timestamp(dateTimeLong);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        String dateTimeStr = new SimpleDateFormat("yyyy年M月d日 HH時mm分").format(dateTime);
        return dateTimeStr;
    }
}
