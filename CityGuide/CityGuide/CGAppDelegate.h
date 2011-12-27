//
//  CGAppDelegate.h
//  CityGuide
//
//  Created by Judah Diament on 12/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CGViewController;

@interface CGAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CGViewController *viewController;
@property (strong,nonatomic) UINavigationController *navController;
@property (strong, nonatomic) NSMutableArray *cities;

@end
