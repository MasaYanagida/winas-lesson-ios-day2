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
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var imageheightConstraint: NSLayoutConstraint!
    @IBOutlet weak var introductionLabel: UILabel!
    var isExpand: Bool = false
    
    var content: Content? {
        didSet {
            guard let content = content else { return }
            iconImageView.image = UIImage(named: content.iconName)
            nameLabel.text = content.name
            addressLabel.text = content.address
            introductionLabel.text = content.introduction
            mainImage.image = UIImage(named: content.imageName)
        }
    }
    
    
    @IBAction func toggelButtonTapped(_ sender: Any) {
        imageheightConstraint.constant = isExpand ? 128 : 256
        UIView.animate(withDuration: 0.6,
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
    @IBAction func favouriteButtonTapped(_ sender: Any) {
        content?.showFavoriteButton = !(content?.showFavoriteButton ?? false)
        let alert = UIAlertController(
            title: "お知らせ",
            message: "お気に入りに登録しました",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.cornerRadius = 10
        button.borderWidth  = 1
        button.borderColor  = .red
        button.backgroundColor = .white
        button.setTitleColor(.red, for: .normal)
        button.setTitle("画像拡大/縮小", for: .normal)
        button.addTarget(self, action: #selector(toggelButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(button)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        content = Content.create()
        button.snp.makeConstraints { make in
            make.bottom.equalTo(view).offset(-20)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(60)
        }
        favouriteButton.cornerRadius = 25
        mainImage.cornerRadius = 10
    }
}
