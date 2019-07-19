 //
//  WebImageView.swift
//  VKNewsFeed
//
//  Created by WSR on 19/07/2019.
//  Copyright © 2019 Rainblower. All rights reserved.
//

import UIKit
 
class WebImageView: UIImageView {

    func set(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            
        }
    }
}
