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
    let dateFormater: DateFormatter = {
        let dt = DateFormatter()
        dt.locale = Locale(identifier: "ru_Ru")
        dt.dateFormat = "d MMM 'в' HH:mm"
        
        return dt
    }()
  
    func presentData(response: Newsfeed.Model.Response.ResponseType) {
    
        switch response {
        case .presentNewsFeed(let feed):
            
            
            
            let cells = feed.items.map { (feedItem) in
                cellViewModel(feedItem: feedItem, profiles: feed.profiles, groups: feed.groups)
            }
            
            let feedViewModel = FeedViewModel(cells: cells)
            viewController?.displayData(viewModel: .displayNewsFeed(feedViewModel: feedViewModel))
        }
    }
    
    private func cellViewModel(feedItem: FeedItem, profiles: [Profiles], groups: [Groups]) -> FeedViewModel.Cell {
        
        let profile = self.profile(for: feedItem.sourceId, profiles: profiles, groups: groups)
        
        let date = Date(timeIntervalSince1970: feedItem.date)
        let dateTitle = dateFormater.string(from: date)
        
        
        return FeedViewModel.Cell(iconUrlString: profile.photo,
                                  name: profile.name,
                                  date: dateTitle,
                                  text: feedItem.text,
                                  likes: String(feedItem.likes?.count ?? 0 ),
                                  comments: String(feedItem.comments?.count ?? 0 ),
                                  views: String(feedItem.views?.count ?? 0 ),
                                  shares: String(feedItem.reposts?.count ?? 0 ))
    }
    
    private func profile(for sourceId: Int, profiles: [Profiles], groups: [Groups]) -> ProfileRepresentable {
        
        let profilesOrGroups: [ProfileRepresentable] = sourceId >= 0 ? profiles : groups
        let normalSourceId = sourceId >= 0 ? sourceId : -sourceId
        let profileRepresentable = profilesOrGroups.first { (myProfileRepresentable) -> Bool in
            myProfileRepresentable.id == normalSourceId
        }
        
        return profileRepresentable!
    }
}











