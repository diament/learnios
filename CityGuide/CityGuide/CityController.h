//
//  CityController.h
//  CityGuide
//
//  Created by Judah Diament on 12/23/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityController : UIViewController
{
    NSIndexPath *index;
    UIImageView *pictureView;
    UITextView *descriptionView;
}
-(id)initWithIndexpath:(NSIndexPath *)indexPath;

@end
