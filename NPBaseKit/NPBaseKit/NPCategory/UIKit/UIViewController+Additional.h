//
//  UIViewController+Additional.h
//  NPBaseKit
//
//  Created by 李永杰 on 2020/4/3.
//  Copyright © 2020 NewPath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "NPNavigationBar.h"
 
@interface UIViewController (Additional) <UIGestureRecognizerDelegate>
 
@property (nonatomic, strong) NPNavigationBar   *navigationBar;

@property (nonatomic, strong) UIView            *contentView;

- (void)addNavigationBar;

- (void)addContentView;
 
// 适配iOS13 跳转, 某个控制器想用系统默认,则设置NO
@property (nonatomic, assign) BOOL              isAdapterPresentStyle;

@property (nonatomic, assign) BOOL              isCanSideBack;

/*禁用边缘返回*/
-(void)forbiddenSideBack;

/*恢复边缘返回*/
- (void)resetSideBack;

@end
