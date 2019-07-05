//
//  Service.swift
//  AppStor
//
//  Created by Yamadou Traore on 5/20/19.
//  Copyright © 2019 yamadou. All rights reserved.
//

import Foundation

class Service {
    static let shared = Service() // singleton
    
    func fetchApps(searchTerm: String, completion: @escaping (SearchResult?, Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchAppDetail(appId: String, completion: @escaping (SearchResult?, Error?) -> Void) {
        let url = "https://itunes.appleº.com/lookup?id=\(appId)"
        fetchGenericJSONData(urlString: url, completion: completion)
    }
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "http://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/50/explicit.json"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchTopGrossing(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "http://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/50/explicit.json"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchTopFree(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "http://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/50/explicit.json"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    
    func fetchSocialApps(completion: @escaping([SocialApp]?, Error?) -> Void) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    // declare generic json function here
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        // fetch data from internet
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                print("Failed to fetch apps:", err)
                completion(nil, err)
                return
            }
            
            do {
                guard let data = data else { return }
                let objects = try JSONDecoder().decode(T.self, from: data)
                completion(objects, nil)
                
            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
                completion(nil, jsonErr)
            }
            
            }.resume() // fires off the request
    }
}
