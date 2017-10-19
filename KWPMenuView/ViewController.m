//
//  ViewController.m
//  KWPMenuView
//
//  Created by 朴 根佑 on 2017/10/18.
//  Copyright © 2017年 glocal. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+KWPRootViewController.h"
#import "UIViewController+ContentView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.contentController = [self.storyboard instantiateViewControllerWithIdentifier:@"KWPContentViewController"];
    [self setMenuController:[self.storyboard instantiateViewControllerWithIdentifier:@"KWPMenuViewController"]
              directionType:MENU_DIRECTION_LEFT
                 widthRatio:0.7];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
