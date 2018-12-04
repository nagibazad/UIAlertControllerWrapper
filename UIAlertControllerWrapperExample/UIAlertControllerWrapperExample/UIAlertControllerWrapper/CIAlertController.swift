//
//  CIAlertController.swift
//  AlertViewTest
//
//  Created by Inventive Apps on 27/11/18.
//  Copyright © 2018 Nagib Bin Azad. All rights reserved.
//

import UIKit

protocol AlertControllerDelegate {
    func didPresent(_ alertController: CIAlertController)
    func willPresent(_ alertController: CIAlertController)
    func didDismiss(_ alertController: CIAlertController, withIndex index: Int)
    func willDismiss(_ alertController: CIAlertController, withIndex index: Int)
    func clickedButton(at index: Int)
}

class CIAlertController: UIAlertController {

    var delegate: AlertControllerDelegate?
    private var currentClickedButtonIndex: Int = 0
    var hasCancelButton: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.delegate?.willDismiss(self, withIndex: self.currentClickedButtonIndex)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.delegate?.willPresent(self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.delegate?.didDismiss(self, withIndex: self.currentClickedButtonIndex)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let stackView = self.view.subviews.first?.subviews.first?.subviews.last?.subviews.last?.subviews.first?.subviews.first as? UIStackView {
            for view in stackView.subviews {
                let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
                view.addGestureRecognizer(tap)
            }
        }
        self.delegate?.didPresent(self)
    }
    
    @objc private func handleTap(_ gesture: UIGestureRecognizer) -> Void {
        let buttonFrame = gesture.view?.frame
        if let buttonFrame = buttonFrame {
            let index = Int(buttonFrame.origin.y/buttonFrame.height)
            if self.hasCancelButton == true {
                self.currentClickedButtonIndex = (index + 1) % self.actions.count
            }else {
                self.currentClickedButtonIndex = index
            }
            self.delegate?.clickedButton(at: self.currentClickedButtonIndex)
        }
    }
}
