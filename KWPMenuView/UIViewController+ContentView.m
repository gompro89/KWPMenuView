//
//  UIViewController+ContentView.m
//  KWPMenuView
//
//  Created by 朴 根佑 on 2017/10/18.
//  Copyright © 2017年 glocal. All rights reserved.
//

#import "UIViewController+ContentView.h"

@implementation UIViewController (ContentView)

-(void)setContentViewInViewController:(UIViewController*)vc
{
    [self setContentViewFrame:CGRectZero
              backgroundColor:nil
             inViewController:vc];
}

-(void)setContentViewFrame:(CGRect)frame
           backgroundColor:(UIColor*)color
          inViewController:(UIViewController*)vc
{
    
    NSAssert (vc != nil, @"inViewControllerが正しくありません。(inViewController == nil)");
    
    [vc addChildViewController:self];
    
    if (CGRectIsEmpty(frame))
    {
        CGFloat originX = 0;
        CGFloat originY = 0;
        CGFloat sizeW = mainScreenSize.width;
        CGFloat sizeH = mainScreenSize.height;
        
        frame = CGRectMake(originX,originY,sizeW,sizeH);
    }
    [self.view setFrame:frame];
    
    if (color != nil){
        [self.view setBackgroundColor:color];
    }

    [vc.view addSubview:self.view];
    [self didMoveToParentViewController:vc];
    
}

-(void)removeContentView
{
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
    
}

@end
