//
//  ViewController.swift
//  Day2Sample
//
//  Created by 柳田昌弘 on 2020/11/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBOutlet private dynamic weak var heightConstraint: NSLayoutConstraint!
    @IBAction private func buttonTouchUpInside(_ sender: UIButton) {
        print("touch!!")
    }
    @IBAction private func onImageViewTapped(sender: UITapGestureRecognizer) {
        print(#function)
    }
    @objc private func buttonTouchUpInside2(sender: UIButton) {
    }
}
