//
//  AYActionPlane.m
//  DatePicker
//
//  Created by hahaYJ on 3/27/16.
//  Copyright © 2016 mspsys087. All rights reserved.
//

#import "AYActionPlane.h"

#define SCREEN_BOUNDS [UIScreen mainScreen].bounds
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define TOOLBAR_H 40
#define PLANE_H 220

@implementation AYActionPlane {
    UIView *_pickerView;
    UIView *_contentView;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initDatePickerView];
    }
    return self;
}

- (void)initDatePickerView {
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelDateSet)];
    [self addGestureRecognizer:tapGesture];
    
    
    _pickerView = [UIView new];
    [_pickerView setFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, PLANE_H)];
    [_pickerView setBackgroundColor:[UIColor whiteColor]];
    
    _contentView = [self initPlaneContent:_pickerView];
    [_pickerView addSubview:_contentView];
    
    
    // 加入动作条
    UIToolbar *controlToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, TOOLBAR_H)];
    [controlToolbar sizeToFit];
    // 确认
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [infoButton setFrame:CGRectMake(0, 0, 50, TOOLBAR_H)];
    [infoButton setTitle:@"确认" forState:UIControlStateNormal];
    [infoButton addTarget:self action:@selector(dismissDateSet) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *setButton = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
    // 间隔
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    // 取消
    UIButton *infoButtonCancel = [UIButton buttonWithType:UIButtonTypeSystem];
    [infoButtonCancel setFrame:CGRectMake(0, 0, 50, TOOLBAR_H)];
    [infoButtonCancel setTitle:@"取消" forState:UIControlStateNormal];
    [infoButtonCancel setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [infoButtonCancel addTarget:self action:@selector(cancelDateSet) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithCustomView:infoButtonCancel];
    [controlToolbar setItems:[NSArray arrayWithObjects:cancelButton, spacer, setButton, nil] animated:NO];
    [_pickerView addSubview:controlToolbar];
    
    [self addSubview:_pickerView];
}

- (UIView *)initPlaneContent:(UIView *) planeView {
    return nil;
}

- (void)dismissDateSet {
    [UIView animateWithDuration:0.3 animations:^{
        [_pickerView setFrame:CGRectMake(_pickerView.frame.origin.x,
                                         SCREEN_HEIGHT,
                                         _pickerView.frame.size.width,
                                         _pickerView.frame.size.height)];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    [self didConfirm];
}

- (void)didConfirm {
    
}
- (void)didCancel {
    
}

- (void)cancelDateSet{
    [UIView animateWithDuration:0.3 animations:^{
        [_pickerView setFrame:CGRectMake(_pickerView.frame.origin.x,
                                         SCREEN_HEIGHT,
                                         _pickerView.frame.size.width,
                                         _pickerView.frame.size.height)];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    [self didCancel];
}



- (void)show {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
    [UIView animateWithDuration:0.3f animations:^{
        [_pickerView setFrame:CGRectMake(0, SCREEN_HEIGHT - _pickerView.frame.size.height, SCREEN_WIDTH, 250)];
    }];
}

@end
