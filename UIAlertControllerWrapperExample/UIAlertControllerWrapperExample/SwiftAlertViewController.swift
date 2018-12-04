//
//  SwiftAlertViewController.swift
//  UIAlertControllerWrapperExample
//
//  Created by Nagib Azad on 4/12/18.
//  Copyright © 2018 Nagib Bin Azad. All rights reserved.
//

import UIKit

class SwiftAlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Swift Alert"
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showAlertButtonPressed(_ sender: Any) {
        let alertView = CIAlertView(title: "Dummy title", message: "This is a test message", delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "Button0","Button1","Button2","Button3","Button4")
        alertView.tag = 12345;
        alertView.alertViewStyle = .loginAndPasswordInput
        alertView.show()
    }
    
}

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


