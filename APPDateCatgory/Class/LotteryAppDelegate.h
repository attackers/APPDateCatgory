//
//  AppDelegate.h
//  lottery
//
//  Created by wayne on 17/1/17.
//  Copyright © 2017年 way. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTabBarController.h"
@interface LotteryAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (assign, nonatomic) BOOL isFisrt;

@property (nonatomic,retain)MainTabBarController * maiTabBarController;
@property (nonatomic, assign) BOOL showToastMaopao;

@end

