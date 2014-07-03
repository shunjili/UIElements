//
//  SVViewController.m
//  scrollViewTest
//
//  Created by Shunji Li on 7/1/14.
//  Copyright (c) 2014 shunjili. All rights reserved.
//

#import "ShowCaseViewController.h"
#import "SJBorderedReversibleButton.h"
@interface ShowCaseViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ShowCaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    self.scrollView = scrollView;
    scrollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scrollView];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidLayoutSubviews
{
    CGRect frame = self.view.frame;
    self.scrollView.frame = frame;
    frame.size.height *= 2;
    frame.size.width *= 2;
    self.scrollView.contentSize = frame.size;
    frame.size.height = frame.size.height/6;
    frame.size.width = frame.size.width/6;
    frame.origin.x = 50;
    frame.origin.y = 50;
    SJBorderedReversibleButton *reversibleButton = [[SJBorderedReversibleButton  alloc] initWithFrame:frame style:MOReverseButtonStyleHollow];
    reversibleButton.tintColor = [UIColor yellowColor];
    reversibleButton.title = @"Bordered Reversible Button";
    [reversibleButton sizeToFit];
    [self.scrollView addSubview:reversibleButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
