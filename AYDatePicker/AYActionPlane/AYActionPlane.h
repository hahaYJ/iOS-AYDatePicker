//
//  AYActionPlane.h
//  DatePicker
//
//  Created by hahaYJ on 3/27/16.
//  Copyright © 2016 mspsys087. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AYActionPlane : UIView

- (UIView *)initPlaneContent:(UIView *) planeView;
- (void)show;
- (void)didConfirm;
- (void)didCancel;

@end
