//
//  ReadMe.h
//  Uber
//
//  Created by Benjamin on 1/3/16.
//  Copyright © 2016 Benjamin. All rights reserved.
//

#ifndef ReadMe_h
#define ReadMe_h


#endif /* ReadMe_h */

增加地址定位功能
1、Info.plist配置
NSLocationAlwaysUsageDescription或者
NSLocationWhenInUseUsageDescription     bool true

NSLocationUsageDescription设置描述信息：我们以此设置您的乘车位置，并改进我们的服务，你可以再"隐私服声明"中了解更多

银联支付
1、	使用UPPaymentControl需要添加CFNetwork.framework、ＳystemConfiguration.framework 、libz、libPaymentControl.a到工程中（Build phases -> Link Binary with Libraries）
2、在工程info.plist设置中添加一个URL Types回调协议(在UPPayDemo工程中使用“UPPayDemo”作为协议)，用于在支付完成后返回商户客户端。
3、 增加
<key>NSAppTransportSecurity</key>
<dict>
<key>NSAllowsArbitraryLoads</key><true/>
</dict>
4、添加协议白名单
在Xcode7.0之后的版本中进行开发，需要在工程对应的plist文件中，添加LSApplicationQueriesSchemes  Array并加入uppaysdk、uppaywallet、uppayx1、uppayx2、uppayx3五个item