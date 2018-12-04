//
//  CIAlertView.swift
//  AlertViewTest
//
//  Created by Inventive Apps on 27/11/18.
//  Copyright © 2018 Nagib Bin Azad. All rights reserved.
//

import Foundation
import UIKit


@objc protocol CIAlertViewDelegate: NSObjectProtocol {
    @objc(alertView: clickedButtonAtIndex:)
    func alertView(_ alertView: CIAlertView, clickedButtonAt buttonIndex: Int)
    @objc(alertView: willDismissWithButtonIndex:)
    func alertView(_ alertView: CIAlertView, willDismissWithButtonIndex buttonIndex: Int)
    @objc(alertViewShouldEnableFirstOtherButton:)
    func alertViewShouldEnableFirstOtherButton(_ alertView: CIAlertView) -> Bool
    @objc(alertView: didDismissWithButtonIndex:)
    func alertView(_ alertView: CIAlertView, didDismissWithButtonIndex buttonIndex: Int)
    func alertViewCancel(_ alertView: CIAlertView)
    @objc(didPresentAlertView:)
    func didPresent(_ alertView: CIAlertView)
    @objc(willPresentAlertView:)
    func willPresent(_ alertView: CIAlertView)
}

@objc enum CIAlertViewStyle: NSInteger {
    case defaultStyle = 0
    case secureTextInput
    case plainTextInput
    case loginAndPasswordInput
}


class CIAlertView: NSObject {
    private var alertController: CIAlertController!
    @objc let cancelButtonIndex: Int = 0
    @objc var delegate: CIAlertViewDelegate?
    @objc var tag: NSInteger = NSNotFound
    @objc var alertViewStyle: CIAlertViewStyle {
        get {
            if let numberOfInputField = self.alertController.textFields?.count {
                if numberOfInputField == 1 {
                    if let isSecure = self.alertController.textFields?.first?.isSecureTextEntry, isSecure == true {
                        return .secureTextInput
                    }else {
                        return .plainTextInput
                    }
                }else {
                    return .loginAndPasswordInput
                }
            }else {
                return .defaultStyle
            }
        }
        set {
            switch newValue {
            case .plainTextInput:
                self.alertController.addTextField(configurationHandler: nil)
            case .secureTextInput:
                self.alertController.addTextField { (textField) in
                    textField.placeholder = "Password"
                    textField.isSecureTextEntry = true
                }
            case .loginAndPasswordInput:
                self.alertController.addTextField { (textField) in
                    textField.placeholder = "Login"
                }
                self.alertController.addTextField { (textField) in
                    textField.placeholder = "Password"
                    textField.isSecureTextEntry = true
                }
            default:
                break
            }
            
        }
    }
    @objc(textFieldAtIndex:)
    open func textField(at textFieldIndex: Int) -> UITextField?
    {
        return self.alertController.textFields?[textFieldIndex]
    }
    @objc public convenience init(title: String?, message: String?, delegate: CIAlertViewDelegate?, cancelButtonTitle: String?) {
        self.init()
        self.delegate = delegate
        self.alertController = CIAlertController(title: title, message: message, preferredStyle: .alert)
        self.alertController.delegate = self
        if let cancelButtonTitle = cancelButtonTitle {
            let cancelButtonAction: UIAlertAction = UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: nil)
            self.alertController.hasCancelButton = true
            self.alertController.addAction(cancelButtonAction)
        }
    }
    
    public convenience init(title: String, message: String, delegate: CIAlertViewDelegate?, cancelButtonTitle: String?, otherButtonTitles firstButtonTitle: String, _ moreButtonTitles: String...) {
        self.init(title: title, message: message, delegate: delegate, cancelButtonTitle: cancelButtonTitle)
        self.populateButtons(otherButtonTitles: firstButtonTitle, moreButtonTitles)
    }
    
    @objc func populateButtons(otherButtonTitles firstButtonTitle: String, _ moreButtonTitles: [String]?) -> Void
    {
        var shouldEnableFirstOtherButton: Bool = true
        if (self.delegate?.responds(to: #selector(CIAlertViewDelegate.alertViewShouldEnableFirstOtherButton(_:))))! {
            if let shouldEnable = self.delegate?.alertViewShouldEnableFirstOtherButton(self), shouldEnable == false {
                shouldEnableFirstOtherButton = false
            }else {
                shouldEnableFirstOtherButton = true
            }
        }
        
        let otherFirstButtonAction: UIAlertAction = UIAlertAction(title: firstButtonTitle, style: .default, handler: nil)
        otherFirstButtonAction.isEnabled = shouldEnableFirstOtherButton
        self.alertController.addAction(otherFirstButtonAction)
        
        if let moreButtonTitles = moreButtonTitles {
            for buttonTitle in moreButtonTitles {
                let otherButtonAction: UIAlertAction = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
                self.alertController.addAction(otherButtonAction)
            }
        }
    }
    
    @objc func show() -> Void {
        CIAlertView.topViewController()?.present(self.alertController, animated: true, completion: nil)
    }
    
    @objc(dismissWithClickedButtonIndex: animated:)
    open func dismiss(withClickedButtonIndex buttonIndex: Int, animated: Bool) {
        self.alertController.dismiss(animated: animated, completion: nil)
    }
    
    @objc(addButtonWithTitle:)
    open func addButton(withTitle title: String?) -> Int
    {
        self.alertController.addAction(UIAlertAction(title: title, style: .default, handler: nil))
        return self.alertController.actions.count - 1
    }
    
    private class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}

extension CIAlertView: AlertControllerDelegate {
    
    func clickedButton(at index: Int) {
        if self.alertController.actions[index].isEnabled == true {
            self.delegate?.alertView(self, clickedButtonAt: index)
        }
    }
    
    func didDismiss(_ alertController: CIAlertController, withIndex index: Int) {
        self.delegate?.alertView(self, didDismissWithButtonIndex: index)
    }
    
    func willDismiss(_ alertController: CIAlertController, withIndex index: Int) {
        self.delegate?.alertView(self, willDismissWithButtonIndex: index)
    }
    
    func didPresent(_ alertController: CIAlertController) {
        self.delegate?.didPresent(self)
    }
    
    func willPresent(_ alertController: CIAlertController) {
        self.delegate?.willPresent(self)
    }
    
}
