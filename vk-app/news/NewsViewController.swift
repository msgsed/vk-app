//
//  NewsViewController.swift
//  vk-app
//
//  Created by Sergey Dmitriev on 21.09.2021.
//

import UIKit

enum PostCellType: Int, CaseIterable {
    case author = 0
    case text
    case photo
    case likeCount
}



class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestNewsFeed()
    }
    
    func requestNewsFeed(){
        //Здесь запрос новостной ленты
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 10
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostCellType.allCases.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //cell.textLabel?.text = "Section: \(indexPath.section), row: \(indexPath.row)"
        //return cell

        let postCellType = PostCellType(rawValue: indexPath.row)
        
        switch postCellType {
        case .author:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AuthorOfFeedTableViewCell", for: indexPath)
            //cell.config(authorName: item.groupName, authorPhoto: item.groupIcon, dateOfPublication: Date())
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            return cell
        case .text:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextOfFeedTableViewCell", for: indexPath)
            //cell.config(authorName: item.groupName, authorPhoto: item.groupIcon, dateOfPublication: Date())
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            return cell

        case .photo:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoOfFeedTableViewCell", for: indexPath)
            //cell.config(authorName: item.groupName, authorPhoto: item.groupIcon, dateOfPublication: Date())
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            return cell

        case .likeCount:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LikeCountTableViewCell", for: indexPath)
            //cell.config(authorName: item.groupName, authorPhoto: item.groupIcon, dateOfPublication: Date())
            return cell
        
        default:
            return UITableViewCell()
        }
    }

  

}
