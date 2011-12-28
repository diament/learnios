//
//  CityController.m
//  CityGuide
//
//  Created by Judah Diament on 12/23/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CityController.h"
#import "CGAppDelegate.h"
#import "City.h"

@implementation CityController

- (id) initWithIndexpath:(NSIndexPath *)indexPath
{
    if( (self = [super init]) )
    {
        index = indexPath;
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void) loadView
{
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,416)];
    self.view.backgroundColor = [UIColor whiteColor];             

    descriptionView = [[UITextView alloc] initWithFrame:CGRectMake(10,10,300,100)];
    [self.view addSubview:descriptionView];

    pictureView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 120, 300, 286)];
    [self.view addSubview:pictureView];

}
                 
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGAppDelegate *delegate = (CGAppDelegate *) [[UIApplication sharedApplication] delegate];
    City *thisCity = [delegate.cities objectAtIndex:index.row];
    
    self.title = thisCity.cityName;

    descriptionView.text = thisCity.cityDescription;
    descriptionView.editable = NO;
    
    pictureView.image = thisCity.cityPicture;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
