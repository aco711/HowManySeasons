//
//  MovieTableView.m
//  HowManySeasons
//
//  Created by Alex Cohen on 8/23/15.
//  Copyright (c) 2015 Alex Cohen. All rights reserved.
//

#import "MovieTableView.h"
#import <PureLayout/PureLayout.h>


@interface MovieTableView ()

@property (strong, nonatomic) UISearchBar* searchBar;

@end

@implementation MovieTableView

-(id)init
{
    self = [super init];
    
    if (self)
    {
        self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 8, 320, 44)];
        [self addSubview:self.searchBar];
        [self.searchBar autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
        [self.searchBar autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self];
        [self.searchBar autoSetDimension:ALDimensionHeight toSize:44];
        self.tableHeaderView = self.searchBar;
        //[self.searchBar autoCenterInSuperview];
        
        
    }
    
    
    return self;
}






@end
