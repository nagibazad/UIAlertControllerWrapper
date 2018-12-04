//
//  CIAlertView+ObjC.h
//  AlertViewObjC
//
//  Created by Nagib Azad on 1/12/18.
//  Copyright © 2018 Nagib Bin Azad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIAlertControllerWrapperExample-Swift.h"
NS_ASSUME_NONNULL_BEGIN

@interface CIAlertView (ObjC)
- (instancetype)initWithTitle:(nullable NSString *)title message:(nullable NSString *)message delegate:(nullable id<CIAlertViewDelegate>)delegate cancelButtonTitle:(nullable NSString *)cancelButtonTitle otherButtonTitles:(nullable NSString *)otherButtonTitles, ...;
@end

NS_ASSUME_NONNULL_END
