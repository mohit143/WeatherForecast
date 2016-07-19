//
//  WeatherDetailViewController.m
//  WeatherForecast
//
//  Created by MOHIT MATHUR on 22/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

#import "WeatherDetailViewController.h"

@interface WeatherDetailViewController ()<WeatherTableViewCustomDelegate>
{
    __weak  IBOutlet WeatherTableView * weatherDetailTableView;
    __weak IBOutlet UILabel *weatherDescriptionLabel;
    __weak IBOutlet UILabel *dayTemperatureLabel;
    __weak IBOutlet UILabel *weatherDateLabel;
    __weak IBOutlet UIImageView *weatherImageView;
    __weak IBOutlet UILabel *detailHeaderLabel;
    NSDateFormatter *formatter;
}

@end

@implementation WeatherDetailViewController

@synthesize weather;

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    formatter = [[NSDateFormatter alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //Setting Detail weather object to Detail page
    detailHeaderLabel.text = weather.place;
    [weatherImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@.png",PREF_BASE_ICON_URL,weather.icon]]];
    weatherDescriptionLabel.text = weather.weatherDescription;
    dayTemperatureLabel.text = [NSString stringWithFormat:@"%.2f°",weather.temperature.dayTemperature];
    formatter.dateFormat = @"MMM dd yyyy";
    weatherDateLabel.text = ([DateHelper compareOnlyDates:weather.date toDate:[NSDate date]] == NSOrderedSame) ? @"Today" : [formatter stringFromDate:weather.date];
    weatherDetailTableView.customDelegate = self;
    [weatherDetailTableView reloadTableViewWithData:[[NSMutableArray alloc]initWithObjects:weather, nil]];
    
}
- (NSString *)checkCellType:(NSIndexPath *)currentIndexPath
{
    //Checking cell type
    return (currentIndexPath.section == 0) ? @"WeatherDetailTemperatureTableViewCell" : @"WeatherDetailOtherTableViewCell";
}

- (NSInteger )getNumberOfSections:(UITableView *)currentTableView
{
    //Returning number of sections
    return 7;
}

#pragma mark - IBActions

- (IBAction)goBack:(id)sender {
    //Taking Back to list page
    [self.navigationController popViewControllerAnimated:YES];
}

@end
