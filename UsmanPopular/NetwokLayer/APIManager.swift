//
//  APIManager.swift
//  UsmanPopular
//
//  Created by Usman Ansari on 28/07/19.
//  Copyright © 2019 Usman Test. All rights reserved.
//
import Foundation

import Alamofire

enum DataError: Error {
    case duplicateFailure
    case nonExistent
    case incomplete
    case other(Error?)
}

class APIManager {
    @discardableResult
    private static func performRequest<T:Decodable>(route:String, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (AFResult<T>)->Void) -> DataRequest {
        return AF.request(route)
            .responseDecodable (decoder: decoder){ (response: DataResponse<T>) in
                completion(response.result)
        }
    }
    
    
    static func getArticles(completion:@escaping (AFResult<MostPopular>)->Void) {
        let urlPath = "\(Constants.API.urlPath)\(Constants.API.APIKey)"
        let jsonDecoder = JSONDecoder()
        performRequest(route: urlPath, decoder: jsonDecoder, completion: completion)
    }
    
    static func downloadImage(object : Results, completionHandler: @escaping (UIImage?, Error?) -> Void) {
        if let media = object.media?.first {
            
            if  let metadata = media.mediametadata?.first {
                
                self.getData(urlString: (metadata.url)!, completionHandler: {data, err in
                    completionHandler(UIImage(data: data!), err)
                })
            }
        }

}

    static func getData(urlString : String, completionHandler: @escaping (Data?, Error?) -> Void) {
        
        AF.request(urlString).responseData { response in
            
            if let data = response.data {
                completionHandler(data, response.error)
            } else {
                completionHandler(nil, response.error)
            }
        }
    }

}
