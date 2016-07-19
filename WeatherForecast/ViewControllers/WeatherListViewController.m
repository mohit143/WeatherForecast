//
//  WeatherListViewController.m
//  WeatherForecast
//
//  Created by MOHIT MATHUR on 22/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

#import "WeatherListViewController.h"
#import "WeatherDetailViewController.h"

@interface WeatherListViewController ()<WeatherTableViewCustomDelegate>
{
    __weak IBOutlet UISegmentedControl *temperatureUnitSegmentController;
    __weak IBOutlet UILabel *titleLabel;
    __weak  IBOutlet WeatherTableView * _Nullable weatherTableView;
    NSMutableArray *weatherListArray;
}

@end

@implementation WeatherListViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    weatherListArray=[NSMutableArray new];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //Calling Api
    [ApiManager requestForAllApionView:self withResponse:^(NSDictionary *result, NSError *error, BOOL success) {
        if (success) {
            
            NSArray *responseArray=[result objectForKey:@"list"];
            for (NSDictionary *weatherDict in responseArray) {
                Weather *currentWeather = [[Weather alloc]init];
                currentWeather = [currentWeather setObject:weatherDict];
                [currentWeather setPlace:[NSString stringWithFormat:@"%@ Weather Report",[[result objectForKey:@"city"]objectForKey:@"name"]]];
                [weatherListArray addObject:currentWeather];
            }
            titleLabel.text = [NSString stringWithFormat:@"%@ Weather Report",[[result objectForKey:@"city"]objectForKey:@"name"]];
            weatherTableView.customDelegate = self;
            temperatureUnitSegmentController.hidden = NO;
            [weatherTableView reloadTableViewWithData:weatherListArray];
        }
        else{
            
            
            
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - WeatherTableView Delegates

- (NSString *)checkCellType:(NSIndexPath *)currentIndexPath
{
    //Checking cell type
    return @"WeatherListTableViewCell";
}

-(void)tableView:(UITableView *)tableView tappedRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Moving tapped object to detail page
    WeatherDetailViewController *detailPage = [self.storyboard instantiateViewControllerWithIdentifier:@"WeatherDetailViewController"];
    detailPage.weather = [weatherListArray objectAtIndex:indexPath.section];
    [self.navigationController pushViewController:detailPage animated:YES];
}

#pragma mark - IBActions

- (IBAction)changeTemperatureUnit:(id)sender
{
    //Changing Temperature Unit
    for (Weather *weather in weatherListArray) {
        (temperatureUnitSegmentController.selectedSegmentIndex == 0)? [weather.temperature convertIntoCelsius:weather.temperature] : [weather.temperature convertIntoFahrenheit:weather.temperature];
        
    }
    [weatherTableView reloadTableViewWithData:weatherListArray];
}

@end
