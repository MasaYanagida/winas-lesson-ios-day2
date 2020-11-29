//
//  ViewController.swift
//  Day2Homework
//
//  Created by 柳田昌弘 on 2020/11/26.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var articleLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var articleImage: UIImageView!
    
    var isExpand: Bool = false
    var alertController: UIAlertController!
    
    private lazy var resizeButton: UIButton = {
        let button = UIButton()
        button.cornerRadius = 5
        button.borderWidth = 1
        button.borderColor = .red
        button.backgroundColor = .white
        button.setTitleColor(.red, for: .normal)
        button.setTitle("画像拡大/縮小", for: .normal)
        button.addTarget(self, action: #selector(buttonTouchUpInside2(sender:)), for: .touchUpInside)
        view.addSubview(button)
        return button
    }()
    
    @IBOutlet private dynamic weak var heightConstraint: NSLayoutConstraint!
   
    @IBAction func tapFavoriteButton(_ sender: UIButton) {
        alert(title: "お気に入り",
              message: "お気に入りに登録しました"
        )
    }

    func alert(title:String, message:String){
        alertController = UIAlertController(
            title : title,
            message: message,
            preferredStyle: .alert
        )
        alertController.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        ))
        present(alertController, animated: true)
        
    }
    
    @IBAction private func resizeButton(_ sender: UIButton){
        toggle()
    }
    
    @objc private func buttonTouchUpInside2(sender: UIButton) {
        toggle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let content = Content.create()
        nameLabel.text = content.name
        addressLabel.text = content.address
        articleLabel.text = content.introduction
        
        if content.showFavoriteButton == true {
            favoriteButton.isHidden = true
        }
        
        resizeButton.snp.makeConstraints { make in
            make.bottom.equalTo(view).offset(-20)
            make.left.equalTo(view).offset(15)
            make.right.equalTo(view).offset(-15)
            make.height.equalTo(64)
        }

    }
    
    private func toggle() {
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
}
