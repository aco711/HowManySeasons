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
@property (strong, nonatomic) UILabel* scoreLabel;
@property (strong, nonatomic) UILabel* titleLabel;


@end

@implementation ViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    //[self getDataWithString:self.searchBar.text];
    

}

-(void)loadView
{
    [super loadView];
    

    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 8, 320, 44)];
    self.searchBar.delegate = self;
    [self.view addSubview:self.searchBar];
    [self.searchBar autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:64];
    [self.searchBar autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.view];
    [self.searchBar autoSetDimension:ALDimensionHeight toSize:44];
    
    self.titleLabel = [[UILabel alloc] init];
    [self.view addSubview:self.titleLabel];
    self.titleLabel.text = @"MOVIE";
    [self.titleLabel autoPinEdgeToSuperviewMargin:ALEdgeLeft];
    [self.titleLabel autoPinEdgeToSuperviewMargin:ALEdgeRight];
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:120];
    [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:40];
    self.titleLabel.numberOfLines = 1;
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    
    self.scoreLabel = [[UILabel alloc] init];
    [self.view addSubview:self.scoreLabel];
    self.scoreLabel.font = [UIFont systemFontOfSize:55];
    [self.scoreLabel autoCenterInSuperview];
    
    
    
    
    
    
   
    
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
        
        self.titleLabel.text = [(NSDictionary*)responseObject valueForKey:@"Title"];
        NSInteger score = [[(NSDictionary*)responseObject valueForKey:@"Metascore"] integerValue];
        self.scoreLabel.text = [(NSDictionary*)responseObject valueForKey:@"Metascore"];
        
        if (score > 75)
        {
            self.scoreLabel.textColor = [UIColor greenColor];
        }
        else
        {
            self.scoreLabel.textColor = [UIColor redColor];
        }
        
        if ([self.scoreLabel.text isEqualToString:@"N/A"])
        {
            self.scoreLabel.text = [NSString stringWithFormat:@"%@ (IMDB)",[(NSDictionary*)responseObject valueForKey:@"imdbRating"]];
            self.scoreLabel.textColor = [UIColor blackColor];
        }
        
       
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        // 4
        NSLog(@"Problem");
    }];
    
    // 5
    [operation start];
    
}



@end
