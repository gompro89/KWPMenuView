//
//  UIViewController+KWPRootViewController.m
//  KWPMenuView
//
//  Created by 朴 根佑 on 2017/10/18.
//  Copyright © 2017年 glocal. All rights reserved.
//

#import "UIViewController+KWPRootViewController.h"

@implementation UIViewController (KWPRootViewController)

-(KWPRootViewController *)rootViewController
{
    UIViewController *iter = self.parentViewController;
    while (iter) {
        if ([iter isKindOfClass:[KWPRootViewController class]])
            return (KWPRootViewController *)iter;
        else if (iter.parentViewController && iter.parentViewController != iter)
            iter = iter.parentViewController;
        else
            iter = nil;
    }
    
    return nil;

}


@end
