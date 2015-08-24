//
//  ViewController.m
//  HowManySeasons
//
//  Created by Alex Cohen on 8/23/15.
//  Copyright (c) 2015 Alex Cohen. All rights reserved.
//

#import "ViewController.h"
#import <PureLayout/PureLayout.h>
#import <AFNetworking/AFNetworking.h>


@interface ViewController () <UISearchBarDelegate>

@property (strong, nonatomic) UISearchBar* searchBar;
@property (strong, nonatomic) UILabel* yearLabel;
//@property (strong, nonatomic) MovieSearchController* searchBarController;
@end

@implementation ViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self getDataWithString:self.searchBar.text];
    

}

-(void)loadView
{
    [super loadView];
    

    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 8, 320, 44)];
    self.searchBar.delegate = self;
    self.yearLabel = [[UILabel alloc] init];
    [self.view addSubview:self.yearLabel];
    [self.yearLabel autoCenterInSuperview];
    
    
    [self.view addSubview:self.searchBar];
    [self.searchBar autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:64];
    [self.searchBar autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.view];
    [self.searchBar autoSetDimension:ALDimensionHeight toSize:44];
    
    
    
   
    
}


-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self getDataWithString:self.searchBar.text];
}



-(void)getDataWithString:(NSString*)string
{
    
    NSString* base = @"http://www.omdbapi.com/?t=";
    NSString* title = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString* end = @"&y=&plot=short&r=json";
    NSString* part1 = [base stringByAppendingString:title];
    NSString* urlString = [part1 stringByAppendingString:end];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 2
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        // 3
        
        self.yearLabel.text = [(NSDictionary*)responseObject valueForKey:@"Year"];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        // 4
        NSLog(@"Problem");
    }];
    
    // 5
    [operation start];
    
}



@end
