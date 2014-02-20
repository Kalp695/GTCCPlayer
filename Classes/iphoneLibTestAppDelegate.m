//
//  iphoneLibTestAppDelegate.m
//  iphoneLibTest
//
//  Created by Richard Dearlove on 23/10/2008.
//  Copyright DiddySoft 2008. All rights reserved.
//

#import "iphoneLibTestAppDelegate.h"
#import "TabBarViewController.h"
@implementation iphoneLibTestAppDelegate

@synthesize window;
@synthesize viewController;


//- (void)applicationDidFinishLaunching:(UIApplication *)application {    
//    
//    // Override point for customization after app launch    
//    [window addSubview:viewController.view];
//	NSLog(@"added subview");
//    [window makeKeyAndVisible];
//	
//
//}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    [[NSBundle mainBundle] loadNibNamed:@"TabBarController" owner:self options:nil];
    [self.window addSubview:self.viewController.view];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
