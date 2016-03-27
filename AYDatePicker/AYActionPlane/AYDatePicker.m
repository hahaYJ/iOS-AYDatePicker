//
//  AYDatePicker.m
//  DatePicker
//
//  Created by hahaYJ on 3/27/16.
//  Copyright © 2016 mspsys087. All rights reserved.
//



#import "AYDatePicker.h"

@implementation AYDatePicker {
    UIDatePicker *datePicker;
}

+ (AYDatePicker *)datePicker {
    return [AYDatePicker new];
}

+ (AYDatePicker *)datePickerWithResultHandle:(ResultHandle) resultHandle {
    AYDatePicker *picker = [AYDatePicker new];
    picker.resultHandle = resultHandle;
    return picker;
}

- (UIView *)initPlaneContent:(UIView *) planeView {
    datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker setFrame:CGRectMake(0, 20, planeView.frame.size.width, planeView.frame.size.height)];
    return (AYDatePicker *) datePicker;
}

- (void)didConfirm {
    if(_resultHandle)
        _resultHandle(datePicker, datePicker.date);
}

@end
