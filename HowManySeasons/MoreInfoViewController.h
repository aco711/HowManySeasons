//
//  MoreInfoViewController.h
//  HowManySeasons
//
//  Created by Alex Cohen on 8/24/15.
//  Copyright (c) 2015 Alex Cohen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCZoomTransition.h"

@interface MoreInfoViewController : UIViewController

@property (nonatomic, strong) id<LCZoomTransitionGestureTarget> gestureTarget;
@property (nonatomic, strong) NSString* imageURL;


@end
