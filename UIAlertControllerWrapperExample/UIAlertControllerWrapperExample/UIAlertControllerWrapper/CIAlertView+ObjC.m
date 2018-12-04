//
//  CIAlertView+ObjC.m
//  AlertViewObjC
//
//  Created by Nagib Azad on 1/12/18.
//  Copyright © 2018 Nagib Bin Azad. All rights reserved.
//

#import "CIAlertView+ObjC.h"

@implementation CIAlertView (ObjC)

- (instancetype)initWithTitle:(nullable NSString *)title message:(nullable NSString *)message delegate:(nullable id<CIAlertViewDelegate>)delegate cancelButtonTitle:(nullable NSString *)cancelButtonTitle otherButtonTitles:(nullable NSString *)otherButtonTitles, ...
{
    NSMutableArray<NSString *> *buttons = [NSMutableArray array];
    va_list args;
    va_start(args, otherButtonTitles);
    
    NSString *arg = nil;
    while ((arg = va_arg(args, NSString *))) {
        [buttons addObject:arg];
    }
    
    va_end(args);
    
    CIAlertView *alertView = [self initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelButtonTitle];
    [alertView populateButtonsWithOtherButtonTitles:otherButtonTitles :buttons];
    return alertView;
}

@end
