//
//  ObjcAlertViewController.m
//  UIAlertControllerWrapperExample
//
//  Created by Nagib Azad on 4/12/18.
//  Copyright © 2018 Nagib Bin Azad. All rights reserved.
//

#import "ObjcAlertViewController.h"
#import "CIAlertView+ObjC.h"

@interface ObjcAlertViewController ()<CIAlertViewDelegate>

@end

@implementation ObjcAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Objective-C Alert";
    // Do any additional setup after loading the view.
}
- (IBAction)showAlertbuttonPressed:(id)sender {
    CIAlertView *alertView = [[CIAlertView alloc] initWithTitle:@"Dummy title" message:@"This is a dummy message" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Button0",@"Button1",@"Button2",@"Button3",@"Button4", nil];
    alertView.tag = 12345;
    alertView.alertViewStyle = CIAlertViewStyleLoginAndPasswordInput;
    [alertView show];
}

- (void)alertViewCancel:(CIAlertView *)alertView
{
    NSLog(@"alertViewCancel");
}

- (void)alertView:(CIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"clickedButtonAtIndex");
    
}

- (void)alertView:(CIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"didDismissWithButtonIndex");
    
}

- (void)alertView:(CIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"willDismissWithButtonIndex");
    
}

- (BOOL)alertViewShouldEnableFirstOtherButton:(CIAlertView *)alertView
{
    return NO;
}

- (void)didPresentAlertView:(CIAlertView *)alertView
{
    NSLog(@"didPresentAlertView");

}

- (void)willPresentAlertView:(CIAlertView *)alertView
{
    NSLog(@"willPresentAlertView");
}


@end
