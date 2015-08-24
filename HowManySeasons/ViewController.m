//
//  ViewController.m
//  HowManySeasons
//
//  Created by Alex Cohen on 8/23/15.
//  Copyright (c) 2015 Alex Cohen. All rights reserved.
//

#import "ViewController.h"
#import "MovieTableView.h"
#import <PureLayout/PureLayout.h>


@interface ViewController ()

@property (strong, nonatomic) MovieTableView * tableView;

@end

@implementation ViewController

-(void)loadView
{
    [super loadView];
    
    self.tableView = [[MovieTableView alloc] init];
    
    [self.view addSubview:self.tableView];
    

    
    

    
    [self.tableView autoCenterInSuperview];
    [self.tableView autoPinEdgesToSuperviewEdges];
    
   
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
