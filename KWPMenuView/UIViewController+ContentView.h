//
//  UIViewController+ContentView.h
//  KWPMenuView
//
//  Created by 朴 根佑 on 2017/10/18.
//  Copyright © 2017年 glocal. All rights reserved.
//

#import <UIKit/UIKit.h>

#define mainScreenOrigin    [UIScreen mainScreen].bounds.origin
#define mainScreenSize      [UIScreen mainScreen].bounds.size

@interface UIViewController (ContentView)

-(void)setContentViewInViewController:(UIViewController*)vc;

-(void)setContentViewFrame:(CGRect)frame
           backgroundColor:(UIColor*)color
          inViewController:(UIViewController*)vc;

-(void)removeContentView;

@end
