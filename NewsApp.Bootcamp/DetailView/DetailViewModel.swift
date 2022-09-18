//
//  DetailViewModel.swift
//  NewsApp.Bootcamp
//
//  Created by Mert Karahan on 15.09.2022.
//

import Foundation


struct DetailViewModel {
    
    private var itemFromHome : HomeModel
    
    var title: String {
        itemFromHome.title
    }
    
    var contentLabel: String {
        itemFromHome.content
    }
    
    var descriptionLabel: String {
        itemFromHome.description
    }
    
    var sourceLabel: String {
        itemFromHome.source
    }
    
    var publishedAt: String {
        itemFromHome.publishedAt
    }
    
    var urlLabel: String {
        itemFromHome.url
    }
    
    var image: String {
        itemFromHome.image
    }
    
//    Struct has init method because "itemFromHome" is private.
    init(itemFromHome: HomeModel) {
        self.itemFromHome = itemFromHome
    }
}
