/*
 * @(#)DateUtil.java
 *
 * Copyright (c) 2021 HiTRUST Incorporated.
 * All rights reserved.
 * 
 * Description:
 * 		Date utility
 *
 * Modify History:
 * v1.00, 2021/09/07, Kevin Wang
 *   1) First release
 *
 */
package com.example.demo.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Date utility
 * 
 * @author KevinWang
 */
public class DateUtil {
    
    /**
     * Logging utility
     */
    private static final Logger logger = LoggerFactory.getLogger(DateUtil.class);

    /**
     * 去除日期格式化
     *
     * @param date date with format "yyyy/MM/dd" or "yyyy-MM-dd"
     * @return date date with format "yyyyMMdd"
     */
    public static String revertDate(String date) {
        if (date == null || "".equals(date)) {
            return date;
        }
        if (date.getBytes().length != 10) {
            return date;
        }
        String delemiter = date.substring(4, 5);
        return date.replaceAll(delemiter, "");
    }

    public static String revertDate_2(String date) {
        if (date == null || "".equals(date)) {
            return date;
        }
        if (date.getBytes().length != 8) {
            return date;
        }
        return date.substring(0,4)+"-"+date.substring(4,6)+"-"+date.substring(6,8);
    }
    
    /**
     * 去除日期時間格式化
     *
     * @param date date with format "yyyy/MM/dd hh:mm:ss" or "yyyy-MM-dd hh:mm:ss"
     * @return date date with format "yyyyMMddhhmmss"
     */
    public static String revertDateTime(String date) {
        if (date == null || "".equals(date)) {
            return date;
        }
        if (date.getBytes().length != 19) {
            return date;
        }    
        String cds = null;
        String delemiter = date.substring(4, 5);
        cds = date.replaceAll(delemiter, "");
        delemiter = cds.substring(8, 9);
        cds = cds.replaceAll(delemiter, "");
        delemiter = cds.substring(10, 11);
        cds = cds.replaceAll(delemiter, "");
        return cds;
    }
    

    /**
     * 轉換起始日期物件為資料庫Timestamp物件
     *
     * @param date 起始日期
     * @return 資料庫Timestamp物件
     */
    public static Timestamp toSqlTimestamp(Date date) {
        return new Timestamp(date.getTime());
    }

    /**
     * 轉換起始日期為資料庫Timestamp物件，時間部分系統將預設為000000
     *
     * @param date 起始日期
     * @return 資料庫Timestamp物件
     */
    public static Timestamp toSqlTimestamp_BD(String date) {
        if (date == null || "".equals(date)) {
            return null;
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        try {
            return toSqlTimestamp(sdf.parse(date + "000000"));
        } catch (ParseException ex) {
            logger.warn("Failed to parse date(" + date + ") into timestamp!");
            return null;
        }
    }

    /**
     * 轉換結束日期為資料庫Timestamp物件，時間部分系統將預設為235959
     *
     * @param date 結束日期
     * @return 資料庫Timestamp物件
     */
    public static Timestamp toSqlTimestamp_ED(String date) {
        if (date == null || "".equals(date)) {
            return null;
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        try {
            return toSqlTimestamp(sdf.parse(date + "235959"));
        } catch (ParseException ex) {
            logger.warn("Failed to parse date(" + date + ") into timestamp!");
            return null;
        }
    }

    /**
     * 轉換起始日期為Date物件，時間部分系統將預設為000000
     *
     * @param date 起始日期
     * @return 起始日期Date物件
     */
    public static Date toDate_BD(String date) {
        if (date == null || "".equals(date)) {
            return null;
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        Date startDate = null;
        try {
            startDate = sdf.parse(date + "000000");
        } catch (ParseException ex) {
            logger.warn("Failed to parse date(" + date + ") into Date!");
        }
        return startDate;
    }

    /**
     * 轉換結束日期為Date物件，時間部分系統將預設為235959
     *
     * @param date 結束日期
     * @return 結束日期Date物件
     */
    public static Date toDate_ED(String date) {
        if (date == null || "".equals(date)) {
            return null;
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        Date endDate = null;
        try {
            endDate = sdf.parse(date + "235959");
        } catch (ParseException ex) {
            logger.warn("Failed to parse date(" + date + ") into Date!");
        }
        return endDate;
    }

    /**
     * 取得當月第一天的日期
     *
     * @return 當月第一天日期
     */
    public static Date getFirstDayOfMonth() {
        GregorianCalendar gc = (GregorianCalendar) Calendar.getInstance();
        gc.set(Calendar.DAY_OF_MONTH, 1);
        return gc.getTime();
    }

    /**
     * 取得當前系統日期時間(yyyyMMddHHmmss)
     *
     * @return 當前系統日期時間
     */
    public static String getCurrentDateTime() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        return sdf.format(new Date());
    }

    /**
     * 取得當前系統日期(yyyyMMdd)
     *
     * @return 當前系統日期
     */
    public static String getCurrentDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        return sdf.format(new Date());
    }

    //for Rule Statistical Report
    public static String get7DaysEarlier() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, -6);
        Date todate1 = cal.getTime();
        return sdf.format(todate1);
    }
    
