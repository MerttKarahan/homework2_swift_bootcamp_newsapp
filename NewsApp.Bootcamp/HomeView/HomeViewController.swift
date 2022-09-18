//
//  HomeViewController.swift
//  NewsApp.Bootcamp
//
//  Created by Mert Karahan on 14.09.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    var homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionView()
        setNavigationController()
        homeViewModel.fetchJsonObjects()
    }
    
//    Collection View oranizing.
    private func setCollectionView() {
        self.homeCollectionView.delegate = self
        self.homeCollectionView.dataSource = self
        self.homeCollectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
    }
    
//    Navigation Controller organizing.
    private func setNavigationController(){
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "rectangle.grid.2x2"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(changeView))

        navigationItem.title = "News"
    }
    
//    Function for editing view type (Collection view or table view).
    @objc func changeView() {
        homeViewModel.changeView()
        homeCollectionView.reloadData()
    }
}

extension HomeViewController:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
//    To determine how many elements in one section.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.homeViewModel.numberOfNewsItem
    }
    
//    To determine what to write.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.configure(newsModel: homeViewModel.newsItem(at: indexPath.row))
        return cell
    }
    
//    To determine the size of an element.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch homeViewModel.viewType ?? .collectionView {
        case.collectionView:
            let cellWidth = (UIScreen.main.bounds.width - 10) / 2
            return CGSize(width: cellWidth, height: cellWidth * 1.45)
            
        case.tableView:
            let cellWidth = (UIScreen.main.bounds.width)
            return CGSize(width: cellWidth, height: cellWidth * 0.6)
        }
    }
    
//    To determine what to do when an element is selected.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedNews = homeViewModel.newsItem(at: indexPath.row)
        let detailViewController = DetailBuilder.buildDetail(detailItem: selectedNews)
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
