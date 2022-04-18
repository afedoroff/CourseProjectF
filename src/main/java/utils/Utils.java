package utils;

import java.io.UnsupportedEncodingException;

public class Utils {

    public static String changeCharset(String str, String sourceCharset, String targetCharset) throws UnsupportedEncodingException {
        if (str == null) {
            return null;
        }
        byte[] bs = str.getBytes(sourceCharset);
        return new String(bs, targetCharset);
    }

    public static String convertToUTF8(String str) throws UnsupportedEncodingException {

        str = changeCharset(str, "ISO-8859-1", "UTF-8");
        return str;
    }
}
