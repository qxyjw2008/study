//
//  ViewController.m
//  支付Demo
//
//  Created by 周琦 on 15/10/28.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#import "ViewController.h"

#import <AlipaySDK/AlipaySDK.h>
#import "Order.h" // 订单信息
#import "DataSigner.h" // 签名
#import "PartnerConfig.h" // 配置信息
// 以下的类是验证支付结果用的  不验证不需要引用
#import "DataVerifier.h" // 验证签名
#import "AlixPayResult.h" // 支付结果处理
#import "SBJSON.h"

/**
 *  官方接入流程、SDK下载请参考这里：http://doc.open.alipay.com/doc2/detail?treeId=59&articleId=103563&docType=1
 *  这篇博文说的也是很好，参考这里：http://www.jianshu.com/p/fe56e122663e
 */
@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"支付宝支付";
    UIButton *payButton = [UIButton buttonWithType:UIButtonTypeCustom];
    payButton.frame = CGRectMake(50, 100, self.view.frame.size.width - 100, 60);
    payButton.layer.cornerRadius = 5;
    payButton.backgroundColor = [UIColor lightGrayColor];
    [payButton setImage:[UIImage imageNamed:@"payNow_alipay"] forState:UIControlStateNormal];
    [payButton setImageEdgeInsets:UIEdgeInsetsMake(5, -20, 0, 0)];
    [payButton setTitle:@"支付宝支付" forState:UIControlStateNormal];
    [payButton addTarget:self action:@selector(alipayAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:payButton];

    
}

#pragma mark - 点击支付
/**
 *  如果安装了支付宝客户端会直接调起客户端,没有安装会调起wap页面
 */
- (void)alipayAction
{
    /**
     *  商户的唯一的parnter和seller。商户签约成功后，支付宝会为每
     *  个商户分配一个唯一的 parnter(appID) 和 seller(支付宝账号)。
     *  privateKey生成的私钥，可放在本地，建议放在服务器端
     */
    NSString *partner = PartnerID;
    NSString *seller = SellerID;
    // partner和seller获取失败
    if ([partner length] == 0 || [seller length] == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"缺少partner或者seller。" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        return;
    }
    // 应用注册scheme,在Info.plist定义URL types URL scheme
    NSString *appScheme = @"test";
    // 将商品信息拼接成字符串
    NSString *orderSpec = [self createOrderInfoWithPartner:partner Seller:seller];
    // 进行签名并将签名成功后的字符串格式化为订单字符串
    NSString *signedString = [self doRsa:orderSpec];
    // 调用支付宝SDK发送数据
    [self sendValueToAliPayWithOrderString:signedString FromScheme:appScheme];
}

#warning 1.生成预支付订单信息
- (NSString *)createOrderInfoWithPartner:(NSString *)partner
                                  Seller:(NSString *)seller
{
    /**
     *由于demo的局限性，采用了将私钥放在本地签名的方法，商户可以根据自身情况选择签名方法(为安全起
     *见,在条件允许的前提下，推荐从自己的服务器获取完整的订单信息)
     */
    // 将商品信息赋予Order的成员变量
    Order *order = [[Order alloc] init];
    order.partner = partner;
    order.seller = seller;
    order.tradeNO = @"123432121222"; //订单ID（由商家自行制定）
    order.productName = @"商品标题"; //商品标题
    order.productDescription = @"商品描述"; //商品描述
    order.amount = @"0.01"; //商品价格
    order.notifyURL =  @""; //回调URL
    // 这以下是固定形式每个app都是这么写
    order.service = @"mobile.securitypay.pay";
    order.paymentType = @"1";
    order.inputCharset = @"utf-8";
    order.itBPay = @"30m";
    order.showUrl = @"m.alipay.com";
    return [order description];
}

