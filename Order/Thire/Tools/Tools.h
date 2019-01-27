//
//  Tools.h
//  YBDriver
//
//  Created by 凯东源 on 16/8/30.
//  Copyright © 2016年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ProductModel.h"
#import "ProductPolicyModel.h"
#import "PromotionOrderModel.h"
#import "PromotionDetailModel.h"

@interface Tools : NSObject

/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

//请求API
//方式：POST
//类型：application/x-www-form-urlencoded
+ (NSString *)postAPI:(NSString *)urlStr andString:(NSString *)postStr;

/*!
 * @brief 把字典转换成JSON字符串
 * @param dict 字典
 * @return 返回JSON字符串
 */
+ (NSString *)JsonStringWithDictonary:(NSDictionary *)dict;

/**
 提示，单行
 
 @param view  父窗口
 @param title 标题
 */
+ (void)showAlert:(NSObject *)view andTitle:(NSString *)title;

/**
 提示，多行
 
 @param view  父窗口
 @param title 标题
 */
+ (void)showAlertMulLineText:(UIView *)view andTitle:(NSString *)title;

/**
 提示带时间参数
 
 @param view  父窗口
 @param title 标题
 @param time  停留时间
 */
+ (void)showAlert:(nullable UIView *)view andTitle:(nullable NSString *)title andTime:(NSTimeInterval)time;

/// 网络状态
+ (BOOL)isConnectionAvailable;

/**
 * 获取手机当前时间
 *
 * return 手机当前时间 "yyy-MM-dd HH:mm:ss"
 */
+ (NSString *)getCurrentDate;

/**
 *	@brief	浏览头像
 *
 *	@param 	oldImageView 	头像所在的imageView
 */
+(void)showImage:(UIImageView*)avatarImageView;

/// 筛选出最小的数
+ (NSInteger)getMinNumber:(NSInteger)a andB:(NSInteger)b;

/// 淡入效果的转场动画
+ (void)setRootViewControllerWithCrossDissolve:(UIWindow *)window andViewController:(UIViewController *)vc;

/// 从右翻转的转场动画
+ (void)setRootViewControllerWithFlipFromRight:(UIWindow *)window andViewController:(UIViewController *)vc;

/// 设置导航栏的Title颜色
+ (void)setNavigationControllerTitleColor:(UINavigationController *)nav;

/// 订单状态中英文转换(获取订单状态)
+ (NSString *)getOrderStatus:(NSString *)s;

/// 角色中英文转换
+ (NSString *)getRoleName:(NSString *)s;

/// 获取订单流程
+ (NSString *)getOrderState:(NSString *)s;

/// 获取付款方式
+ (NSString *)getPaymentType:(NSString *)s;

/// 产品模型转字典
+ (NSDictionary *)setProdictModel:(ProductModel *)m;

/// 产品政策转字典
+ (NSDictionary *)setProductPolicyModel:(ProductPolicyModel *)m;

/// 产品促销转字典
+ (NSDictionary *)setPromotionOrderModel:(PromotionOrderModel *)m;

/// 促销详情转字典
+ (NSDictionary *)setPromotionDetailModel:(PromotionDetailModel *)m;

/**
 * 根据支付类型英文字段获取显示的支付类型的中文字段
 *
 * @param key 英文字段
 * @return 字符类型中文字段
 */
+ (NSString *)getPayTypeText:(NSString *)key;

//将 Product 实体类转换成 PromotionDetail 实体类
+ (NSMutableArray *)ChangeProductToPromotionDetailUtil:(NSMutableArray *)pmds;

/// 保留2位小数
+ (double)getDouble:(double)d;

/// 时间格式转换 yyyy-MM-dd 转 yyyy-MM-dd HH:mm:ss
+ (NSString *)DateTransFrom:(NSString *)time;

/// 添加走马灯
+ (void)msgChange:(CGFloat)overflowWidth andLabel:(UILabel *)_goodsNameLabel andBeginAnimations:(NSString *)animationName;


/**
 给导航控制器添加右更多item
 
 @param vc 需要item的控制器
 @param action 事件
 */
+ (void)addNavRightItemTypeMore:(nullable UIViewController *)vc andAction:(nullable SEL)action;


