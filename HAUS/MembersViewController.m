//
//  MembersViewController.m
//  HAUS
//
//  Created by Andrew Rauh on 1/25/13.
//  Copyright (c) 2013 Andrew Rauh. All rights reserved.
//

#import "MembersViewController.h"


@interface MembersViewController ()
@property (nonatomic, strong) NSArray *userArray;
@end

@implementation MembersViewController
@synthesize myTableView, userArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    userArray = [[NSArray alloc]initWithArray:[[PFUser query]findObjects]];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
//    PFObject *object;
//    if (tableView == self.searchDisplayController.searchResultsTableView) {
//        object = [filteredItemArray objectAtIndex:indexPath.row];
//    } else {
//        object = [items objectAtIndex:indexPath.row];
//    }
//    PFFile *img = [object objectForKey:@"image"];
//    if (img) {
//        NSData *imgData = [img getData];
//        [cell.imageView setClipsToBounds:YES];
//        [cell.imageView setImage:[UIImage imageWithData:imgData] ];
//        [cell.imageView setFrame:CGRectMake(5, 5, 60, 60)];
//        [cell.imageView setContentMode:UIViewContentModeScaleAspectFit];
//    } else {
//        [cell.imageView setImage:[UIImage imageNamed:@"chris2.png"]];
//    }
    
//    NSString *title = [object objectForKey:@"title"];
//    NSString *description = [object objectForKey:@"description"];
    //NSLog(@"CFR: All items are %@", webServices.allItems);
    //NSLog(@"CFR: Title is %@", [[webServices.allItems objectAtIndex:indexPath.row]title]);
    //[cell.textLabel setText:[[webServices.allItems objectAtIndex:indexPath.row]title]];
    //[cell.detailTextLabel setText:@""];
//    [cell.textLabel setText:title];
//    [cell.detailTextLabel setText:description];
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    [cell.textLabel setText:[[userArray objectAtIndex:indexPath.row]objectForKey:@"username"]];
    PFFile *img = [[userArray objectAtIndex:indexPath.row]objectForKey:@"Picture"];
    [cell.imageView setImage:[UIImage imageWithData:[img getData]]];
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"Number of rows called");
    // Return the number of rows in the section.
    
    return [[PFUser query] countObjects];;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}


//t

@end
