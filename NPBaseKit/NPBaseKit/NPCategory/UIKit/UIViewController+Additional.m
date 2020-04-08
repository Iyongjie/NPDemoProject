//
//  UIViewController+Additional.m
//  NPBaseKit
//
//  Created by 李永杰 on 2020/4/3.
//  Copyright © 2020 NewPath. All rights reserved.
//

#import "UIViewController+Additional.h"
#import <objc/runtime.h>

static const NSString *kNavigationBar = @"kNavigationBar";
static const NSString *kContentView = @"kContentView";
static const NSString *kIsCanSideBack = @"kIsCanSideBack";

@implementation UIViewController (Additional)
 
- (void)addNavigationBar {
    self.navigationBar = [NPNavigationBar NPNavigationBar];
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageNamed:@"fanhui1"] forState:UIControlStateNormal];
    [leftBtn setImageEdgeInsets:UIEdgeInsetsMake(12, 12, 12, 12)];
    self.navigationBar.leftItems = [NSMutableArray arrayWithObjects:leftBtn, nil];
    [self.view addSubview:self.navigationBar];
}

- (void)addContentView {
    self.contentView = [[UIView alloc]initWithFrame:CGRectMake(0, NPNavigationHeight, NPNavigationBarScreenWidth, self.view.frame.size.height - NPNavigationHeight)];
    [self.view addSubview:self.contentView];
}

#pragma mark - runtime
- (void)setNavigationBar:(NPNavigationBar *)navigationBar {
    objc_setAssociatedObject(self, &kNavigationBar, navigationBar, OBJC_ASSOCIATION_RETAIN);
}

- (NPNavigationBar *)navigationBar {
    return objc_getAssociatedObject(self, &kNavigationBar);
}

-(void)setIsCanSideBack:(BOOL)isCanSideBack {
    objc_setAssociatedObject(self, &kIsCanSideBack, @(isCanSideBack), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isCanSideBack {
    return objc_getAssociatedObject(self, &kIsCanSideBack);
}

- (void)setContentView:(UIView *)contentView {
    objc_setAssociatedObject(self, &kContentView, contentView, OBJC_ASSOCIATION_RETAIN);
}

- (UIView *)contentView {
    return objc_getAssociatedObject(self, &kContentView);
}

/*禁用边缘返回*/
-(void)forbiddenSideBack{
    
    self.isCanSideBack = NO;
    //关闭ios右滑返回
//    if([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.navigationController.interactivePopGestureRecognizer.delegate = self;
//    }
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}

/*恢复边缘返回*/
- (void)resetSideBack {
    self.isCanSideBack=YES;
    //开启ios右滑返回
//    if([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
//    }
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer*)gestureRecognizer {
//    return self.isCanSideBack;
//}

// MARK: 适配iOS跳转
+(void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        SEL oldSel = @selector(presentViewController:animated:completion:);
        SEL newSel = @selector(NP_presentViewController:animated:completion:);
        
        Method old = class_getInstanceMethod([self class], oldSel);
        Method new = class_getInstanceMethod([self class], newSel);
        if (class_addMethod([self class], oldSel, method_getImplementation(new), method_getTypeEncoding(new))) {
            
            class_replaceMethod([self class], newSel, method_getImplementation(old), method_getTypeEncoding(old));
        }else {
            
            method_exchangeImplementations(old, new);
        }
    });
}

- (void)NP_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    
    if (@available(iOS 13.0, *)) {
        
        if (viewControllerToPresent.isAdapterPresentStyle) {
            
            viewControllerToPresent.modalPresentationStyle = UIModalPresentationFullScreen;
        }
    }
    [self NP_presentViewController:viewControllerToPresent animated:flag completion:completion];
}

- (BOOL)isAdapterPresentStyle {
    
    NSNumber *obj = objc_getAssociatedObject(self, @selector(isAdapterPresentStyle));
    return obj ? [obj boolValue] : [self.class NP_GlobalSetModalPresentationStyle];
}

-(void)setIsAdapterPresentStyle:(BOOL)NP_setModalPresentationStyle {
    
    objc_setAssociatedObject(self, @selector(isAdapterPresentStyle), @(NP_setModalPresentationStyle), OBJC_ASSOCIATION_ASSIGN);
}

//以后迭代版本,想全部用系统之前样式(排除UIImagePickerController,UIAlertController)
+ (BOOL)NP_GlobalSetModalPresentationStyle {
    
    if ([self isKindOfClass:[UIImagePickerController class]] || [self isKindOfClass:[UIAlertController class]]) {
        
        return NO;
    }
    return YES;
}
@end
