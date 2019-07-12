package com.etc.util;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {

//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016100100641065";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDWoVlaqOtSCXUvXoA+j" +
            "1biIQX0ay9jSidGR2PY5/k3cYR7zc1jG0w2UlpPlocz73wjwWUo5dlfisCSYUAdGOODsakcGI52sCGftLNuf9tyrKDaU1dkTPVrdWceFo" +
            "OEEDUdzvVJqHCY06DQB9VrRH3jmFYltp17yiDYHgFCPGVgWei1WgV6zI3X0X50rTNKc/FubiZJ+V7RBaiPDpZpxWGIs7rFdvzk7XOWFI" +
            "gGgLsTrGjQuqW2hyJbWAnDnF8J5zB1dsaRdrCuS9Z+8Kz6pXpZrD0LJlXkHN/w+SRD+VOep0YWveULssc+jDWs/2CIQFzd0BW8qaGgqV" +
            "tn8swLcYI5AgMBAAECggEBAMoYATfhaDrF1wa0V9MQSwH/kEjWCDfYoeSF4hliTAKNq+6bGTKhiIB5yLm6BjK75EsSlfsNekGBN9RdJ+" +
            "59+fSN+6sN4E8Xh4GGt5FraKmwrIEHCnnSESCO2nq1Pj7CuBEKR2KE7Qip9HkNd0JaqqL8VNmL+vuNlqGIlyzUC6zNIVY58wa6EqmPrI" +
            "DmXMoQVRZF8AlU0P05bq+W8Lmr883+WoCdz/qhULqtvZRtTdM1sAQ3m2hFR77uPm6PBZqgAm3CC0tk2LvQwNRACZcuftMcw6OobYsHsj" +
            "tTwFZNuVjzigAvokI3lHjzyxA5/1MvChSMtpiRiUzNxON6th+vNVECgYEA+0pvI32wEHIMK5GdIk+49XvsZ4W2Iv/xRTFJL1MINdDXDA" +
            "KLNxW1FQhyL7O7vlAlsje/hYPBPfiw25k+EOyXEuu2lYuyoo3M2YvtU8glEcjqNxtQPRY+xVDF0mFt8mL1wmzNnRjWaTYW1O6J7w0Lvuv" +
            "W6ICO7dCEH7wg+M3RPsUCgYEA2qcJU9zBtv4jyPFUfBeNv44VeevOiPD+CVCMFv26nQKJ4XCNF9Pi02Io+J7sjgNgu5fAG0hptDqJfOz3" +
            "+SvUhd+47WANpAwFauwD3h5aGeUWE7mIOXjDoq4U2KpaS9HoNEiJkx/TvV4abzFxTQCy3xYy7WrMn7ufXLaFMQY4rOUCgYB01A1JndSuQ" +
            "Keh1egNHK1sC/pDwumD6iQ8vAY/Z0YI5xgjsEcTDBeNOMkFnnUprM9pxPtY0oGUEzv+TIeLjMNL+6R+cF1Tr8NOXPywl/uMAjHJ/vvV+" +
            "rKiP8RI5B0etJ13j+gkInkEny4MPv6H0jPkxna6z5IjxG645lkZ825V1QKBgBzOSMJNoQ+0p44/jPvUNo5374hicpFD/pPHks0snDs3L" +
            "GcQ5uWuuoFSu0cV2OBUvZe5REvT3GksFRTqOzkOdy8z7C8JqoJkOwp9EX1fzkr/DUuH89RufoeeG4z31HGMs+S/cbB6TvDxxtXDU8PrRa" +
            "VyTT9OBKs+kp4qRZ3RzgGpAoGAChSzwb50uc84kM/foVcnO1Jeuu7H4C8abmN9EBY2rtYoga9p96VOF1Pfak" +
            "1XaiVoEVFdXrK+GKhSfXfjuAHSSTl2vMPPYKr6GOamXImb6+kuQV00ISV+2DDTbRVsl3/K0YOWL96G5PLw25KpAFVCIXY23XTwJ4+lvs3ogIGmWko=A";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1qFZWqjrUgl1L16APo9W4iEF9" +
            "GsvY0onRkdj2Of5N3GEe83NYxtMNlJaT5aHM+98I8FlKOXZX4rAkmFAHRjjg7GpHBiOdrAhn7Szbn/bcqyg2lNXZEz1a3VnHhaDhBA1" +
            "Hc71SahwmNOg0AfVa0R945hWJbade8og2B4BQjxlYFnotVoFesyN19F+dK0zSnPxbm4mSfle0QWojw6WacVhiLO6xXb85O1zlhSIBo" +
            "C7E6xo0LqltociW1gJw5xfCecwdXbGkXawrkvWfvCs+qV6Waw9CyZV5Bzf8PkkQ/lTnqdGFr3lC7LHPow1rP9giEBc3dAVvKmhoKlbZ" +
            "/LMC3GCOQIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://192.168.11.230:8081/mall2_war_exploded/zhifuchenggong.jsp";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://192.168.11.230:8081/mall2_war_exploded/zhifuchenggong.jsp";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

