//
//  RVXAppDelegate.m
//  REVOCS
//
//  Created by CocoaPods on 07/13/2014.
//  Copyright (c) 2014 NeetHouse. All rights reserved.
//

#import "RVXAppDelegate.h"

#import "MyTheme.h"


@implementation RVXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [UIWindow.alloc initWithFrame:[UIScreen mainScreen].bounds];
    
    if (NSClassFromString(@"REVOCSTest")) {
        // テスト実行時は storyboard は表示しない
        self.window.rootViewController = [UIViewController new];
        self.window.rootViewController.view.backgroundColor = [UIColor whiteColor];
        
    } else {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
        
        self.window.rootViewController = sb.instantiateInitialViewController;
    }
    
    [MyTheme rvx_setSharedTheme:[MyTheme.alloc initLightTheme]];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}
							
@end
