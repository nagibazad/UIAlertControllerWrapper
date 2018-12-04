# UIAlertControllerWrapper

This wrapper provides a way of converting UIAlertView to UIAlertController easily. `UIAlertView` is deprecated from `iOS 9.0`. Convert your `UIAlertView` of old projects to `UIAlertController` keeping your delegate implementation remain same using this `UIAlertControllerWrapper`.

### How To Use

* Objective C:

```Swift

    CIAlertView *alertView = [[CIAlertView alloc] initWithTitle:@"Dummy title" message:@"This is a dummy message"     delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Button0",@"Button1",@"Button2",@"Button3",@"Button4", nil];
    alertView.tag = 12345;
    alertView.alertViewStyle = CIAlertViewStyleLoginAndPasswordInput;
    [alertView show];
 ```

Implement your delegate as it was before with some simple changes

```Swift
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

```
