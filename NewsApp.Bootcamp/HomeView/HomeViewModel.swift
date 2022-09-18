//
//  JsonOperations.swift
//  NewsApp.Bootcamp
//
//  Created by Mert Karahan on 14.09.2022.
//

import Foundation

struct HomeViewModel {
    
    var viewType : ViewType = .collectionView // This "var" defined for view type selection
    
    var jsonData: [HomeModel] = [] //This "var" defined for list the elements from the local json.
    
    var numberOfNewsItem: Int { // To determine elements count.
        self.jsonData.count
    }
    
    func newsItem(at index: Int) -> HomeModel { // To select the element with a certain index.
        return self.jsonData[index]
    }
    
//    This func for change current view.
    mutating func changeView() {
        switch viewType {
        case .collectionView:
            self.viewType = .tableView
        case .tableView:
            self.viewType = .collectionView
        }
    }
    
//    Fetching data from local json.
    mutating func fetchJsonObjects() {
        guard let fileLocation = Bundle.main.url(forResource: "news", withExtension: "json") else {return}
        
        do {
            let data = try? Data(contentsOf: fileLocation)
            self.jsonData = try! JSONDecoder().decode([HomeModel].self, from: data!)
        } catch {
            print("Fetching Error!")
        }
    }
}
