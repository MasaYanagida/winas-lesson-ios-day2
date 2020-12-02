//
//  ViewController.swift
//  Day2Homework
//
//  Created by 柳田昌弘 on 2020/11/26.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet fileprivate dynamic weak var nameLabel: UILabel!
    @IBOutlet fileprivate dynamic weak var addressLabel: UILabel!
    @IBOutlet fileprivate dynamic weak var introductionLabel: UILabel!
    @IBOutlet fileprivate dynamic weak var iconImageView: UIImageView!
    @IBOutlet fileprivate dynamic weak var articleImageView: UIImageView! {
        didSet {
            articleImageView.borderWidth = 1
            articleImageView.borderColor = UIColor.clear
            articleImageView.layer.cornerRadius = 12
            articleImageView.layer.masksToBounds = true
        }
    }
    @IBOutlet fileprivate dynamic weak var favoriteButton: UIButton! {
        didSet {
            favoriteButton.borderWidth = 1
            favoriteButton.borderColor = UIColor.red
            favoriteButton.backgroundColor = UIColor.red
            favoriteButton.layer.cornerRadius = 25
            favoriteButton.layer.backgroundColor = UIColor.red.cgColor
            favoriteButton.setTitle("お気に入り登録ボタン", for: .normal)
            favoriteButton.setTitleColor(UIColor.white, for: .normal)
        }
    }
    
    @IBOutlet fileprivate dynamic weak var heightConstraint: NSLayoutConstraint!
    
    fileprivate lazy var imageResizeButton: UIButton = {
        let button  = UIButton()
        button.cornerRadius = 10
        button.borderWidth = 1
        button.borderColor = .red
        button.backgroundColor = .white
        button.setTitle("画像拡大/縮小", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(didTapimageResizeButton(sender:)), for: .touchUpInside)
        view.addSubview(button)
        return button
    }()
    
    // MARK: - Properties
    var content: Content? {
        didSet {
            guard let content = content else { return }
            iconImageView.image = UIImage(named: content.iconName)
            nameLabel.text = content.name
            addressLabel.text = content.address
            introductionLabel.text = content.introduction
            articleImageView.image = UIImage(named: content.imageName)
            favoriteButton.isHidden = content.showFavoriteButton
        }
    }
    
    var isExpanded: Bool = false
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetch data
        content = Content.create()
        
        // Set contraints for image resize Button
        imageResizeButton.snp.makeConstraints { make in
            make.bottom.equalTo(view).offset(-20)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(60)
        }
    }
    
    // MARK: - IBActions
    @IBAction func didTapFavoriteButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "", message: "お気に入りに登録しました", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    
    @objc private func didTapimageResizeButton(sender: UIButton) {
        heightConstraint.constant = isExpanded ? 128 : 256
        UIView.animate(
            withDuration: 0.6,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.5,
            options: .curveLinear,
            animations: {[weak self] in
                guard let `self` = self else { return }
                guard let content = self.content else { return }
                if !content.showFavoriteButton {
                    self.mainStackView.spacing = 15
                } else {
                    self.mainStackView.spacing = 25
                }
                self.view.layoutIfNeeded()
            },
            completion: {[weak self] _ in
                guard let `self` = self else { return }
                self.isExpanded = !self.isExpanded
            })
    }
    
}
