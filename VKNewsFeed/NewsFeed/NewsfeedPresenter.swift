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
  
  }
  
}
