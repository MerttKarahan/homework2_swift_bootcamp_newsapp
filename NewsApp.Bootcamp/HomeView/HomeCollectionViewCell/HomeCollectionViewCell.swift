//
//  HomeCollectionViewCell.swift
//  NewsApp.Bootcamp
//
//  Created by Mert Karahan on 14.09.2022.
//

import Foundation
import Kingfisher
import UIKit


class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var newsPublishedAt: UILabel!
    @IBOutlet weak var newsSource: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setCellView()
    }
    
    func configure(newsModel : HomeModel) {
        newsImage.setImage(imageUrl: newsModel.image)
        newsTitle.text = newsModel.title
        newsSource.text = newsModel.source
        newsPublishedAt.text = newsModel.publishedAt
    }
    
    private func setCellView() {
        containerView.layer.cornerRadius = 15.0
        containerView.layer.masksToBounds = true
    }

}

extension UIImageView {
    func setImage(imageUrl: String) {
        let url = URL(string: imageUrl)
        self.kf.setImage(with: url)
    }
}
