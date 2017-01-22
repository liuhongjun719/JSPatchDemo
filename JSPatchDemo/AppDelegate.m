//
//  AppDelegate.m
//  JSPatchDemo
//
//  Created by 123456 on 17/1/19.
//  Copyright © 2017年 123456. All rights reserved.
//

#import "AppDelegate.h"
#import "JPEngine.h"
#import "ViewController.h"
#import <JSPatchPlatform/JSPatch.h>

@interface AppDelegate ()


@end

@implementation AppDelegate
//autoConvertOCType()
//http://jspatch.com/apps
//https://github.com/bang590/JSPatch/wiki/JS-断点调试


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //三种方法展示不同的界面
    /**
     *  一.读取本地的JavaScript文件进行代码运行(main1.js文件)
     */
    /*
    [JPEngine startEngine];
    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"main1" ofType:@"js"];
    NSString *script = [NSString stringWithContentsOfFile:sourcePath encoding:NSUTF8StringEncoding error:nil];
    [JPEngine evaluateScript:script];
     
     self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
     ViewController *rootViewController = [[ViewController alloc] init];
     UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
     self.window.rootViewController = navigationController;
     [self.window makeKeyAndVisible];
     
     [[UINavigationBar appearance] setBackgroundImage:nil forBarMetrics:UIBarMetricsCompact];
    */
    
    
    
    /**
     *  二.获取网络的JavaScript文件进行代码运行(main.js文件)
     */
    /*
    [JSPatch startWithAppKey:@"4a4ce3160911c906"];
    //使用的是文件rsa_public_key.pem中的publicKey，Public Key 以字符串的方式传入，注意换行处要手动加换行符\n
    //自定义 RSA 密钥
    NSString *RSAPublicKey = @"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDA7BdRJX4IwecjT4oHlY7fVQtq\npPIx83n7x1L+RpKWd/lhPbQQIhZN9W4XKOlEZqvuJuSSuooQwKHveJ0NEdYhyI3O\nQvg0Y1r7/ehlTqjyspcgMgJ8/f6pBncHLjeBDEkS6geQmk0i3v9HJpZYnlyx2tW4\nKE582c1ZYMWeT3oz1wIDAQAB\n-----END PUBLIC KEY-----";
    //用来检测回调的状态，是更新或者是执行脚本之类的，相关信息，会打印在你的控制台
    [JSPatch setupCallback:^(JPCallbackType type, NSDictionary *data, NSError *error) {
    }];
    [JSPatch setupRSAPublicKey:RSAPublicKey];
    [JSPatch sync];
     
     self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
     ViewController *rootViewController = [[ViewController alloc] init];
     UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
     self.window.rootViewController = navigationController;
     [self.window makeKeyAndVisible];
     
     [[UINavigationBar appearance] setBackgroundImage:nil forBarMetrics:UIBarMetricsCompact];
    */
    
    
    /**
     *   三.Dribbble,实现动态加载数据(https://github.com/bang590/JSPatch/tree/master/Demo/DribbbleDemo)
     */
    [JPEngine startEngine];
    NSString *sourcePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"main.js"];
    [JPEngine evaluateScriptWithPath:sourcePath];
    [self initRootViewController];

    return YES;
}

- (void)initRootViewController
{
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


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
