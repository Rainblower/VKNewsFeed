//
//  FeedViewController.swift
//  VKNewsFeed
//
//  Created by WSR on 17/07/2019.
//  Copyright © 2019 Rainblower. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    private var fetecher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.3725763559, green: 0.679697752, blue: 0.9031428695, alpha: 1)
        
        fetecher.getFeed { (feedResponse) in
            guard let feedResponse = feedResponse else { return }
            
            feedResponse.items.map({ (feedItem) in
                print(feedItem.likes?.count)
            })
        }
    }
}
