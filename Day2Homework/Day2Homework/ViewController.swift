//
//  ViewController.swift
//  Day2Homework
//
//  Created by 柳田昌弘 on 2020/11/26.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBOutlet private dynamic weak var iconView: UIImageView!
    @IBOutlet private dynamic weak var nameLabel: UILabel!
    @IBOutlet private dynamic weak var addressLabel: UILabel!
    @IBOutlet private dynamic weak var contentsLabel: UILabel!
    @IBOutlet private dynamic weak var favoriteButton: UIButton!
    @IBOutlet private dynamic weak var imageView: UIImageView!
    @IBOutlet private dynamic weak var heightConstraint: NSLayoutConstraint!
    @IBAction private func buttonTouchUpInside(_ sender: UIButton) {
        print("touch!!")
    }
}
