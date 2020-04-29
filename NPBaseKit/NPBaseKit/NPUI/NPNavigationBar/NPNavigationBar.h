//
//  NPNavigationBar.h
//  NPBaseKit
//
//  Created by 李永杰 on 2020/4/3.
//  Copyright © 2020 NewPath. All rights reserved.
//

#import <UIKit/UIKit.h>
 
#define NPNavigtionBarTop                       CGRectGetHeight([UIApplication sharedApplication].statusBarFrame)
#define NPNavigationHeight                      (NPNavigtionBarTop + 44)
#define NPNavigationBarScreenWidth              [UIScreen mainScreen].bounds.size.width
 
@protocol NPNavigationBarDelegate <NSObject>

@optional
-(void)didClickNavigationWithTag:(NSInteger )tag;

@end
//点击事件
typedef void(^NPNavigationBarActionBlock)(NSInteger tag);

//七种排版类型
typedef NS_ENUM(NSInteger,NPNavigationBarStyle){
    NPNavigationBarStyleDefault,
    NPNavigationBarStyleMiddleAndRight,
    NPNavigationBarStyleRightOnly,
    NPNavigationBarStyleLeftAndMiddle,
    NPNavigationBarStyleLeftOnly,
    NPNavigationBarStyleMiddleOnly,
    NPNavigationBarStyleLeftAndRight
};
//添加左或者右item
typedef NS_ENUM(NSInteger,NPNavigationBarItemPosition){
    NPNavigationBarItemPositionLeft,
    NPNavigationBarItemPositionRight
};
//item的tag从423开始，右边的item的tag从523开始
typedef NS_ENUM(NSInteger,NPNavigationBarItemTag){
    NPNavigationBarItemTagLeft = 423,
    NPNavigationBarItemTagRight = 523
};


@interface NPNavigationBar : UIView
//中间title，颜色，字体,单个设置或者用富文本
@property (nonatomic, copy)   NSString                          *title;
@property (nonatomic, strong) UIColor                           *titleLabelColor;
@property (nonatomic, strong) UIFont                            *titleLabelFont;
@property (nonatomic, strong) NSAttributedString                *titleLabelAttribute;
//左右item和中间的自定义视图
@property (nonatomic, copy)   NSMutableArray                    *leftItems;
@property (nonatomic, copy)   NSMutableArray                    *rightItems;
@property (nonatomic, strong) UIView                            *headerView;
//排版类型
@property (nonatomic, assign) NPNavigationBarStyle              navigationStyle;
//处理事件，block回调
@property (nonatomic, copy)   NPNavigationBarActionBlock        actionBlock;
//处理事件，代理
@property (nonatomic, assign) id<NPNavigationBarDelegate>       navigationBarDelegate;

//设置背景颜色
-(void)setBackgroundColor:(UIColor *)backgroundColor;
//设置背景图片
-(void)setBackgroundImageName:(NSString *)backgroundImageName;
//设置透明度,所有控件，或者只设置背景
-(void)setBackAlpha:(CGFloat)backAlpha onlyBack:(BOOL)yes;
//设置导航栏上按钮的颜色
-(void)setNavTintColor:(UIColor *)color;
//设置线条颜色
-(void)setLineColor:(UIColor *)lineColor;
//设置线条是否隐藏
-(void)setLineHidden:(BOOL)hidden;

//创建导航栏
+(instancetype)NPNavigationBar;
//可以动态添加item
-(void)addItemWithPosition:(NPNavigationBarItemPosition )position item:(UIButton *)item;
//Y方向偏移
-(void)transitionY:(CGFloat)y;
//设置导航栏itemframe
-(void)setItemWithTag:(int)tag title:(NSString *)title titleColor:(UIColor *)color backgroundColor:(UIColor *)backgroundColor font:(UIFont *)font radius:(CGFloat )radius state:(UIControlState )state;
-(void)setItemWithTag:(int)tag image:(NSString *)imageName edgInset:(UIEdgeInsets)edgInset state:(UIControlState)state;

@end
