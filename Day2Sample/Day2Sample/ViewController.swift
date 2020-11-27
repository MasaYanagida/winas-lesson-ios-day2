//
//  ViewController.swift
//  Day2Sample
//
//  Created by 柳田昌弘 on 2020/11/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // IMPORTANT : ビューをプログラムから生成するときは、`lazy`で行うのが一般的です。このプロパティをcallしたときに初めて＆一回だけ生成されるからです
    private lazy var button: UIButton = {
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
        
        // IMPORTANT : SnapKitでレイアウト制約をつけます
        button.snp.makeConstraints { make in
            make.bottom.equalTo(view).offset(-20)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(64)
        }
    }
    var isExpand: Bool = false
    
    @IBOutlet private dynamic weak var loginButton: UIButton!
    @IBOutlet private dynamic weak var heightConstraint: NSLayoutConstraint!
    @IBAction private func buttonTouchUpInside(_ sender: UIButton) {
        toggle()
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
    @IBAction private func onImageViewTapped(sender: UITapGestureRecognizer) {
        toggle()
    }
    @objc private func buttonTouchUpInside2(sender: UIButton) {
        toggle()
    }
}
