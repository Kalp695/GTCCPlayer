//
//  FTPServerViewController.h
//  iphoneLibTest
//
//  Created by gtcc on 2/19/14.
//
//
#import <UIKit/UIKit.h>
#import "NetworkController.h"

@class FtpServer;

@interface FTPServerViewController : UIViewController {
	FtpServer	*theServer;
	NSString *baseDir;
}

@property (nonatomic, retain) FtpServer *theServer;
@property (nonatomic, copy) NSString *baseDir;

-(void)didReceiveFileListChanged;
- (void)stopFtpServer;

@end