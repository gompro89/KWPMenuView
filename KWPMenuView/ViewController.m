//
//  ViewController.m
//  KWPMenuView
//
//  Created by 朴 根佑 on 2017/10/18.
//  Copyright © 2017年 glocal. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+KWPRootViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIStoryboard *rootStoryBoard = [UIStoryboard storyboardWithName:@"Root" bundle:nil];
    self.contentController = [rootStoryBoard instantiateViewControllerWithIdentifier:@"KWPContentViewController"];
    [self setMenuController:[rootStoryBoard instantiateViewControllerWithIdentifier:@"KWPMenuViewController"]
              directionType:MENU_DIRECTION_BOTTOM
                 widthRatio:0.7];
    
    [self setContentTouch_HideMenuMode:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
