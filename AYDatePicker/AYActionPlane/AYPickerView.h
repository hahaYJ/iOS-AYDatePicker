//
//  AYPickerView.h
//  AYDatePicker
//
//  Created by hahaYJ on 3/29/16.
//  Copyright © 2016 杨捷. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AYActionPlane.h"

typedef void(^SelectedHandler)(NSUInteger index, NSString *selectedData);

@interface AYPickerView : AYActionPlane <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, copy) SelectedHandler handler;

+ (AYPickerView *)pickerViewWithData:(NSArray<NSString *> *)datas handler:(SelectedHandler) handler;

@end
