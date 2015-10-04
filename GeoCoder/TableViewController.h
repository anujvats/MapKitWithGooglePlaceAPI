//
//  TableViewController.h
//  GeoCoder
//
//  Created by Vats, Anuj on 9/28/15.
//  Copyright (c) 2015 Vats, Anuj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController<UISearchBarDelegate,UISearchDisplayDelegate,UITableViewDelegate,UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong, nonatomic) NSMutableArray *candyArray;
@property (strong, nonatomic) NSMutableArray *filteredCandyArray;

- (IBAction)searchIcon:(id)sender;

@end

