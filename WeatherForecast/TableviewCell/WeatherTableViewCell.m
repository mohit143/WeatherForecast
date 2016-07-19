//
//  WeatherTableViewCell.m
//  WeatherForecast
//
//  Created by MOHIT MATHUR on 23/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

@implementation WeatherTableViewCell
{
    __weak IBOutlet UILabel *detailOtherKeyLabel;
    __weak IBOutlet UILabel *detailOtherValueLabel;
    __weak IBOutlet UILabel *detailMaxTemperatureLabel;
    __weak IBOutlet UILabel *detailMinTemperatureLabel;
    __weak IBOutlet UILabel *detailNightTemperatureLabel;
    __weak IBOutlet UILabel *detailEveTemperatureLabel;
    __weak IBOutlet UILabel *detailDayTemperatureLabel;
    __weak IBOutlet UILabel *detailMornTemperatureLabel;
    __weak IBOutlet UIView *bacgroundView;
    __weak IBOutlet UILabel *weatherDescripTionLabel;
    __weak IBOutlet UILabel *dayTemperatureLabel;
    __weak IBOutlet UILabel *humidityLabel;
    __weak IBOutlet UILabel *minTemperatureLabel;
    __weak IBOutlet UILabel *maxTemperatureLabel;
    __weak IBOutlet UILabel *weatherDateLabel;
    __weak IBOutlet UILabel *weatherTimeLabel;
    __weak IBOutlet UIImageView *weatherImageView;
    NSDateFormatter *formatter;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

#pragma mark - Public

- (void)configureListViewCell:(Weather *)weather
{
    //Configuring WeatherList Cell
    [weatherImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@.png",PREF_BASE_ICON_URL,weather.icon]]];
    weatherDescripTionLabel.text = weather.weatherDescription;
    dayTemperatureLabel.text = [NSString stringWithFormat:@"%.2f°",weather.temperature.dayTemperature];
    minTemperatureLabel.text = [NSString stringWithFormat:@"%.2f",weather.temperature.minTemperature];
    maxTemperatureLabel.text = [NSString stringWithFormat:@"%.2f",weather.temperature.maxTemperature];
    humidityLabel.text = [NSString stringWithFormat:@"%.0f",weather.humidity];
    
    if (!formatter) {
        formatter = [[NSDateFormatter alloc]init];
    }
    formatter.dateFormat = @"MMM dd yyyy";
    
    weatherDateLabel.text = ([DateHelper compareOnlyDates:weather.date toDate:[NSDate date]] == NSOrderedSame) ? @"Today" : [formatter stringFromDate:weather.date];
    
    formatter.dateFormat = @"EEE hh:mm a";
    
    weatherTimeLabel.text = [formatter stringFromDate:weather.date];
}

- (void)configureDetailViewOtherCellWithIndexpath:(NSIndexPath *)currentIndexpath withObject:(Weather *)weather
{
    //Configuring Weather Detail Cell
    
    if (currentIndexpath.section == 1)
    {
        detailOtherValueLabel.text = [NSString stringWithFormat:@"%.2f",weather.humidity];
        detailOtherKeyLabel.text =  @"Humidity";
        
    }
    else if (currentIndexpath.section == 2)
    {
        detailOtherValueLabel.text = [NSString stringWithFormat:@"%.2f",weather.pressure];
        detailOtherKeyLabel.text =  @"Pressure";
        
    }
    else if (currentIndexpath.section == 3)
    {
        detailOtherValueLabel.text = [NSString stringWithFormat:@"%.2f",weather.speed];
        detailOtherKeyLabel.text =  @"Speed";
        
    }
    else if (currentIndexpath.section == 4)
    {
        detailOtherValueLabel.text = [NSString stringWithFormat:@"%.2f",weather.degree];
        detailOtherKeyLabel.text =  @"Degree";
        
    }
    else if (currentIndexpath.section == 5)
    {
        detailOtherValueLabel.text = [NSString stringWithFormat:@"%.2f",weather.clouds];
        detailOtherKeyLabel.text =  @"Clouds";
    }
    else
    {
        detailOtherValueLabel.text = [NSString stringWithFormat:@"%.2f",weather.rain];
        detailOtherKeyLabel.text =  @"Rain";
        
    }
    
}

- (void)configureDetailViewTemperatureCell:(Weather *)weather
{
    //Configuring Weather Detail Cell for Temperature
    detailDayTemperatureLabel.text = [NSString stringWithFormat:@"%.2f°",weather.temperature.dayTemperature];
    detailMornTemperatureLabel.text = [NSString stringWithFormat:@"%.2f°",weather.temperature.morningTemperature];
    detailEveTemperatureLabel.text = [NSString stringWithFormat:@"%.2f°",weather.temperature.eveningTemperature];
    detailNightTemperatureLabel.text = [NSString stringWithFormat:@"%.2f°",weather.temperature.nightTemperature];
    detailMinTemperatureLabel.text = [NSString stringWithFormat:@"%.2f°",weather.temperature.minTemperature];
    detailMaxTemperatureLabel.text = [NSString stringWithFormat:@"%.2f°",weather.temperature.maxTemperature];
}

@end
