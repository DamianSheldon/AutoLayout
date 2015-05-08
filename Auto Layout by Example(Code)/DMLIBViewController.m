//
//  DMLNibViewController.m
//  Auto Layout by Example(Code)
//
//  Created by dongmeiliang on 5/3/14.
//  Copyright (c) 2014 dongmeilianghy@sina.com. All rights reserved.
//

#import "DMLIBViewController.h"

@interface DMLIBViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *label;



@end

@implementation DMLIBViewController

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
    // Do any additional setup after loading the view.
    
    NSLog(@"containerView frame:%@", NSStringFromCGRect(self.containerView.frame));
    NSLog(@"scrollView frame:%@", NSStringFromCGRect(self.scrollView.frame));
    NSLog(@"label frame:%@", NSStringFromCGRect(self.label.frame));

}

@end
