//
//  KWPRootViewController.m
//  KWPMenuView
//
//  Created by 朴 根佑 on 2017/10/18.
//  Copyright © 2017年 glocal. All rights reserved.
//
#import "KWPRootViewController.h"
#import "KWPMenuViewController.h"
#import "KWPContentViewController.h"

#import "UIViewController+ContentView.h"

@interface KWPRootViewController ()
@property (assign,nonatomic) CGRect menuShowFrame;
@property (assign,nonatomic) CGRect menuHideFrame;

@end

@implementation KWPRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Set View

- (void)setContentController:(UINavigationController *)contentController
{
    NSAssert (contentController != nil, @"contentControllerが正しくありません。(contentController == nil)");
    
    if (_contentController != nil) {
        [_contentController removeContentView];
        _contentController = nil;
        
    }
    _contentController = contentController;
    
    [_contentController setContentViewInViewController:self];
}

- (void)setMenuController:(UIViewController *)menuController
            directionType:(MENU_DIRECTION)directionType
               widthRatio:(CGFloat)widthRatio
{
    
    NSAssert (menuController != nil, @"menuControllerが正しくありません。(menuController == nil)");
    
    if (_menuController != nil) {
        [_menuController removeContentView];
        _menuController = nil;
    }
    _menuController = menuController;
    
    NSAssert ((directionType >= MENU_DIRECTION_TOP && directionType <= MENU_DIRECTION_LEFT), @"_menuDirectionが正しくありません。（MENU_DIRECTIONタイプ参考）");
    _menuDirection = directionType;
    
    
    NSAssert ((widthRatio >= 0 && widthRatio <= 1), @"_menuWidthRatioが正しくありません。（ 0 ~ 1.0 ）");
    _menuWidthRatio = widthRatio;
    
    
    [self setMenuFrame];
    
    [_menuController setContentViewFrame:_menuHideFrame
                         backgroundColor:nil
                        inViewController:self];
    
    _isShowing = NO;
}

-(void)setMenuFrame
{
    CGFloat originX = 0;
    CGFloat originY = 0;
    CGFloat sizeW = mainScreenSize.width;
    CGFloat sizeH = mainScreenSize.height;
    
    _menuShowFrame = CGRectZero;
    _menuHideFrame = CGRectZero;
    
    switch (_menuDirection) {
        case MENU_DIRECTION_TOP:
            sizeH *= _menuWidthRatio;
            
            originY = -sizeH;
            _menuHideFrame = CGRectMake(originX, originY, sizeW, sizeH);
            
            originY = 0;
            _menuShowFrame = CGRectMake(originX, originY, sizeW, sizeH);
            break;
            
            
        case MENU_DIRECTION_BOTTOM:
            sizeH *= _menuWidthRatio;
            
            originY = mainScreenSize.height;
            _menuHideFrame = CGRectMake(originX, originY, sizeW, sizeH);
            
            originY = mainScreenSize.height - sizeH;
            _menuShowFrame = CGRectMake(originX, originY, sizeW, sizeH);
            break;
            
        case MENU_DIRECTION_RIGHT:
            sizeW *= _menuWidthRatio;
            
            originX = mainScreenSize.width;
            _menuHideFrame = CGRectMake(originX, originY, sizeW, sizeH);
            
            originX = mainScreenSize.width - sizeW;
            _menuShowFrame = CGRectMake(originX, originY, sizeW, sizeH);
            break;
            
        default:
            //MENU_DIRECTION_LEFT
            sizeW *= _menuWidthRatio;
            
            originX = -sizeW;
            _menuHideFrame = CGRectMake(originX, originY, sizeW, sizeH);
            
            originX = 0;
            _menuShowFrame = CGRectMake(originX, originY, sizeW, sizeH);
            break;
    }
}

#pragma mark -
#pragma mark Show & Hide

-(void)showMenu:(BOOL)animate
{
    if (animate)
    {
        [UIView animateWithDuration:0.2
                         animations:^{
                             [_menuController.view setFrame:_menuShowFrame];
                         }
                         completion:^(BOOL finished) {
                             _isShowing = YES;
                         }];
    }
    else
    {
        [_menuController.view setFrame:_menuShowFrame];
        _isShowing = YES;
    }
    
}


-(void)hideMenu:(BOOL)animate
{
    if (animate)
    {
        [UIView animateWithDuration:0.2
                         animations:^{
                             [_menuController.view setFrame:_menuHideFrame];
                         }
                         completion:^(BOOL finished) {
                             _isShowing = NO;
                         }];
    }
    else
    {
        [_menuController.view setFrame:_menuHideFrame];
        _isShowing = NO;
    }
}

-(void)showNHideMenu:(BOOL)animate
{
    if (_isShowing == NO)
        [self showMenu:animate];
    else
        [self hideMenu:animate];
}




@end
