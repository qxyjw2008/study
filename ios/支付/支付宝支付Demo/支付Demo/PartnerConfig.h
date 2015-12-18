//
//  PartnerConfig.h
//  支付Demo
//
//  Created by 周琦 on 15/10/29.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#ifndef PartnerConfig_h
#define PartnerConfig_h


//  提示：如何获取安全校验码和合作身份者id
//  1.用您的签约支付宝账号登录支付宝网站(www.alipay.com)
//  2.点击“商家服务”
//  3.点击“查询合作者身份(pid)”、“查询安全校验码(key)”


/**
 *  商户的唯一的parnter和seller。商户签约成功后，支付宝会为每
 *  个商户分配一个唯一的 parnter(appID) 和 seller(支付宝账号)。
 *  privateKey生成的私钥，可放在本地，建议放在服务器端
 */


// 合作身份者id，以2088开头的16位纯数字
#define PartnerID @""
// 收款支付宝账号
#define SellerID  @""
// 商户私钥，自助生成
#define PartnerPrivateKey @""
// 支付宝公钥
#define AlipayPublicKey @""

// 安全校验码（MD5）密钥，以数字和字母组成的32位字符(这个可有可无暂时没用上)
#define MD5_KEY @""


#endif /* PartnerConfig_h */
