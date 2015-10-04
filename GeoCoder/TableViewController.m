//
//  TableViewController.m
//  GeoCoder
//
//  Created by Vats, Anuj on 9/28/15.
//  Copyright (c) 2015 Vats, Anuj. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib
    
    
    [self.tableView setContentOffset:CGPointMake(0, 44)];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.candyArray = [[NSMutableArray alloc] initWithObjects:@"chocolate bar",@"chocolate chip",@"dark chocolate",@"lollipop",@"candy Cane",@"jaw breaker",@"carmel",@"sour chew",@"peanut butter cup",@"gummi bear", nil] ;
    
    self.filteredCandyArray = [NSMutableArray arrayWithCapacity:[self.candyArray count]];
    

    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        
        return [self.filteredCandyArray count];
    }else{
   
        return [self.candyArray count];
        
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = nil;
    
     cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
   
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        
        
        cell.textLabel.text = [self.filteredCandyArray objectAtIndex:indexPath.row];}
    
    else {
         cell.textLabel.text = [self.candyArray objectAtIndex:indexPath.row];
         }
    
    
    return cell;
     
}


#pragma mark - UISearchDisplayController Delegate Methods
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
     
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
   
     // Return YES to cause the search result table view to be reloaded.
    
    return YES;
}




#pragma mark Content Filtering
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    
    [self.filteredCandyArray removeAllObjects];
    
    // Filter the array using NSPredicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",searchText];
    
    self.filteredCandyArray = [NSMutableArray arrayWithArray:[self.candyArray filteredArrayUsingPredicate:predicate]];
}

- (IBAction)searchIcon:(id)sender {
    
    
    [self.searchBar becomeFirstResponder];
    
}


@end
