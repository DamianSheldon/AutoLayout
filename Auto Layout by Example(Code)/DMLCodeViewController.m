//
//  DMLViewController.m
//  Auto Layout by Example(Code)
//
//  Created by dongmeiliang on 5/1/14.
//  Copyright (c) 2014 dongmeilianghy@sina.com. All rights reserved.
//

#import "DMLCodeViewController.h"

#define Example1    0
#define Example2    0
#define Example3    1

@interface DMLCodeViewController ()

@property (nonatomic, readwrite, retain) IBOutlet UIView *containerView;
@property (nonatomic, readwrite, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, readwrite, retain) IBOutlet UILabel *label;

@end

@implementation DMLCodeViewController

#pragma mark -
#pragma mark Resource Management in View Controllers

/*! viewController.view = nil will call this method.
 
    This is where subclasses should create their custom view hierarchy if they aren't using a nib. Should never be called directly.
 
 * For example, if your app does not use storyboards but you want additional views to be added to the view hierarchy, you override the loadView method to instantiate these views programatically.
 */
/*
- (void)loadView
{
    NSLog(@"%s", __func__);
}
*/

/*
    The view controller calls its viewDidLoad method, which enables your subclass to perform any additional load-time tasks.
 
    Called after the view has been loaded. For view controllers created in code, this is after -loadView. For view controllers unarchived from a nib, this is after the view is set.
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /* Auto Layout by Example (code) */
#if Example1
    //  1. Create a container view to hold the scroll view.
    //self.containerView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x + 20, self.view.frame.origin.y + 20, self.view.frame.size.width - 40, self.view.frame.size.height - 120)];
    self.containerView = [[UIView alloc] initWithFrame:CGRectZero];
    self.containerView.backgroundColor = [UIColor cyanColor];
    
    
    [self.view addSubview:self.containerView];
    
    // 2. Create the scroll view and place it in the container view with all edges equal to zero points.
    //self.scrollView = [[UIScrollView alloc] initWithFrame:self.containerView.bounds];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    self.scrollView.backgroundColor = [UIColor orangeColor];
    
    [self.containerView addSubview:self.scrollView];
    
    // 3. Create and place a subview inside of the scroll view.
    //self.label = [[UILabel alloc] initWithFrame:CGRectMake(self.containerView.frame.origin.x + 22, self.containerView.frame.size.height - 44, self.containerView.frame.size.width - 44, 44)];
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.text = @"This view will always at the buttom!" ;
    self.label.textColor = [UIColor purpleColor];
    //[self.scrollView addSubview:self.label];
    [self.containerView addSubview:self.label];
    
    // 5. Creating Constraints Programmatically
    
    UIView *tmpA, *tmpB;
    /* Add constrains for containerView */
    self.containerView.translatesAutoresizingMaskIntoConstraints = NO;
    
    tmpA = self.view;
    tmpB = self.containerView;
    NSDictionary *viewsDictionary =
    NSDictionaryOfVariableBindings(tmpA, tmpB);
    NSArray *constraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[tmpB]-20-|"
                                            options:NSLayoutFormatAlignAllCenterX metrics:nil views:viewsDictionary];
    
    constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[tmpB]-100-|" options:0 metrics:nil views:viewsDictionary]];
    
    [self.view addConstraints:constraints];

    /* Add Contrains for ScrollView */
    // Remember to set translatesAutoresizingMaskIntoConstraints to NO
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    
   // NSDictionary *secondViewsDictionary = NSDictionaryOfVariableBindings(containerView, scrollView);
    
    NSLayoutConstraint *xPostionConstraint = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.containerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    [self.view addConstraint:xPostionConstraint];
    
    NSLayoutConstraint *yPostionConstraint = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.containerView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [self.view addConstraint:yPostionConstraint];
    
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.containerView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    [self.view addConstraint:widthConstraint];
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.containerView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    [self.view addConstraint:heightConstraint];
    
    // Add Constrains for UILabel
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    
    UILabel *tmpC = self.label;
    NSDictionary *thirdViewsDictionary =
    NSDictionaryOfVariableBindings(tmpB, tmpC);
    NSArray *horizontalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-22-[tmpC]-22-|"
                                            options:0 metrics:nil views:thirdViewsDictionary];
