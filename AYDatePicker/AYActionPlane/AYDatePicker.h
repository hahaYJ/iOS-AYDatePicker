//
//  AYDatePicker.h
//  DatePicker
//
//  Created by hahaYJ on 3/27/16.
//  Copyright © 2016 mspsys087. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AYActionPlane.h"

typedef void(^ResultHandle)(UIDatePicker *datePicker, NSDate *date);

@interface AYDatePicker : AYActionPlane

@property (nonatomic, copy) ResultHandle resultHandle;

+ (AYDatePicker *)datePicker;

+ (AYDatePicker *)datePickerWithResultHandle:(ResultHandle) resultHandle;

@end
