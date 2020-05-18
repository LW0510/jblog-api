package com.jblog.common.utils.ip;

import com.jblog.common.utils.ServletUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.alibaba.fastjson.JSONObject;
import com.jblog.common.utils.StringUtils;
import com.jblog.common.utils.http.HttpUtils;
import com.jblog.framework.config.GhcConfig;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

/**
 * 获取地址类
 * 
 * @author jblog
 */
public class AddressUtils
{
    private static final Logger log = LoggerFactory.getLogger(AddressUtils.class);

    public static final String IP_URL = "http://ip.taobao.com/service/getIpInfo.php";

    public static String getRealAddressByIP(String ip)
    {
        String address = "XX XX";
        // 内网不查询
        if (IpUtils.internalIp(ip))
        {
            return "内网IP";
        }
        if (GhcConfig.isAddressEnabled())
        {
            String rspStr = HttpUtils.sendPost(IP_URL, "ip=" + ip);
            if (StringUtils.isEmpty(rspStr))
            {
                log.error("获取地理位置异常 {}", ip);
                return address;
            }
            JSONObject obj = JSONObject.parseObject(rspStr);
            JSONObject data = obj.getObject("data", JSONObject.class);
            String region = data.getString("region");
            String city = data.getString("city");
            address = region + " " + city;
        }
        return address;
    }

    /**
     * 获得当前 api 地址
     * 例如：http://localhost:8080/
     * @return
     */
    public static String getCurrApiAddress(){
        ServletRequest request = ServletUtils.getRequest();
        StringBuffer url = new StringBuffer();
        url.append(request.getScheme())
                .append("://")
                .append(request.getServerName())
                .append(":")
                .append(request.getServerPort())
                .append(((HttpServletRequest) request).getContextPath())
                .append("/");
        return url.toString();
    }
}