    /**
     * 取得當前系統日期(yyyyMMdd)
     *
     * @return 當前系統日期
     */
    public static String getCurrentFormatDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(new Date());
    }

    //for Rule Statistical Report
    public static String getFormat7DaysEarlier() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, -6);
        Date todate1 = cal.getTime();
        return sdf.format(todate1);
    }
    /**
     * 取得當前系統時間(HHmmss)
     *
     * @return 當前系統時間
     */
    public static String getCurrentTime() {
        SimpleDateFormat sdf = new SimpleDateFormat("HHmmss");
        return sdf.format(new Date());
    }

    /**
     * 依據日期格式轉換日期物件為格式化的日期字串
     *
     * @param pattern
     * @param date
     * @return
     */
    public static String formateDate(String pattern, Date date) {
        if (date == null) {
            return null;
        }
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        return sdf.format(date);
    }

    /**
     * 依據日期格式轉換日期字串為日期物件
     *
     * @param pattern 日期格式
     * @param strDate 日期自傳
     * @return 日期格式, 如格式化失敗, 則回傳 null
     */
    public static Date parseDate(String pattern, String strDate) {
        if (strDate == null || "".equals(strDate)) {
            return null;
        }
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        try {
            String tmpDate = strDate;
            if (strDate.getBytes().length > pattern.getBytes().length) {
                tmpDate = strDate.substring(0, pattern.getBytes().length);
            }
            return sdf.parse(tmpDate);
        } catch (ParseException ex) {
            return null;
        }
    }

    /**
     * 依據日期格式(民國年)轉換日期物件為格式化的日期字串
     *
     * @param rocPattern yyyMMdd or yyy/MM/dd
     * @param date 日期物件(西元年)
     * @return 格式化的日期字串
     */
    public static String formatROCDate(String rocPattern, Date date) {
        if (date == null) {
            return null;
        }
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.YEAR, -1911);
        SimpleDateFormat sdf = new SimpleDateFormat(rocPattern);
        return sdf.format(cal.getTime());
    }

    /**
     * 依據日期格式(民國年)轉換日期字串(民國年)為日期物件
     *
     * @param rocPattern 日期格式(民國年)
     * @param strRocDate 日期字串(民國年)
     * @return 日期物件(西元年)
     */
    public static Date parseROCDate(String rocPattern, String strRocDate) {
        if (rocPattern == null || "".equals(rocPattern)) {
            return null;
        }
        SimpleDateFormat sdf = new SimpleDateFormat(rocPattern);
        try {
            String tmpDate = strRocDate;
            if (strRocDate.getBytes().length > rocPattern.getBytes().length) {
                tmpDate = strRocDate.substring(0, rocPattern.getBytes().length);
            }
            Calendar cal = Calendar.getInstance();
            cal.setTime(sdf.parse(tmpDate));
            cal.add(Calendar.YEAR, 1911);
            return cal.getTime();
        } catch (ParseException ex) {
            return null;
        }
    }

    /**
     * 將傳入之字串日期格式轉為calendar,若不合法則return null ex. 20011112 or 20011112151617 or
     * 151617
     *
     * @param dateString
     * @return
     */
    public static Calendar string2Calendar(String dateString) {
        int year = 0, month = 0, date = 0, hour = 0, min = 0, sec = 0, myLen = 0;
        if (dateString == null) {
            return null;
        }
        myLen = dateString.length();
        if (myLen == 8 || myLen == 14) {
            year = Integer.parseInt(dateString.substring(0, 4));
            month = Integer.parseInt(dateString.substring(4, 6)) - 1;
            date = Integer.parseInt(dateString.substring(6, 8));
            if (myLen == 14) {
                dateString = dateString.substring(8);
            }
        }

        if (dateString.length() == 6) {
            hour = Integer.parseInt(dateString.substring(0, 2));
            min = Integer.parseInt(dateString.substring(2, 4));
            sec = Integer.parseInt(dateString.substring(4, 6));
        }

        Calendar calendarObj = Calendar.getInstance();
        if (myLen == 8) {
            calendarObj.set(year, month, date);
            if (year != calendarObj.get(Calendar.YEAR)
                    || month != (calendarObj.get(Calendar.MONTH))
                    || date != calendarObj.get(Calendar.DATE)) {
                return null;
            }
        } else if (myLen == 6) {
            if (hour < 0 || hour >= 24 || min < 0 || min >= 60 || sec < 0 || sec >= 60) {
                return null;
            }
        } else if (myLen == 14) {
            calendarObj.set(year, month, date, hour, min, sec);
            if (year != calendarObj.get(Calendar.YEAR)
                    || month != (calendarObj.get(Calendar.MONTH))
                    || date != calendarObj.get(Calendar.DATE)
                    || hour != calendarObj.get(Calendar.HOUR_OF_DAY)
                    || min != calendarObj.get(Calendar.MINUTE)
                    || sec != calendarObj.get(Calendar.SECOND)) {
                return null;
            }
        } else {
            return null;
        }
        return calendarObj;
    }

    /**
     * 取得某日期幾天前或幾天後之日期(須為標準字串格式) ex. 20011112 ==> 20011115(加3天) ex. 20011112 ==>
     * 20011109(減3天)
     *
     * @param orgDate
     * @param dayCnt
     * @return
     */
    public static String countDate(String orgDate, int dayCnt) {
        String myType = null;
        Calendar calendar = string2Calendar(orgDate);
        calendar.add(Calendar.DATE, dayCnt);
        if (orgDate.length() == 8) {
            myType = "yyyyMMdd";
        } else if (orgDate.length() == 14) {
            myType = "yyyyMMddHHmmss";
        }
        return formateDate(myType, calendar.getTime());
    }
    
}
