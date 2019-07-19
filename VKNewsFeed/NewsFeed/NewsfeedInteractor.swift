//
//  NewsfeedInteractor.swift
//  VKNewsFeed
//
//  Created by WSR on 18/07/2019.
//  Copyright (c) 2019 Rainblower. All rights reserved.
//

import UIKit

protocol NewsfeedBusinessLogic {
  func makeRequest(request: Newsfeed.Model.Request.RequestType)
}

class NewsfeedInteractor: NewsfeedBusinessLogic {

    var presenter: NewsfeedPresentationLogic?
    var service: NewsfeedService?
    
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
  
    func makeRequest(request: Newsfeed.Model.Request.RequestType) {
        if service == nil {
            service = NewsfeedService()
        }
    
        switch request {
            
        case .getNewsFeed:
            <#code#>

        }
    }
}
