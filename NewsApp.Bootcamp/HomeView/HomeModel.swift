//
//  NewsModel.swift
//  NewsApp.Bootcamp
//
//  Created by Mert Karahan on 14.09.2022.
//

import Foundation

// To get the data right.
struct HomeModel: Decodable {
    
    var sortId : Int
    var title : String
    var description : String
    var content : String
    var image : String
    var publishedAt : String
    var source : String
    var url : String

}
