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
        
        if let cashedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            self.image = UIImage(data: cashedResponse.data)
            print("from cache")
            return
        }
        
        print("from internet")
        
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            
            DispatchQueue.main.async {
                if let data = data, let response = response {
                    self?.image = UIImage(data: data)
                    self?.handledLoadedImage(data: data, response: response)
                }
            }
        }
        dataTask.resume()
    }
    
    private func handledLoadedImage(data: Data, response: URLResponse) {
        guard let responseUrl = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseUrl))
    }
}
