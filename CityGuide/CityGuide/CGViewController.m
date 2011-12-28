//
//  CGViewController.m
//  CityGuide
//
//  Created by Judah Diament on 12/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CGViewController.h"
#import "CGAppDelegate.h"
#import "City.h"
#import "CityController.h"

@implementation CGViewController
//@synthesize tableView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"City Guide";
    CGAppDelegate *delegate = (CGAppDelegate *) [[UIApplication sharedApplication] delegate];
    cities = delegate.cities;
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    if(editing != self.editing)
    {
        [super setEditing:editing animated:animated];
        [self.tableView setEditing:editing animated:animated];
        
        NSArray *indexes = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:cities.count inSection:0]];
        if(editing == YES)
        {
            [self.tableView insertRowsAtIndexPaths:indexes withRowAnimation:UITableViewRowAnimationLeft];
        }
        else
        {
          [self.tableView deleteRowsAtIndexPaths:indexes withRowAnimation:UITableViewRowAnimationLeft];  
        }
    }
    //[self.tableView reloadData];
}

#pragma mark UITableVideDataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"cell"];
    if(nil == cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if(indexPath.row < cities.count)
    {
        City *thisCity = [cities objectAtIndex:indexPath.row];
        cell.textLabel.text = thisCity.cityName;        
    }
    else
    {
        cell.textLabel.text = @"Add New City...";
        cell.textLabel.textColor = [UIColor lightGrayColor];
        cell.editingAccessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section
{
    NSInteger count =  [cities count];
    if(self.editing)
    {
        count++;
    }
    return count;
}

-(void)tableView:(UITableView *)tv commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        [cities removeObjectAtIndex:indexPath.row];
        [tv deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

#pragma mark UITableViewDelegate Methods

-(void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    City *thisCity = [cities objectAtIndex:indexPath.row];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:thisCity.cityName message:thisCity.cityDescription delegate:[[UIApplication sharedApplication] delegate] cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    */
    CGAppDelegate *delegate = (CGAppDelegate *)[[UIApplication sharedApplication] delegate];
    CityController *city = [[CityController alloc] initWithIndexpath:indexPath];
    [delegate.navController pushViewController:city animated:YES];
     [tv deselectRowAtIndexPath:indexPath animated:YES];
}

-(UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row < cities.count)
    {
        return UITableViewCellEditingStyleDelete;
    }
    else
    {
        return UITableViewCellEditingStyleInsert;
    }
}

@end
