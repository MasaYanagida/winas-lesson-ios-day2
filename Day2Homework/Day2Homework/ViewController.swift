//
//  ViewController.swift
//  Day2Homework
//
//  Created by 柳田昌弘 on 2020/11/26.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var introductionLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var showFavoriteButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.cornerRadius = 10
        button.borderWidth = 1
        button.borderColor = .red
        button.backgroundColor = .white
        button.setTitleColor(UIColor.hexColor(0xff0000), for: .normal)
        button.setTitle("画像拡大/縮小", for: .normal)
        button.addTarget(self, action: #selector(buttonTouchUpInside(sender:)), for: .touchUpInside)
        view.addSubview(button)
        return button
    }()
    
    var isExpand: Bool = false
    var contents = Content.create()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()

    }
}

extension ViewController {
    private func initView() {
        // bottom button
        button.snp.makeConstraints { make in
            make.bottom.equalTo(view).offset(-20)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(64)
        }
        
        imageView.layer.cornerRadius = 10
        showFavoriteButton.layer.cornerRadius = showFavoriteButton.frame.height / 2
        showFavoriteButton.addTarget(self, action: #selector(tappedShowFavoriteButton(sender:)), for: .touchUpInside)
        
        //label
        nameLabel.text = contents.name
        addressLabel.text = contents.address
        introductionLabel.text = contents.introduction
        
        //showFavoriteButton
        if contents.showFavoriteButton == false {
            showFavoriteButton.isHidden = true
        } else {
            showFavoriteButton.isHidden = false
        }
    }
    
    @objc func buttonTouchUpInside(sender: UIButton) {
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
    
    @objc func tappedShowFavoriteButton(sender: UIButton) {
        let alertController = UIAlertController(title: "", message: "お気に入りに登録しました", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
