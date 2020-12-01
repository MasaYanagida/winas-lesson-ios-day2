//
//  ViewController.swift
//  Day2Homework
//
//  Created by 柳田昌弘 on 2020/11/26.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var isExpand: Bool = false
    var alertController: UIAlertController!
    
    @IBOutlet private dynamic weak var loginButton: UIButton!
    @IBOutlet private dynamic weak var favoriteButton: UIButton!
    @IBOutlet private dynamic weak var icon: UIImageView!
    @IBOutlet private dynamic weak var sampleImage: UIImageView!
    @IBOutlet private dynamic weak var nameLabel: UILabel!
    @IBOutlet private dynamic weak var addressLabel: UILabel!
    @IBOutlet private dynamic weak var introductionLabel: UILabel!
    @IBOutlet private dynamic weak var imageHeightConstraint: NSLayoutConstraint!
    @IBOutlet private dynamic weak var uiViewHeightConstraint: NSLayoutConstraint!
    
    private lazy var resizeButton: UIButton = {
        let button = UIButton()
        button.cornerRadius = 32
        button.borderWidth = 1
        button.borderColor = .red
        button.backgroundColor = .white
        button.setTitleColor(UIColor.hexColor(0xff0000), for: .normal)
        button.setTitle("画像拡大/縮小", for: .normal)
        button.addTarget(self, action: #selector(buttonTouchUpInside2(sender:)), for: .touchUpInside)
        view.addSubview(button)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let content = Content.create()
        
        icon.image = UIImage(named: content.iconName)
        nameLabel.text = content.name
        addressLabel.text = content.address
        introductionLabel.text = content.introduction
        
        if content.showFavoriteButton {
            favoriteButton.cornerRadius = 12
            favoriteButton.borderWidth = 1
            favoriteButton.borderColor = .white
            favoriteButton.backgroundColor = .red
            favoriteButton.setTitleColor(UIColor.white, for: .normal)
            favoriteButton.setTitle("お気に入り登録する", for: .normal)
        } else {
            favoriteButton.isHidden = true
        }
        
        sampleImage.image = UIImage(named: content.imageName)
        
        resizeButton.snp.makeConstraints { make in
            make.bottom.equalTo(view).offset(-20)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(64)
        }
        
    }
    
    @IBAction private func favoriteButtonTouchUpInside(sender: UIButton) {
        alert(title: "", message: "お気に入り登録しました")

        favoriteButton.isHidden = true
    }
    
    @objc private func buttonTouchUpInside2(sender: UIButton) {
        toggle()
    }
    
    private func toggle() {
        imageHeightConstraint.constant = isExpand ? 128 : 256
//        uiViewHeightConstraint.constant = 300
        UIView.animate(
            withDuration: 0.6,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.5,
            options: .curveLinear,
            animations: { [weak self] in
                self?.view.layoutIfNeeded()
            },
            completion: { [weak self] _ in
                guard let `self` = self else { return }
                self.isExpand = !self.isExpand
            }
        )
    }
    
    func alert(title:String, message:String) {
        alertController = UIAlertController(title: title,
                                   message: message,
                                   preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK",
                                       style: .default,
                                       handler: nil))
        present(alertController, animated: true)
    }
}
