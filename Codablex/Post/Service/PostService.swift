//  
//  PostService.swift
//  Codablex
//
//  Created by Agus Cahyono on 06/04/18.
//  Copyright © 2018 Agus Cahyono. All rights reserved.
//

import Foundation
import Alamofire

class PostService: PostServiceProtocol {
    
    func didGetPost(success: @escaping (_ data: [PostModel]) -> (), failure: @escaping () -> ()) {
        
        let postURL = "https://jsonplaceholder.typicode.com/posts"
        APIManager.getFrom(
            postURL,
            method: .get,
            parameters: [:],
            encoding: JSONEncoding.default,
            headers: [:],
            completion: { response in
                
                let decoder = JSONDecoder()
                guard let callback = try? decoder.decode([PostModel].self, from: response) else {
                    print("ERROR: \(APIManager.generateRandomError())")
                    failure()
                    return
                }
                success(callback)
                
        }) { error in
            print("ERROR: \(error)")
            failure()
        }
        
        
        
    }
    
}
