//
//  iphoneLibTestAppDelegate.h
//  iphoneLibTest
//
//  Created by Richard Dearlove on 23/10/2008.
//  Copyright DiddySoft 2008. All rights reserved.
//

#import <UIKit/UIKit.h>


@class TabBarViewController;

@interface iphoneLibTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TabBarViewController *viewController;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TabBarViewController *viewController;

@end

