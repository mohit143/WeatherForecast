//
//  AlertHelper.m
//  WeatherForecast
//
//  Created by MOHIT MATHUR on 23/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//


@implementation AlertHelper

//Public Class Methods
+(void) displayAlert:(NSString *)messageString withDelegate:(UIViewController *)controller{
    
    //Setting Alert View
    UIAlertController *alert= [UIAlertController
                               alertControllerWithTitle:@"Enter Folder Name"
                               message:@"Keep it short and sweet"
                               preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"Retry" style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction * action){
                                                   //Do Some action here
                                                   UITextField *textField = alert.textFields[0];
                                                   NSLog(@"text was %@", textField.text);
                                                   
                                               }];
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action) {
                                                       
                                                       NSLog(@"cancel btn");
                                                       
                                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                                       
                                                   }];
    
    [alert addAction:ok];
    [alert addAction:cancel];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"folder name";
        textField.keyboardType = UIKeyboardTypeDefault;
    }];
    
    [controller presentViewController:alert animated:YES completion:nil];
}

+(void) displayAlertBlock:(NSString *)messageString forViewController:(UIViewController *)controller withCallBack:(AllApi)alertCallBack{
    
    //Setting Custom
    UIAlertController *alert= [UIAlertController
                               alertControllerWithTitle:@"WeatherApp"
                               message:messageString
                               preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"Retry" style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction * action){
                                                   
                                                   alertCallBack(nil,nil,YES);
                                                   
                                               }];
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action) {
                                                       
                                                       NSLog(@"cancel btn");
                                                       
                                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                                       
                                                   }];
    
    [alert addAction:ok];
    [alert addAction:cancel];
    [controller presentViewController:alert animated:YES completion:nil];
}

@end