//    horizontalConstraints = [horizontalConstraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[tmpC]-22-[tmpB]" options:0 metrics:0 views:thirdViewsDictionary]];
    
    [self.view addConstraints:horizontalConstraints];
    
    NSLayoutConstraint *vertialConstraint = [NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.containerView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-22];
    [self.view addConstraint:vertialConstraint];
#endif

#if Example2
     //实例化Button
     UIButton * button1 = [[UIButton alloc] initWithFrame:(CGRectZero)];//这里不再需要去刻意指定x.y等坐标.
     [button1 setTitle:@"Button Titile" forState:UIControlStateNormal];
     [button1 setBackgroundColor:[UIColor redColor]];
     [button1 sizeToFit];
     [button1 setTranslatesAutoresizingMaskIntoConstraints:NO];//将使用AutoLayout的方式来布局
     [self.view addSubview:button1];
     
     
     //创建了一个水平居中父视图的约束
     NSLayoutConstraint *constraint = [
     NSLayoutConstraint
     constraintWithItem:button1
     attribute:NSLayoutAttributeCenterX
     relatedBy:NSLayoutRelationEqual
     toItem:self.view
     attribute:NSLayoutAttributeCenterX
     multiplier:1.0f
     constant:00.0f
     ];
     
     [self.view addConstraint:constraint];//将约束添加到对应的父视图中
     
     //继续创建了一个位于父视图底部相隔20距离的约束
     constraint = [
     NSLayoutConstraint
     constraintWithItem:button1
     attribute:NSLayoutAttributeBottom
     relatedBy:NSLayoutRelationEqual
     toItem:self.view
     attribute:NSLayoutAttributeBottom
     multiplier:1.0f
     constant:-60.0f
     ];
     
     [self.view addConstraint:constraint];
#endif

#if Example3
     //创建需要参与约束规则的对象字典 <span style="font-family:Arial,Helvetica,sans-serif">表示这三个Button将参与Autolayout的约束处理</span>
    UIButton *deleteButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [deleteButton setTitle:@"Delete" forState:UIControlStateNormal];
    [deleteButton setBackgroundColor:[UIColor redColor]];
    [deleteButton sizeToFit];
    [deleteButton setTranslatesAutoresizingMaskIntoConstraints:NO];//将使用AutoLayout的方式来布局
    [self.view addSubview:deleteButton];
    
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancelButton setBackgroundColor:[UIColor redColor]];
    [cancelButton sizeToFit];
    [cancelButton setTranslatesAutoresizingMaskIntoConstraints:NO];//将使用AutoLayout的方式来布局
    [self.view addSubview:cancelButton];
    
    UIButton *nextButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [nextButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [nextButton setBackgroundColor:[UIColor redColor]];
    [nextButton sizeToFit];
    [nextButton setTranslatesAutoresizingMaskIntoConstraints:NO];//将使用AutoLayout的方式来布局
    [self.view addSubview:nextButton];
    
     NSDictionary *viewsDic = NSDictionaryOfVariableBindings(deleteButton,cancelButton,nextButton);
     
     NSArray *constraints = nil;
     constraints = [NSLayoutConstraint constraintsWithVisualFormat:
     @"H:|-25-[deleteButton(==cancelButton@700)]-(>=8)-[cancelButton(140)]-[nextButton(nextButtonWidth)]-x-|"//水平 可视化格式语言
     options:NSLayoutFormatAlignAllTop //对齐功能
     metrics:@{@"x":@5,@"nextButtonWidth":@30}//指标参数
     views:viewsDic];//参与约束的对象字典
     [self.view addConstraints:constraints];
     
     constraints = [NSLayoutConstraint constraintsWithVisualFormat:
     @"V:[nextButton]-60-|" //垂直 可视化格式语言
     options:0 //无条件
     metrics:nil//不带指标参数
     views:viewsDic];//参与约束的对象字典
     
     [self.view addConstraints:constraints];
     
     //    [deleteButton setContentHuggingPriority:249 forAxis:UILayoutConstraintAxisHorizontal];
#endif
}

#pragma mark -
#pragma mark Override -updateViewConstraints

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    
    // updateViewConstrains
    NSLog(@"%s", __func__);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
