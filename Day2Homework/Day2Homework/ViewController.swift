//
//  ViewController.swift
//  Day2Homework
//
//  Created by 柳田昌弘 on 2020/11/26.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    @IBOutlet fileprivate dynamic weak var iconImageView: UIImageView!
    @IBOutlet fileprivate dynamic weak var nameLabel: UILabel!
    @IBOutlet fileprivate dynamic weak var addressLabel: UILabel!
    @IBOutlet fileprivate dynamic weak var introductionLabel: UILabel!
    @IBOutlet fileprivate dynamic weak var articleImageView: UIImageView!
    @IBOutlet fileprivate dynamic weak var favouriteButton: UIButton!
    
    @IBOutlet fileprivate dynamic weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var introductionHeightContraint: NSLayoutConstraint!
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.cornerRadius = 32
        button.borderWidth = 1
        button.borderColor = .red
        button.backgroundColor = .white
        button.setTitleColor(UIColor.hexColor(0xff0000), for: .normal)
        button.setTitle("画像拡大/縮小", for: .normal)
        button.addTarget(self, action: #selector(onTapToggleButton(sender:)), for: .touchUpInside)
        view.addSubview(button)
        
        return button
    }()
    
    var content: Content? {
        didSet {
            guard let content = content else { return }
            iconImageView.image = UIImage(named: content.iconName)
            nameLabel.text = content.name
            addressLabel.text = content.address
            introductionLabel.text = content.introduction
            articleImageView.image = UIImage(named: content.imageName)
        }
    }
    
    var isExpand: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.snp.makeConstraints { make in
            make.bottom.equalTo(view).offset(-20)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(60)
        }
        
        content = Content.create()
        toggleFavouriteButtonVisibility()
    }
    
    @IBAction func onTapFavouriteButton(_ sender: UIButton) {
        //Add or remove favourite
        content?.showFavoriteButton = !(content?.showFavoriteButton ?? false)
        let alert = UIAlertController(title: "", message: "お気に入りに登録しました", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
            self?.toggleFavouriteButtonVisibility()
        }))
        
        self.present(alert, animated: true)
    }
    
    @objc private func onTapToggleButton(sender: UIButton) {
        //Toggle image size
        toggleImageSize()
    }
    
    func toggleImageSize() {
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
    
    func toggleFavouriteButtonVisibility() {
        favouriteButton.isHidden = !(content?.showFavoriteButton ?? false)
        if content?.showFavoriteButton ?? false == false {
            introductionHeightContraint.constant = 180
        } else {
            introductionHeightContraint.constant = 130
        }
    }
}
