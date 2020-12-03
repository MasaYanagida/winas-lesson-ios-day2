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
    @IBOutlet weak var toggleButton: UIButton!
    @IBOutlet weak var mainImage: UIImageView!
    
    var content: Content? {
        didSet {
            guard let content = content else { return }
            iconImageView.image = UIImage(named: content.iconName)
            nameLabel.text = content.name
            addressLabel.text = content.address
            print(content.name)
            print(content.address)
        }
    }
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        
    }
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.cornerRadius = 32
        button.borderWidth  = 1
        button.borderColor  = .red
        button.backgroundColor = .white
        button.setTitle("Toggle", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        view.addSubview(button)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        content = Content.create()
    }
}
