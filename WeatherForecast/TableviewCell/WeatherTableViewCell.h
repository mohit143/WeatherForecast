//
//  WeatherTableViewCell.h
//  WeatherForecast
//
//  Created by MOHIT MATHUR on 23/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

@interface WeatherTableViewCell : UITableViewCell

- (void)configureListViewCell:(Weather *)weather;
- (void)configureDetailViewOtherCellWithIndexpath:(NSIndexPath *)currentIndexpath withObject:(Weather *)weather;
- (void)configureDetailViewTemperatureCell:(Weather *)weather;

@end
