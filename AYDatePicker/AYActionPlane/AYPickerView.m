//
//  AYPickerView.m
//  AYDatePicker
//
//  Created by hahaYJ on 3/29/16.
//  Copyright © 2016 杨捷. All rights reserved.
//

#import "AYPickerView.h"

@interface AYPickerView () {
    UIPickerView *pickerView;
    NSString *targetItemData;
    NSUInteger targetItemIndex;
}

@property (nonatomic, copy) NSArray *datas;

@end

@implementation AYPickerView

+ (AYPickerView *)pickerViewWithData:(NSArray<NSString *> *)datas handler:(SelectedHandler) handler {
    AYPickerView *pv = [AYPickerView new];
    pv.handler = handler;
    pv.datas = datas;
    return pv;
}

- (UIView *)initPlaneContent:(UIView *) planeView {
    pickerView = [[UIPickerView alloc] init];
    pickerView.clipsToBounds = YES;
    pickerView.dataSource = self;
    pickerView.delegate = self;
    pickerView.showsSelectionIndicator = YES;
    [pickerView setFrame:CGRectMake(0, 20, planeView.frame.size.width, planeView.frame.size.height)];
    return (AYPickerView *) pickerView;
}

- (void)didConfirm {
    if(_handler)
        _handler(targetItemIndex, targetItemData);
}

- (void)setDatas:(NSArray *)datas {
    _datas = [datas copy];
    if(_datas.count)
        targetItemData = _datas[0];
}

#pragma mark - UIPickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _datas.count;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component   {
    return _datas[row];
}

#pragma mark - UIPickerView Delegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component  {
    targetItemData = _datas[row];
    targetItemIndex = row;
}

#pragma mark -

@end
