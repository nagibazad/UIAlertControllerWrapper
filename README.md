# UIAlertControllerWrapper

This wrapper provides a way of converting UIAlertView to UIAlertController easily. `UIAlertView` is deprecated from `iOS 9.0`. Convert your `UIAlertView` of old projects to `UIAlertController` keeping your delegate implementation remain same using this `UIAlertControllerWrapper` and get rid of all the `UIAlertView` related `warnings`.

### How To Use

Add `UIAlertControllerWrapper` folder in your project

* Objective C:

```Objective-C

    CIAlertView *alertView = [[CIAlertView alloc] initWithTitle:@"Dummy title" message:@"This is a dummy message"     delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Button0",@"Button1",@"Button2",@"Button3",@"Button4", nil];
    alertView.tag = 12345;
    alertView.alertViewStyle = CIAlertViewStyleLoginAndPasswordInput;
    [alertView show];
 ```

Implement your delegate as it was before with some simple changes

```Objective C
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

* Swift:

```Swift
        let alertView = CIAlertView(title: "Dummy title", message: "This is a test message", delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "Button0","Button1","Button2","Button3","Button4")
        alertView.tag = 12345;
        alertView.alertViewStyle = .loginAndPasswordInput
        alertView.show()
```

Implement your delegate as it was before with some simple changes

```Swift

extension SwiftAlertViewController: CIAlertViewDelegate {
    
    func alertView(_ alertView: CIAlertView, clickedButtonAt buttonIndex: Int) {
        print("clickedButtonAt \(buttonIndex)")
    }
    
    func alertView(_ alertView: CIAlertView, willDismissWithButtonIndex buttonIndex: Int) {
        print("willDismissWithButtonIndex \(buttonIndex)")
    }
    
    func alertViewShouldEnableFirstOtherButton(_ alertView: CIAlertView) -> Bool {
        return true
    }
    func alertView(_ alertView: CIAlertView, didDismissWithButtonIndex buttonIndex: Int) {
        print("didDismissWithButtonIndex \(buttonIndex)")
        
    }
    
    func alertViewCancel(_ alertView: CIAlertView) {
        print("alertViewCancel")
        
    }
    
    func didPresent(_ alertView: CIAlertView) {
        print("didPresent")
        
    }
    
    func willPresent(_ alertView: CIAlertView) {
        print("willPresent")
        
    }
}

```

## Easiest Steps

Just Serach for `UIAlertView` in you project and replace with `CIAlertView`. Now all of your `UIAlertView` will get converted to `UIAlertController` without changing your implementation.