#warning 2.将订单信息用私钥进行签名
// 获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
// 此demo是在app内部做的签名
// 订单签名应该用私钥，但是把私钥放到app里其实本身就不安全，因为你的app是分发到用户手里的，私钥应该放在自己的手里，分发出去的应该是公钥。所以私钥最好是放在自己的服务器上，订单加密这个工作放在服务器端来做，服务器将包含签名的订单信息返回给app，app再通过SDK发送给支付宝，这样会更安全些；而且服务器也能掌握所有的订单状况
- (NSString *)doRsa:(NSString *)orderInfo
{
    id<DataSigner> signer;
    signer = CreateRSADataSigner(PartnerPrivateKey);
    NSString *signedString = [signer signString:orderInfo];
    // 将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",orderInfo, signedString, @"RSA"];
        NSLog(@"orderString ====   %@\nsignerString  ========== %@", orderString, signedString);
    }
    return orderString;
}

#warning 3.调用支付宝SDK发送请求数据
- (void)sendValueToAliPayWithOrderString:(NSString *)orderString FromScheme:(NSString *)appScheme
{
    [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
        // 用SBJSON 或者 JSONKit 将回调信息(字典)转成字符串
        SBJSON *sbJson = [[SBJSON alloc] init];
        NSString *resultDicToString = [sbJson stringWithObject:resultDic error:nil];
        [self paymentResult:resultDicToString];
        NSLog(@"回调结果reslut = %@",resultDic);
        //            NSLog(@"%d%@", [[resultDic objectForKey:@"resultStatus"] intValue], [resultDic objectForKey:@"memo"]);
    }];

}

#warning 4.对支付回调的结果进行验证(这一步加上是确保数据的安全,不加不影响支付)
// 就是在生产订单时，需要使用私钥生成签名值；在处理返回的支付结果时，需要使用公钥验证返回结果是否被篡改了。
// resultDic 返回结果所对应的值可以到支付宝开发平台上去查
// 在处理结果之前应该先对支付结果进行签名验证，防止支付数据被篡改。
// 返回的支付结果中的result字段里是带有订单信息和签名信息的，所以签名验证就是需要这个字段的值。
// 验证的步骤：首先把订单信息和签名值分别提取出来
// 订单信息就是sign_type的连字符&之前的所有字符串
// 签名值是sign后面双引号内的内容，注意签名的结尾也是=


// 此demo我是用SBJSON 或者 JSONKit 将回调信息(字典)转成字符串
// 也可以不使用SBJSON或者JSONKit处理回调信息,直接在回调结果中截取需要的字符串也可以,直接调用可以直接使用Util目录下的DataVerifier来作签名验证"- (BOOL)verifyString:(NSString *)string withSign:(NSString *)signString"第一个参数就是订单信息，第二个参数就是签名值。
- (void)paymentResult:(NSString *)resultDicToString
{
    //结果处理
    AlixPayResult *result = [[AlixPayResult alloc] initWithString:resultDicToString];
    if (result)
    {
        /**
         * 状态码
         * 9000 订单支付成功
         * 8000 正在处理中
         * 4000 订单支付失败
         * 6001 用户中途取消
         * 6002 网络连接出错
         */
        if (result.statusCode == 9000)
        {
            /**
             *用公钥验证签名 严格验证请使用result.resultString与result.signString验签
             */
            // 交易成功
            NSString* key = AlipayPublicKey;
            id<DataVerifier> verifier;
            verifier = CreateRSADataVerifier(key);
            // 参数1：订单信息
            // 参数2：签名值
            /**< resultString.订单信息以及验证签名信息*/
            /*如果你不想做签名验证，那这个字段可以忽略了*/
            if ([verifier verifyString:result.resultString withSign:result.signString])
            {
                // 验证签名成功，交易结果无篡改
                NSLog(@"支付成功!");
            } else {
                NSLog(@"此单被篡改无效!!");
            }
        }
        else
        {
            // 支付失败
            NSLog(@"%d%@", result.statusCode, result.statusMessage);
        }
    }
    else
    {
        // 支付失败
        NSLog(@"支付失败!");
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
