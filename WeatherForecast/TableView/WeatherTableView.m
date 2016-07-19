//
//  WeatherTableView.m
//  WeatherForecast
//
//  Created by MOHIT MATHUR on 24/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

@implementation WeatherTableView
{
    NSMutableArray *weatherListArray;
    NSString *currentCellIdentifier;
}

#pragma mark - Public

- (void)reloadTableViewWithData:(NSMutableArray *)weatherArray
{
    //Setting Tableview Datasource and Delegates
    weatherListArray=weatherArray;
    self.hidden = NO;
    self.delegate=self;
    self.dataSource=self;
    self.estimatedRowHeight = 50;
    [self reloadData];
}

#pragma mark - TableView Datasource Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Returning height based on the type of cell
    currentCellIdentifier = [self.customDelegate checkCellType:indexPath];
    if ([currentCellIdentifier isEqualToString:@"WeatherListTableViewCell"]) {
        return 200;
    }
    else if ([currentCellIdentifier isEqualToString:@"WeatherDetailTemperatureTableViewCell"]) {
        return 230;
    }
    else{
        return 70;
        
    }
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return ([self.customDelegate respondsToSelector:@selector(getNumberOfSections:)]) ? [self.customDelegate getNumberOfSections:tableView] : weatherListArray.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    //Setting the footer view
    UIView *footer=[[UIView alloc] initWithFrame:CGRectMake(0,0,self.frame.size.width,200.0)];
    footer.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    return footer;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    //height for footer
    return 20;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //number of rows in each section
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //returning cell based on cell type
    currentCellIdentifier = [self.customDelegate checkCellType:indexPath];
    WeatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:currentCellIdentifier forIndexPath:indexPath];
    if ([currentCellIdentifier isEqualToString:@"WeatherListTableViewCell"]) {
        [cell configureListViewCell:[weatherListArray objectAtIndex:indexPath.section]];
    }
    else if ([currentCellIdentifier isEqualToString:@"WeatherDetailTemperatureTableViewCell"]) {
        [cell configureDetailViewTemperatureCell:[weatherListArray objectAtIndex:indexPath.row]];
    }
    else{
        [cell configureDetailViewOtherCellWithIndexpath:indexPath withObject:[weatherListArray objectAtIndex:indexPath.row]];
        
    }
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //passing selected object to detail page
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([currentCellIdentifier isEqualToString:@"WeatherListTableViewCell"])
    {
        [self.customDelegate tableView:tableView tappedRowAtIndexPath:indexPath];
    }
    
}

@end
