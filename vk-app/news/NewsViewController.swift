//
//  NewsViewController.swift
//  vk-app
//
//  Created by Sergey Dmitriev on 21.09.2021.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        // MARK: UITableViewDelegate, UITableViewDataSource
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 4
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 4
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = "Section: \(indexPath.section), row: \(indexPath.row)"
            return cell
        }
}
