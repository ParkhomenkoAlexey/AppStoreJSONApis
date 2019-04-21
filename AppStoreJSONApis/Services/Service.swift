//
//  Service.swift
//  AppStoreJSONApis
//
//  Created by Алексей Пархоменко on 19/04/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import Foundation
import UIKit

class Service {
    
    static let shared = Service() // singleton
    
    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> ()) {
        print("Fetching itunes apps from Service layer")
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Failed to fetch apps:", error)
                completion([], nil)
                return
            }
            guard let data = data else { return }
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results, nil)
            } catch let jsonErr {
                print("Failed to decode JSON", jsonErr)
                completion([], jsonErr)
            }
        }.resume()
    }
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) -> ()) {
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-apps-we-love/all/50/explicit.json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
    
            if let error = error {
                print("Failed to fetch apps:", error)
                completion(nil, error)
                return
            }
            
            do {
                // success
                let fetchResult = try JSONDecoder().decode(AppGroup.self, from: data!)
                completion(fetchResult, nil)
            } catch let jsonErr {
                print("Failed to decode JSON", jsonErr)
                completion(nil, jsonErr)
            }
            
            
        }.resume()
    }
}
