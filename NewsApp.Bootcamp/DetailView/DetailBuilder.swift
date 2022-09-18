//
//  DetailBuilder.swift
//  NewsApp.Bootcamp
//
//  Created by Mert Karahan on 15.09.2022.
//

import Foundation

// Build DetailViewController
struct DetailBuilder {
    static func buildDetail(detailItem: HomeModel) -> DetailViewController {
        let detailViewModel = DetailViewModel(itemFromHome: detailItem)
        let detailViewController = DetailViewController()
        detailViewController.detailViewModel = detailViewModel
        return detailViewController
    }
}
