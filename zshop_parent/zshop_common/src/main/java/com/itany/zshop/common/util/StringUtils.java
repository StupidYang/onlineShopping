package com.itany.zshop.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class StringUtils {
    public static String renameFileName(String fileName){
        int dotIndex=fileName.lastIndexOf(".");
        String suffix=fileName.substring(dotIndex);
        return new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+new Random().nextInt(100)+suffix;
    }
}

