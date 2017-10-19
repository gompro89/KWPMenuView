//
//  KWPRootViewController.h
//  KWPMenuView
//
//  Created by 朴 根佑 on 2017/10/18.
//  Copyright © 2017年 glocal. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    MENU_DIRECTION_TOP,
    MENU_DIRECTION_RIGHT,
    MENU_DIRECTION_BOTTOM,
    MENU_DIRECTION_LEFT,
} MENU_DIRECTION;

@interface KWPRootViewController : UIViewController

@property (assign, nonatomic, readonly) BOOL isShowing;

@property (assign, nonatomic, readonly) MENU_DIRECTION menuDirection;
@property (assign, nonatomic, readonly) CGFloat        menuWidthRatio;

@property (strong, nonatomic) UINavigationController *contentController;

@property (strong, nonatomic, readonly) UIViewController *menuController;
- (void)setMenuController:(UIViewController *)menuController
            directionType:(MENU_DIRECTION)directionType
               widthRatio:(CGFloat)widthRatio;

/*
 * menuAction
 */
-(void)showMenu:(BOOL)animate;
-(void)hideMenu:(BOOL)animate;
-(void)showNHideMenu:(BOOL)animate;

@end
