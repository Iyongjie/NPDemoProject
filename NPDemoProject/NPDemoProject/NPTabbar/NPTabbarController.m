//
//  NPTabbarController.m
//  NPDemoProject
//
//  Created by 李永杰 on 2020/3/11.
//  Copyright © 2020 NewPath. All rights reserved.
//

#import "NPTabbarController.h"
#import "NPDemoProject-Swift.h"
#import "NPNavigationController.h"

#define CYLTabBarControllerHeight   (CYL_IS_IPHONE_X ? 83 : 49.f)

@interface NPTabbarController ()

@end

@implementation NPTabbarController

- (instancetype)initWithContext:(NSString *)context {
    /**
     * 以下两行代码目的在于手动设置让TabBarItem只显示图标，不显示文字，并让图标垂直居中。
     * 等 效于在 `-tabBarItemsAttributesForController` 方法中不传 `CYLTabBarItemTitle` 字段。
     * 更推荐后一种做法。
     */
    UIEdgeInsets imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);   // UIEdgeInsetsZero
    UIOffset titlePositionAdjustment = UIOffsetMake(0, 0);
    if (self = [super initWithViewControllers:[self viewControllersForTabBar]
                        tabBarItemsAttributes:[self tabBarItemsAttributesForTabBar]
                                  imageInsets:imageInsets
                      titlePositionAdjustment:titlePositionAdjustment
                                      context:context
                ]) {
        [self customizeTabBarAppearance];
        self.delegate = self;
        self.navigationController.navigationBar.hidden = YES;
    }
    return self;
}
  
- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication] setApplicationSupportsShakeToEdit:YES];
    [self becomeFirstResponder];
}

- (NSArray *)viewControllersForTabBar {
    NPHomeViewController *homeVC = [[NPHomeViewController alloc] init];
    NPNavigationController *homeNav = [[NPNavigationController alloc]
                                                   initWithRootViewController:homeVC];
    homeVC.navigationController.navigationBar.hidden = YES;
    [homeVC cyl_setHideNavigationBarSeparator:YES];
   
    NPShopViewController *shopVC = [[NPShopViewController alloc] init];
    NPNavigationController *shopNav = [[NPNavigationController alloc]
                                                    initWithRootViewController:shopVC];
    shopVC.navigationController.navigationBar.hidden = YES;
    [shopVC cyl_setHideNavigationBarSeparator:YES];
    
    NPMineViewController *mineVC = [[NPMineViewController alloc] init];
    NPNavigationController *mineNav = [[NPNavigationController alloc]       initWithRootViewController:mineVC];
    mineVC.navigationController.navigationBar.hidden = YES;
    [mineNav cyl_setHideNavigationBarSeparator:YES];
    NSArray *viewControllers = @[
                                 homeNav,
                                 shopNav,
                                 mineNav
                                 ];
    return viewControllers;
}

- (NSArray *)tabBarItemsAttributesForTabBar {
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"首页",
                                                 CYLTabBarItemImage : @"tab_home_unselected",
                                                 CYLTabBarItemSelectedImage : @"tab_home_selected"
    };
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"商城",
                                                  CYLTabBarItemImage :@"tab_shop_unselected",
                                                  CYLTabBarItemSelectedImage : @"tab_shop_selected"
    };
    NSDictionary *fourthTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"我的",
                                                  CYLTabBarItemImage :@"tab_mine_unselected",
                                                  CYLTabBarItemSelectedImage : @"tab_mine_selected"
    };
    NSArray *tabBarItemsAttributes = @[firstTabBarItemsAttributes,
                                       secondTabBarItemsAttributes,
                                       fourthTabBarItemsAttributes
                                       ];
    return tabBarItemsAttributes;
}

/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性等等
 */
- (void)customizeTabBarAppearance {
    // Customize UITabBar height
    // 自定义 TabBar 高度
     self.tabBarHeight = CYLTabBarControllerHeight;
    [self rootWindow].backgroundColor = [UIColor whiteColor];
    
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:111/255.0 green:117/255.0 blue:128/255.0 alpha:1];
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:111/255.0 green:117/255.0 blue:128/255.0 alpha:1];

    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
