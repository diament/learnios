//
//  CGViewController.h
//  CityGuide
//
//  Created by Judah Diament on 12/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGViewController : UITableViewController <UITableViewDataSource, UITabBarDelegate>
{
    NSMutableArray *cities;
}
//@property (weak, nonatomic) UITableView *tableView;

@end
