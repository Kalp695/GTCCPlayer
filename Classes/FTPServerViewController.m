//
//  FTPServerViewController.m
//  iphoneLibTest
//
//  Created by gtcc on 2/19/14.
//
//

#import "FTPServerViewController.h"
#import "FtpServer.h"


#define FTP_PORT 20000
@interface FTPServerViewController ()

@end

@implementation FTPServerViewController

@synthesize theServer, baseDir;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

// ----------------------------------------------------------------------------------------------------------
- (void)viewDidAppear:(BOOL) animated  {
    // ----------------------------------------------------------------------------------------------------------
    
	[super viewDidAppear:animated];
	
    ///	NSString *localIPAddress = [ NetworkController localIPAddress ];
	NSString *localIPAddress = [ NetworkController localWifiIPAddress ];												// Changed by RD on 12/2/11 because the 4.3 simulator seems to pause a long time on [ NetworkController localIPAddress]
	NSString *alertTitle = [NSString stringWithFormat:@"%@ %@ %@", @"Connect to", localIPAddress, @"port 20000"];
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:alertTitle
													message:@"The FTP Server has been enabled, please use FTP client software to transfer any import/export data to or from this device.  Press the \"Stop FTP Server\" button once all data transfers have been completed."
												   delegate:self
										  cancelButtonTitle:@"Stop FTP Server"
										  otherButtonTitles:nil];
	[alert show];
	[alert release];
	
    
	
    
	NSArray *docFolders = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES );
	self.baseDir =  [docFolders lastObject];
    
	
	FtpServer *aServer = [[ FtpServer alloc ] initWithPort:20000 withDir:baseDir notifyObject:self ];
	self.theServer = aServer;
	[aServer release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)didReceiveFileListChanged
// ----------------------------------------------------------------------------------------------------------
{
	NSLog(@"didReceiveFileListChanged");
}

// ----------------------------------------------------------------------------------------------------------
- (void)alertView:(UIAlertView *)alert clickedButtonAtIndex:(NSInteger)buttonIndex {
    // ----------------------------------------------------------------------------------------------------------
	if (buttonIndex == 0) {
		[alert dismissWithClickedButtonIndex:0 animated:YES];
		[self stopFtpServer];
	}
}

// This is a method that will shut down the server cleanly, it calles the stopFtpServer method of FtpServer class.
// ----------------------------------------------------------------------------------------------------------
- (void)stopFtpServer {
    // ----------------------------------------------------------------------------------------------------------
	NSLog(@"Stopping the FTP server");
	if(theServer)
	{
		[theServer stopFtpServer];
		[theServer release];
		theServer=nil;
	}
}

@end
