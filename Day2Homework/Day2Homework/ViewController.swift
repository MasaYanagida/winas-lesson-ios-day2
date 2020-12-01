//
//  ViewController.swift
//  Day2Homework
//
//  Created by 柳田昌弘 on 2020/11/26.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private lazy var button: UIButton = {
        let button = UIButton()
        button.cornerRadius = 32
        button.borderWidth = 1
        button.borderColor = .red
        button.backgroundColor = .white
        button.setTitleColor(UIColor.hexColor(0xff0000), for: .normal)
        button.setTitle("画像拡大/縮小", for: .normal)
        button.addTarget(self, action: #selector(imageTouchUpInside(sender:)), for: .touchUpInside)
        //view.addSubview(button)
        stackView.addArrangedSubview(button)
        return button
    }()
    
    var content: Content? {
        didSet {
            guard let content = self.content else {
                return
            }
            
            iconView.image = UIImage(named: content.iconName)
            nameLabel.text = content.name
            addressLabel.text = content.address
            introductionLabel.text = content.introduction
            landscapeView.image = UIImage(named: content.imageName)

        }
    }
    var isExpand: Bool = false
    
    @IBOutlet fileprivate dynamic weak var iconView: UIImageView!
    @IBOutlet fileprivate dynamic weak var nameLabel: UILabel!
    @IBOutlet fileprivate dynamic weak var addressLabel: UILabel!
    @IBOutlet fileprivate dynamic weak var introductionLabel: UILabel!
    @IBOutlet fileprivate dynamic weak var favoriteButton: UIButton!
    @IBOutlet fileprivate dynamic weak var landscapeView: UIImageView!
    @IBOutlet fileprivate dynamic weak var stackView: UIStackView!
    @IBAction fileprivate func favoriteTouchUpInside(_ sender: UIButton) {
        content?.showFavoriteButton = false;
        hiddenFavorite()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.snp.makeConstraints { make in
            make.bottom.equalTo(view).offset(-20)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(64)
        }
        
        content = Content.create()
        hiddenFavorite()
    }
    
    @IBOutlet private dynamic weak var heightConstraint: NSLayoutConstraint!
    
    @objc private func imageTouchUpInside(sender: UIButton) {
        toggleImageSize()
    }
    
    private func toggleImageSize() {
        heightConstraint.constant = isExpand ? 128 : 256
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
    
    private func hiddenFavorite() {
        if (content?.showFavoriteButton == false) {
            let dialog = UIAlertController()
            dialog.message = "お気に入りに登録しました"
            
            dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(dialog, animated: true, completion: nil)
            
            favoriteButton.isHidden = true
        }
    
    }
    
    
}
