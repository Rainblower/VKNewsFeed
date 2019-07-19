//
//  NewsfeedPresenter.swift
//  VKNewsFeed
//
//  Created by WSR on 18/07/2019.
//  Copyright (c) 2019 Rainblower. All rights reserved.
//

import UIKit

protocol NewsfeedPresentationLogic {
  func presentData(response: Newsfeed.Model.Response.ResponseType)
}

class NewsfeedPresenter: NewsfeedPresentationLogic {
    weak var viewController: NewsfeedDisplayLogic?
  
    func presentData(response: Newsfeed.Model.Response.ResponseType) {
    
        switch response {
        case .presentNewsFeed(let feed):
            
            let cells = feed.items.map { (feedItem) in
                cellViewModel(feedItem: feedItem)
            }
            
            let feedViewModel = FeedViewModel(cells: cells)
            viewController?.displayData(viewModel: .displayNewsFeed(feedViewModel: feedViewModel))
        }
    }
    
    private func cellViewModel(feedItem: FeedItem) -> FeedViewModel.Cell {
        return FeedViewModel.Cell(iconUrlString: "",
                                  name: "future name",
                                  date: "future date",
                                  text: feedItem.text,
                                  likes: String(feedItem.likes?.count ?? 0 ),
                                  comments: String(feedItem.comments?.count ?? 0 ),
                                  views: String(feedItem.views?.count ?? 0 ),
                                  shares: String(feedItem.reposts?.count ?? 0 ))
    }
}
