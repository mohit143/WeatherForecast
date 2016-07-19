//
//  WeatherTableView.h
//  WeatherForecast
//
//  Created by MOHIT MATHUR on 24/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

@protocol WeatherTableViewCustomDelegate <NSObject>

@required
- (NSString *)checkCellType:(NSIndexPath *)currentIndexPath;
@optional
- (NSInteger )getNumberOfSections:(UITableView *)currentTableView;
-(void)tableView:(UITableView *)tableView tappedRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface WeatherTableView : UITableView <UITableViewDelegate,UITableViewDataSource>

- (void)reloadTableViewWithData:(NSMutableArray *)weatherArray;
@property (nonatomic, assign) id<WeatherTableViewCustomDelegate> customDelegate;

@end
