//
//  MainTabBarViewController.m
//  iphoneLibTest
//
//  Created by gtcc on 2/19/14.
//
//

#import "MainTabBarViewController.h"
#import "VideoListTableViewController.h"
#import "FTPServerViewController.h"
#import "iphoneLibTestViewController.h"
@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

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
    
    NSMutableArray * items = [[NSMutableArray alloc] init];
    VideoListTableViewController * videoController = [[VideoListTableViewController alloc] init];
    [items addObject:videoController];
    
    FTPServerViewController *ftpController = [[FTPServerViewController alloc] init];
    [items addObject:ftpController];
    
    [self setTitle:@"TabBarController"];
    [self setViewControllers:items];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
