//
//  AppDelegate.m
//  3DTouchTest
//
//  Created by Mr_zhaohy on 2017/10/22.
//  Copyright © 2017年 Mr_zhaohy. All rights reserved.
//

#import "AppDelegate.h"
#import "ShortcutManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if(![UIApplication sharedApplication].shortcutItems.count){
        [[ShortcutManager shared] addShortcutItemWithTitle:@"测试" desc:@"说明" icon:@"" key:@"123"];
        [[ShortcutManager shared] addShortcutItemWithTitle:@"测试1" desc:@"说明1" icon:@"" key:@"321"];
        [[ShortcutManager shared] addShortcutItemWithTitle:@"测试2" desc:@"说明2" icon:@"" key:@"213"];
        [[ShortcutManager shared] addShortcutItemWithTitle:@"测试3" desc:@"说明3" icon:@"" key:@"132"];
        [[ShortcutManager shared] apply];
    }
    
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    NSString *key = [[ShortcutManager shared] keyOfItem:shortcutItem];
    [[ShortcutManager shared] removeItemForKey:key];
}
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
