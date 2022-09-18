//
//  DetailViewController.swift
//  NewsApp.Bootcamp
//
//  Created by Mert Karahan on 14.09.2022.
//

import UIKit
import Foundation
import Kingfisher

class DetailViewController: UIViewController {

    @IBOutlet weak var detailUrlLabel: UILabel!
    @IBOutlet weak var detailContentLabel: UILabel!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailPublishedAtLabel: UILabel!
    @IBOutlet weak var detailSourceLabel: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    
    var detailViewModel : DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
//    To be able to print data from the model.
    private func configure() {
        
        detailTitle.text = detailViewModel?.title
        detailContentLabel.text = detailViewModel?.contentLabel
        detailDescriptionLabel.text = detailViewModel?.descriptionLabel
        detailSourceLabel.text = detailViewModel?.sourceLabel
        detailPublishedAtLabel.text = detailViewModel?.publishedAt
        detailUrlLabel.text = detailViewModel?.urlLabel
        detailImage.setImage(imageUrl: detailViewModel?.image ?? "")
        
    }
    
//    Action when button clicked.
    @IBAction func buttonClicked(_ sender: Any) {
        
        let selectedUrl = detailUrlLabel.text ?? "www.google.com"
        let webViewController = WebViewBuilder.buildWebView(url: selectedUrl)
        self.navigationController?.pushViewController(webViewController, animated: true)
    }
}
