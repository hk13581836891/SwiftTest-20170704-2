//
//  Tools.h
//  CCTVNews
//
//  Created by Richy Leo on 14-8-27.
//  Copyright (c) 2014年 Richy Leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"
#import <CoreText/CoreText.h>
/**
 * Description : 工具类，创建一些通用的视图或者字符串处理
 *
 */

@interface Tools : NSObject
#define UUID [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString]
#define SystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]
#define ShortVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]


/**
 取消通知红点
 
 @param cancleStr 取消类型
 */

+(void)cancleNoticeRedDot:(NSString *)cancleStr;
+(void)addOrCancleLikeWithView:(UIView*)view CommentId:(NSString *)commentId WithType:(BOOL)isLike success:(void(^)(BOOL islikeSuccess))success;

//启动页机制
+(void)getLaunchImageUrl;
//状态栏显示/隐藏
+(void)statuBarShowOrHide;
//nsstring转 uiimage
+(UIImage *)Base64StrToUIImage:(NSString *)imageStr;
//获取导航控制器
+ (UINavigationController*)navigationController:(UIView *)view;
+ (UIViewController*)VC:(UIView *)view;
//获取view的控制器
+ (UIViewController*)viewController :(UIView *)view;
//时间格式转换 long型转字符串
+(NSString *)changeTimeStyle:(id)newsTime;
/**
 创建button
 */
+(UIButton *)creatButtonTarget:(id)target
                         title:(NSString*)title
                    titleColor:(UIColor *)titleColor
                     titleFont:(CGFloat)fontSize
               titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets
                         image:(UIImage *)image
               imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets
                       cornerR:(CGFloat)cornerR
                       borderW:(CGFloat)borderW
                   borderColor:(UIColor*)borderColor
               backGroundColor:(UIColor *)backGroundColor
                        action:(SEL)action;
/**
 lable改变属性
 @param lineSpacing 行间距
 @param color 文本颜色
 @param rang1 需要改变的颜色
 @param rang2 需要改变的颜色
  
 */
+(UILabel *)creatLabel_LineSpacing_Color:(NSString *)content
                               textColor:(UIColor *)textColor
                                    font:(UIFont *)font
                             lineSpacing:(CGFloat)lineSpacing
                                   color:(UIColor *)color
                                  range1:(NSRange)rang1
                                  range2:(NSRange)rang2;
//仅提示 alert
+(void)creatAlertController:(id)target
                      title:(NSString *)title
                    message:(NSString *)message;
//意见反馈
+(NSString *)makeFeedback_save:(NSString *)user_id
                  current_time:(long)current_time
                       content:(NSString *)content
                       contact:(NSString *)contact;
//app 运行时长统计参数
+(NSString *)makeUseTimeUserid:(NSString *)user_id
                  current_time:(long)current_time
                     exit_time:(long)exit_time
                    start_time:(long)start_time
                      use_time:(long)use_time;
//json 转字符串
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;
+(NSString *)getReturnResult:(NSDictionary *)dic key:(NSString *)key;
//网络不通详情返回提示
+(UIAlertView * )creatAlertNotReachable:(id)target;

//服务器联通状态
+(void)serverLinkStatus:(void (^)(BOOL bResult, NSString* errDesc))success;
//数据请求返回为空时提示
+(UILabel *)createTipLabel:(NSString *)content;
//获取用户 id
+(NSString *)getUserId;
//在view中显示提示信息
+ (void)showSpinnerInView:(UIView *)view prompt:(NSString *)prompt;
+ (void)hideSpinnerInView:(UIView *)view;
+ (void)showPrompt:(NSString *)prompt inView:(UIView *)view delay:(NSTimeInterval)delay;

//根据文件名获取图片
+ (UIImage *)imageWithName:(NSString *)name;

//创建label
+ (UILabel *)initLabel:(CGRect)frame content:(NSString *)content color:(UIColor *)color font:(UIFont *)font aliment:(NSTextAlignment)aliment;
+ (UILabel *)initLabel:(NSString *)content color:(UIColor *)color font:(UIFont *)font;

//创建button
+ (UIButton *)createButtonWithNormalImage:(NSString *)normal
                           highlitedImage:(NSString *)highlited
                                   target:(id)target
                                   action:(SEL)action;

+ (UIButton *)createButtonWithNormalImage:(NSString *)normal
                            selectedImage:(NSString *)selected
                                   target:(id)target
                                   action:(SEL)action;
//创建navbar
+ (UIBarButtonItem *)createNavButtonItem:(NSString *)normal
                                selected:(NSString *)selected
                                  target:(id)taget
                                  action:(SEL)action;