/**
 给导航控制器添加右添加item
 
 @param vc 需要item的控制器
 @param action 事件
 */
+ (void)addNavRightItemTypeAdd:(nullable UIViewController *)vc andAction:(nullable SEL)action;


/**
 给导航控制器添加右文字item
 
 @param vc     需要item的控制器
 @param action 事件
 @param title  标题
 */
+ (void)addNavRightItemTypeText:(nullable UIViewController *)vc andAction:(nullable SEL)action andTitle:(nullable NSString *)title;


/**
 时间加法（负数为减法）
 
 @param second 秒
 
 @return 相加后时间 yyyy-MM-dd HH:mm:ss
 */
+ (nullable NSString *)getCurrentBeforeDate_Second:(NSTimeInterval)second;


/**
 根据 NSString width, 计算NSString高度
 
 @param text     文字
 @param fontSize 字体大小
 @param width    width
 
 @return NSString 高度
 */
+ (CGFloat)getHeightOfString:(nullable NSString *)text fontSize:(CGFloat)fontSize andWidth:(CGFloat)width;


/**
 格式 2017-06-09 00:00:00 转成 2017-06-09

 @param yyyy_mm_dd_hh_mm_ss 2017-06-09 00:00:00

 @return 2017-06-09
 */
+ (nullable NSString *)getDate_yyyy_mm_dd_hh_mm_ss:(nullable NSString *)yyyy_mm_dd_hh_mm_ss;



/**
 根据 NSString, 计算NSString宽度

 @param text     文字
 @param fontSize 字体大小

 @return NSString 宽度
 */
+ (CGFloat)getWidthOfString:(nullable NSString *)text fontSize:(CGFloat)fontSize;


/**
 获取当前日期 例如：2017-07

 @return yyyy-mm
 */
+ (nullable NSString *)getCurrentDate_yyyy_mm;

/**
 获取当前日期 例如：2018-11-27
 
 @return yyyy-mm-dd
 */
+ (nullable NSString *)getCurrentDate_yyyy_mm_dd;


/**
 禁止边缘返回

 @param nav    导航控制器
 @param enable 是否禁止
 */
+ (void)interactivePopGestureRecognizer:(nullable UINavigationController *)nav andEnable:(BOOL)enable;



/**
 保留字符串后面1位小数
 
 @param str 字符串
 
 @return 带1位小数的字符串
 */
+ (nullable NSString *)OneDecimal:(nullable NSString *)str;



/**
 保留字符串后面2位小数

 @param str 字符串

 @return 带2位小数的字符串
 */
+ (nullable NSString *)TwoDecimal:(nullable NSString *)str;



/**
 智能保留小数
 
 @param f 小数
 
 @return 已去掉小数点后的0
 */
+ (nullable NSString *)formatFloat:(float)f;



/**
 判断字符串是否为nil或""

 @param uu 字符串
 @return 是否为nil或""
 */
+ (BOOL)isEmpty:(nullable NSString *)uu;


/**
 NSString转NSDate

 @param string 格式yyyy-MM-ddHH:mm:ss
 @return 时间Date
 */
+ (nullable NSDate *)dateFromString:(nullable NSString *)string;


/**
 获取当前星期几

 @return 星期日
 */
+ (nullable NSString *)getCurrentWeekDay;


/**
 照片转 base64

 @param image 照片
 @return base64字符串
 */
+ (nullable NSString *)changeImageToString:(nullable UIImage *)image;


/**
 拜访状态转义

 @param VISIT_STATES 拜访状态原型：""，"新建"，"确认客户信息"，"检查库存"，"建议订单"，"生动化陈列"，"离店"
 @return 转义后状态："未拜访"，"拜访中"，"已拜访"
 */
+ (nullable NSString *)getVISIT_STATES:(nullable NSString *)VISIT_STATES;


/// 转半角的函数(DBC case)
/// 任意字符串
/// 半角字符串
/// 全角空格为12288，半角空格为32
/// 其他字符半角(33-126)与全角(65281-65374)的对应关系是：均相差65248
+ (nullable NSString *)ToDBC:(nullable NSString *)input;

+ (UIImage *)createImageWithColor:(UIColor *)color;

@end