//    [self hideTabBarShadowImageView];
    
    [[UITabBar appearance] setBackgroundImage:[self imageWithColor:[UIColor whiteColor] size:self.tabBar.bounds.size]];
}

- (void)updateTabBarCustomizationWhenTabBarItemWidthDidUpdate {
    void (^deviceOrientationDidChangeBlock)(NSNotification *) = ^(NSNotification *notification) {
        UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
        if ((orientation == UIDeviceOrientationLandscapeLeft) || (orientation == UIDeviceOrientationLandscapeRight)) {
            NSLog(@"Landscape Left or Right !");
        } else if (orientation == UIDeviceOrientationPortrait) {
            NSLog(@"Landscape portrait!");
        }
    };
    [[NSNotificationCenter defaultCenter] addObserverForName:CYLTabBarItemWidthDidChangeNotification
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:deviceOrientationDidChangeBlock];
}

+ (UIImage *)scaleImage:(UIImage *)image {
    CGFloat halfWidth = image.size.width/2;
    CGFloat halfHeight = image.size.height/2;
    UIImage *secondStrechImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(halfHeight, halfWidth, halfHeight, halfWidth) resizingMode:UIImageResizingModeStretch];
    return secondStrechImage;
}

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width + 1, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"🔴类名与方法名：%@（在第%@行），描述：%@", @(__PRETTY_FUNCTION__), @(__LINE__), @"");
}


//缩放动画
- (void)addOnceScaleAnimationOnView:(UIView *)animationView {
    //需要实现的帧动画，这里根据需求自定义
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.values = @[@0.5, @1.0];
    animation.duration = 0.1;
    //    animation.repeatCount = repeatCount;
    animation.calculationMode = kCAAnimationCubic;
    [animationView.layer addAnimation:animation forKey:nil];
}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection  {
    [super traitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13.0, *)) {
#if __has_include(<UIKit/UIScene.h>)
        UIUserInterfaceStyle currentUserInterfaceStyle = [UITraitCollection currentTraitCollection].userInterfaceStyle;
        if (currentUserInterfaceStyle == previousTraitCollection.userInterfaceStyle) {
            return;
        }
#else
#endif
        //TODO:
        [[UIViewController cyl_topmostViewController].navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    }
    
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectControl:(UIControl *)control {
    UIView *animationView;
    if ([control cyl_isTabButton]) {
    
        animationView = [control cyl_tabImageView];
    }
    
    UIButton *button = CYLExternPlusButton;
    BOOL isPlusButton = [control cyl_isPlusButton];
    // 即使 PlusButton 也添加了点击事件，点击 PlusButton 后也会触发该代理方法。
    if (isPlusButton) {
        animationView = button.imageView;
    }
    
    [self addScaleAnimationOnView:animationView repeatCount:1];
   
}

//缩放动画
- (void)addScaleAnimationOnView:(UIView *)animationView repeatCount:(float)repeatCount {
    //需要实现的帧动画，这里根据需求自定义
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
    animation.duration = 1;
    animation.repeatCount = repeatCount;
    animation.calculationMode = kCAAnimationCubic;
    [animationView.layer addAnimation:animation forKey:nil];
}

//旋转动画
- (void)addRotateAnimationOnView:(UIView *)animationView {
    // 针对旋转动画，需要将旋转轴向屏幕外侧平移，最大图片宽度的一半
    // 否则背景与按钮图片处于同一层次，当按钮图片旋转时，转轴就在背景图上，动画时会有一部分在背景图之下。
    // 动画结束后复位
    animationView.layer.zPosition = 65.f / 2;
    [UIView animateWithDuration:0.32 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        animationView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
    } completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.70 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
            animationView.layer.transform = CATransform3DMakeRotation(2 * M_PI, 0, 1, 0);
        } completion:nil];
    });
}
@end
