//
//  ViewController.swift
//  Day2Homework
//
//  Created by 柳田昌弘 on 2020/11/26.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var isExpand: Bool = false
    private lazy var button: UIButton = {
        let button = UIButton()
        button.borderColor = UIColor.hexColor(0xff0000)
        button.borderWidth = 0.5
        button.cornerRadius = 8
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
        iconView.image = UIImage(named: content.iconName)
        nameLabel.text = content.name
        addressLabel.text = content.address
        contentsLabel.text = content.introduction
        favoriteButton.isHidden = !content.showFavoriteButton
        imageView.image = UIImage(named: content.imageName)
        button.snp.makeConstraints { make in
            make.height.equalTo(64)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.bottom.equalTo(view).offset(-20)
        }
    }
    @IBOutlet private dynamic weak var iconView: UIImageView!
    @IBOutlet private dynamic weak var nameLabel: UILabel!
    @IBOutlet private dynamic weak var addressLabel: UILabel!
    @IBOutlet private dynamic weak var contentsLabel: UILabel!
    @IBOutlet private dynamic weak var favoriteButton: UIButton!
    @IBOutlet private dynamic weak var imageView: UIImageView!
    @IBOutlet private dynamic weak var heightConstraint: NSLayoutConstraint!
    @IBAction private func buttonTouchUpInside(_ sender: UIButton) {
        let controller = UIAlertController(title: "お気に入り登録", message: "お気に入りに登録しました！", preferredStyle: .alert)
        controller.addAction(.init(title: "OK", style: .cancel, handler: nil))
        present(controller, animated: true, completion: nil)
    }
    @objc private func buttonTouchUpInside2(sender: UIButton) {
        let height: CGFloat = isExpand ? 128 : 256
        self.heightConstraint.constant = height
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
}
