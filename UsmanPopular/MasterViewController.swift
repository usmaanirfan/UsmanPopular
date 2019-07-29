//
//  MasterViewController.swift
//  UsmanPopular
//
//  Created by Usman Ansari on 28/07/19.
//  Copyright © 2019 Usman Test. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController,UISearchBarDelegate {

    var detailViewController: DetailViewController? = nil
    var objects = [Any]()
    var mostViewedItemsList : [Results]? = [Results]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150

        
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        APIManager.getArticles{ result in
            switch result {
            case .success(let articles):
                self.mostViewedItemsList = articles.results
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }


    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            
            let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
            
            controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
            controller.navigationItem.leftItemsSupplementBackButton = true
            
            if tableView.indexPathForSelectedRow != nil {
                let object = self.mostViewedItemsList?[(tableView.indexPathForSelectedRow?.row)!]
                controller.detailItem = object
            } else if (self.mostViewedItemsList?.count)! > 0 {
                //The first news shows by default no item selected and orientation is landscape.
                controller.detailItem = self.mostViewedItemsList?.first
            }
            
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mostViewedItemsList?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.MasterViewController.SummaryCellIdentifier, for: indexPath) as!  MasterTableCell
        
        //Populate object information to cell
        let object =  self.mostViewedItemsList?[indexPath.row]
        cell.titleLabel!.text = object?.title
        cell.byLineLabel.text = object?.byline
        cell.publishDateLabel.text = "🗓 "+(object?.published_date!)!
        cell.thumbnailView?.image = UIImage(named: Constants.MasterViewController.PlaceholderImageName)
        cell.thumbnailView?.layer.cornerRadius = 25
        
        APIManager.downloadImage(object: object!) { (image, error) in
            
            DispatchQueue.main.async() { () -> Void in
                cell.thumbnailView?.image = image
            }
            
        }

        cell.layoutIfNeeded()
        
        return cell
    }



}

