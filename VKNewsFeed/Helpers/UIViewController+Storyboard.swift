//
//  UIViewController+Storyboard.swift
//  VKNewsFeed
//
//  Created by WSR on 17/07/2019.
//  Copyright © 2019 Rainblower. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    class func loadFromStoryboard<T: UIViewController>() -> T {
        let name = String(describing: T.self)
        let storyBoard = UIStoryboard(name: name, bundle: nil)
        
        if let viewController = storyBoard.instantiateInitialViewController() as? T {
            return viewController
        } else {
            fatalError("Error: No initial viewcontroller in \(name) styoryboard!")
        }
    }
}