//创建键盘上的toolBar
+ (UIToolbar *)createKeyBoardAccessViewWithLeftTitles:(NSDictionary *)leftDic rightTitle:(NSDictionary *)rightDic taget:(id)target;

//创建UITextField
+ (UITextField *)createTextFieldWithFrame:(CGRect)frame placeholder:(NSString *)placeholder fontSize:(CGFloat)fontSize;

//统一controller的标题
+ (UILabel *)createTitleLabel:(NSString *)title;

//创建navbar上logo
+(UIView *)createNavView:(UIImage *) image;

//适配方法
+ (float)getCurrentDistinction;

//判断时区 （分享用）
+ (BOOL)isInChina;

+ (NSString *)getUrl:(NSString *)pKey;

+(NSString *)getOpenUDID;

//返回新闻类型
+(NSString *)returnNewsType:(NSInteger)type_;

// 转化成当前当地时区的时间
+(NSString *)wholeDateToString:(NSDate *)date;

// 转化成当前当地时区的时间 时间仅包含（年、月）供收藏排序用
+(NSString *)dateToString:(NSDate *)date;

//返回当前时间长度
+(NSTimeInterval)returnCurrentDateLength;

//设置内容行距
+(void)setContentSpaceLine:(NSString *)contentStr withLabel:(UILabel *)label;

+(NSString *)changeLetterLowercase:(NSString *)source;

// IOS7 自适应宽度 or 高度
+(CGSize)adjustViewWidthOrHeight:(NSString *)content font:(UIFont *)font widthOrHeightValue:(float)value isWidthMax:(BOOL)isWidthMax;

// nav title
+ (NSString *)sectionTitleIndex:(int)index defaultTitle:(NSString *)titleStr;

// AF post
+(void)postWithURLStr:(NSString *)pURL
           parameters:(id)parameters
              success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
// AF get
+(void)getWithURLStr:(NSString *)pURL
          parameters:(id)parameters
             success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
             failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
// AF Queue
+(void)operationQueueURLStrs:(NSArray *)pURLArrs
                     success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                     failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

// 获取前一天或后一天的日期（day负值：前一天）
+(NSString *)getPriousorLaterDateFromDate:(NSDate *)date withDay:(int)day;
//提示框
-(UIView*)makePrompt:(NSString*)passWord;
-(NSInteger)stringFindString:(NSString *)str;
-(NSString*)makeUser_active:(NSString*)user_active andUser_id:(NSString*)user_id;
- (NSString*)stringByURLEncodingStringParameter:(NSString *)ee;

+ (NSString *)checkNullValueForString:(id)object;
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

//保存投票列表避免重复

//返回请求投票问题 id数据
+(NSMutableArray *)voteIDs;

//保存请求的投票问题 id列表
+(void)saveVoteID:(int)voteid;

+ (void)deleteVoteID:(int)voteid;
+ (void)deleteVoteIDs:(NSArray *)voteids;


//存取启动图片
+ (BOOL)LocalHaveImage:(NSString*)key;
+ (UIImage*)GetImageFromLocal:(NSString*)key;
+ (void)SaveImageToLocal:(UIImage*)image Keys:(NSString*)key;
+ (void)SaveStringToLocal:(NSString*)str Keys:(NSString*)key;
+ (NSString *)GetStrFromLocal:(NSString*)key;

// 是否WIFI
+ (BOOL)IsEnableWIFI;
// 是否3G
+ (BOOL)IsEnable3G;
+(BOOL)IsNotReachable;

// 获取沙盒Document的文件目录
+ (NSString *)getDocumentDirectory;
// 获取沙盒Library的文件目录
+ (NSString *)getLibraryDirectory;
// 获取沙盒Library/Caches的文件目录
+ (NSString *)getCachesDirectory;
// 获取沙盒Preference的文件目录
+ (NSString *)getPreferencePanesDirectory;
// 获取沙盒tmp的文件目录
+ (NSString *)getTmpDirectory;

// 根据路径返回目录或文件的大小
+ (double)sizeWithFilePath:(NSString *)path;
// 得到指定目录下的所有文件
+ (NSArray *)getAllFileNames:(NSString *)dirPath;
// 删除指定目录或文件
+ (BOOL)clearCachesWithFilePath:(NSString *)path;
// 清空指定目录下文件
+ (BOOL)clearCachesFromDirectoryPath:(NSString *)dirPath;
+ (BOOL)clearCachesDirectory;
+(CGSize)getImageSizeWithURL:(id)imageURL;

+(int)getHeightWithContent:(NSString *)Content;


+(UIImage *)clipImage:(UIImage *)image toRect:(CGSize)size;

//获取手机设备型号
+(NSString *)getCurrentDeviceModel;

//获取随机uuid
+ (NSString *)randomUUIDString;

@end
