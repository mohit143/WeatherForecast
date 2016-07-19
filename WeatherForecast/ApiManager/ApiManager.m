//
//  ApiManager.m
//  WeatherForecast
//
//  Created by MOHIT MATHUR on 23/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

@implementation ApiManager

#pragma mark - Api Methods

+ (void)requestForAllApionView:(UIViewController *)currentController withResponse:(AllApi)callback
{
    //Common method for running api
    [MBProgressHUD showHUDAddedTo:currentController.view animated:YES WithTitle:@"Fetching Weather Data"];
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:PREF_API parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [MBProgressHUD hideHUDForView:currentController.view animated:YES];
        NSError *error;
        id responseData=[NSJSONSerialization
                         JSONObjectWithData:responseObject
                         options:kNilOptions
                         error:&error];
        NSDictionary *results=(NSDictionary *)responseData;
        NSLog(@"succ");
        NSLog(@"%@",operation.responseString);
        NSLog(@"json: %@",responseObject);
        
        if (![results isKindOfClass:[NSNull class]])
        {
            if ([results isKindOfClass:[NSDictionary class]])
            {
                callback(results,nil,YES);
            }
            else
            {
                callback(nil,nil,NO);
            }
        }
        else
        {
            callback(nil,nil,NO);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD hideHUDForView:currentController.view animated:YES];
        
        NSLog(@"Error: %@", error);
        if (error.code==NSURLErrorNotConnectedToInternet)
        {
            [AlertHelper displayAlert:@"Internet connection appears to be offline! Please try again" withDelegate:currentController];
             callback(nil,nil,NO);
        }
        else{
            
            if (error.code==NSURLErrorTimedOut)
                
            {
                [AlertHelper displayAlert:@"Connection timeout.Press RETRY to try again or CANCEL to abort." withDelegate:currentController];
                 callback(nil,nil,NO);
            }
            
            else
                
            {
                [AlertHelper displayAlertBlock:@"Unable to connect your request.Press RETRY to try again or CANCEL to abort." forViewController:currentController withCallBack:^(NSDictionary *result, NSError *error, BOOL success) {
                    if (success) {
                        [ApiManager requestForAllApionView:currentController withResponse:callback];
                    }
                    else{
                        callback(nil,nil,NO);
                    }
                }];
            }
            
            
        }
    }];
    
}
@end
