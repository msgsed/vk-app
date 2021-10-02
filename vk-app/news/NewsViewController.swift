//
//  NewsViewController.swift
//  vk-app
//
//  Created by Sergey Dmitriev on 21.09.2021.
//

import UIKit

struct NewsFeed {
    var type = ""
    //var text = ""
    init(json: [String: Any]) {
        self.type = json["type"] as! String
        //self.text = json["text"] as! String
    }
}

enum PostCellType: Int, CaseIterable {
    case author = 0
    case text
    case photo
    case likeCount
}

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var myTableView: UITableView!
    
    var news = [NewsFeed]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestNewsFeed()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return news.count
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostCellType.allCases.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

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

    func requestNewsFeed(){
        guard let url = URL(string: "https://api.vk.com/method/newsfeed.get?access_token=\(Session.shared.token)&extended=1&v=5.131")
        else {
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
            print(json)
            
            if let json = json {
                let array = json as! [String: Any]
                let responseArray = array["response"] as! [String: Any]
                let itemsArray = responseArray["items"] as! [[String: Any]]
                self.news = itemsArray.map{NewsFeed(json: $0)}
                
                print (self.news)
     
            }
        }
        
        task.resume()
    }
}
