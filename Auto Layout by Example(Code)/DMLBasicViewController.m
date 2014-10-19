//
//  DMLBasicViewController.m
//  Auto Layout by Example(Code)
//
//  Created by dongmeiliang on 9/28/14.
//  Copyright (c) 2014 dongmeilianghy@sina.com. All rights reserved.
//

#import "DMLBasicViewController.h"

@interface DMLBasicViewController ()
@property (weak, nonatomic) IBOutlet UIButton *higherHorizontalContentHuggingProrityButton;
@property (weak, nonatomic) IBOutlet UIButton *lowerHorizontalContentHuggingProrityButton;

@property (weak, nonatomic) IBOutlet UILabel *higherCompressionResistancePriorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowerCompressionResistancePriorityLabel;


- (IBAction)ChangeHorizontalContentHuggingPrority:(id)sender;
- (IBAction)changeHorizontalCompressionResistancePriority:(id)sender;

@end

@implementation DMLBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.topLayoutGuide;
//    self.bottomLayoutGuide;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)ChangeHorizontalContentHuggingPrority:(id)sender {
    
    NSString *higherProrityTitile = [self.higherHorizontalContentHuggingProrityButton titleForState:UIControlStateNormal];
    NSString *lowerProrityTitile = [self.lowerHorizontalContentHuggingProrityButton titleForState:UIControlStateNormal];
    
    if ([higherProrityTitile isEqualToString:lowerProrityTitile]) {
        [self.higherHorizontalContentHuggingProrityButton setTitle:@"higherHuggingPrority" forState:UIControlStateNormal];
        [self.lowerHorizontalContentHuggingProrityButton setTitle:@"lowerHuggingPrority" forState:UIControlStateNormal];
    } else {
        [self.higherHorizontalContentHuggingProrityButton setTitle:@"Same" forState:UIControlStateNormal];
        [self.lowerHorizontalContentHuggingProrityButton setTitle:@"Same" forState:UIControlStateNormal];
    }
}

- (IBAction)changeHorizontalCompressionResistancePriority:(id)sender {
    
    NSString *higherResistanceLabelText = self.higherCompressionResistancePriorityLabel.text;
    NSString *lowerResistanceLabelText = self.lowerCompressionResistancePriorityLabel.text;
    
    if ([higherResistanceLabelText isEqualToString:lowerResistanceLabelText]) {
        self.higherCompressionResistancePriorityLabel.text = @"High Comp Resistance Priority";
        self.lowerCompressionResistancePriorityLabel.text = @"Low Comp Resistance Priority";
    } else {
        
        self.higherCompressionResistancePriorityLabel.text = @"Same";
        self.lowerCompressionResistancePriorityLabel.text = @"Same";
    }
}
@end
