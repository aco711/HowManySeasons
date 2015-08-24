//
//  MoreInfoViewController.m
//  HowManySeasons
//
//  Created by Alex Cohen on 8/24/15.
//  Copyright (c) 2015 Alex Cohen. All rights reserved.
//

#import "MoreInfoViewController.h"
#import <PureLayout/PureLayout.h>
#import <AFNetworking/AFNetworking.h>

@interface MoreInfoViewController ()

@property (strong, nonatomic) UIImageView* imageView;

@end

@implementation MoreInfoViewController

-(void)loadView
{
    [super loadView];
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 100)];
    [self.view addSubview:self.imageView];
    
    //[self.imageView autoCenterInSuperview];
    [self.imageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [self.imageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:self.navigationController.navigationBar.bounds.size.height];
   
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSData * imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:self.imageURL]];
    self.imageView.image = [UIImage imageWithData: imageData];
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

@end
