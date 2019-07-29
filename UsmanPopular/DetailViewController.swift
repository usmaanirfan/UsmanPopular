//
//  DetailViewController.swift
//  UsmanPopular
//
//  Created by Usman Ansari on 28/07/19.
//  Copyright © 2019 Usman Test. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var abstractLabel: UILabel!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var byLineLabel: UILabel!
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var moreDetailsButton: UIButton!
    @IBOutlet weak var keywordsLabel: UILabel!
    
    // MARK: - Properties
    var detailItem: Results?
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - ViewController Methods
    func configureView() {
        // Update the user interface for the detail item.
        if detailItem != nil {
            
            self.abstractLabel.text = detailItem?.abstract
            self.sectionLabel.text = detailItem?.section
            self.titleLabel.text = detailItem?.title
            self.byLineLabel.text = detailItem?.byline
            self.keywordsLabel.text = detailItem?.adx_keywords
            
            
            self.moreDetailsButton.setTitle("See Full "+(detailItem?.type)!, for: .normal)
            
            self.previewImageView?.image = UIImage(named: Constants.DetailViewController.PlaceholderImageName)
            
            APIManager.downloadImage(object: self.detailItem!) { (image, error) in
                
                DispatchQueue.main.async() { () -> Void in
                    self.previewImageView?.image = image
                }
            }
            
            
        }
    }
    
    // MARK: - Button Actions
    @IBAction func didTapDetailsButton(_ sender: Any) {
        
        let url = URL(string: (detailItem?.url)!)
        
        if UIApplication.shared.canOpenURL(url!) {
            
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
            
        } else {
            let alert = UIAlertController(title: "Error", message: "There was a problem when trying to open "+(detailItem?.url)!, preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        
    }

}

