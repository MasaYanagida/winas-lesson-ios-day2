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
    
    // MARK: - Properties
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
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Fetch data
        content = Content.create()
    }
    
    // MARK: - IBActions
    @IBAction func didTapFavoriteButton(_ sender: UIButton) {
    }
    
}

extension ViewController {
    
    fileprivate func showAlert() {
        
    }
    
    fileprivate func toggleFavoriteButton() {
        favoriteButton.isHidden = !()
    }
}
