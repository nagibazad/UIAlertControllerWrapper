# UIAlertControllerWrapper

This wrapper provides a way of converting UIAlertView to UIAlertController easily. `UIAlertView` is deprecated from `iOS 9.0`. Convert your `UIAlertView` of old projects to `UIAlertController` keeping your delegate implementation remain same using this `UIAlertControllerWrapper`.

### How To Use

..* Objective C:

```

CIAlertView *alertView = [[CIAlertView alloc] initWithTitle:@"Dummy title" message:@"This is a dummy message" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Button0",@"Button1",@"Button2",@"Button3",@"Button4", nil];
    alertView.tag = 12345;
    alertView.alertViewStyle = CIAlertViewStyleLoginAndPasswordInput;
    [alertView show];
    ```
