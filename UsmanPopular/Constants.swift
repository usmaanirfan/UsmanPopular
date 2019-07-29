//
//  Constants.swift
//  UsmanPopular
//
//  Created by Usman Ansari on 28/07/19.
//  Copyright © 2019 Usman Test. All rights reserved.
//

struct Constants {
    struct MasterViewController {
        static let SummaryCellIdentifier = "MasterTableCell"
        static let PlaceholderImageName = "Placeholder"
    }
    struct DetailViewController {
        static let PlaceholderImageName = Constants.MasterViewController.PlaceholderImageName
    }
    struct API {
        static let urlPath = "https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key="
        static let APIKey = "FX1yXlwN70kIedXd5riKFzuHrAqFqOMF"

    }
}
