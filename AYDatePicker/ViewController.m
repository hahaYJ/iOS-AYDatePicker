//
//  ViewController.m
//  AYDatePicker
//
//  Created by hahaYJ on 3/27/16.
//  Copyright © 2016 杨捷. All rights reserved.
//

#import "ViewController.h"
#import "AYDatePicker.h"
#import "AYPickerView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClick:(id)sender {
//    [[AYDatePicker datePickerWithResultHandle:^(UIDatePicker *datePicker, NSDate *date) {
//        NSLog(@"%@", date);
//        [_btn setTitle:[date description] forState:0];
//    }] show];
    
    [[AYPickerView pickerViewWithData:@[@"11", @"22", @"33"] handler:^(NSUInteger index, NSString *selectedData) {
        NSLog(@"%ld  %@", index, selectedData);
    }] show];
}

@end
