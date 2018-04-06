//  
//  PostServiceProtocol.swift
//  Codablex
//
//  Created by Agus Cahyono on 06/04/18.
//  Copyright © 2018 Agus Cahyono. All rights reserved.
//

import Foundation

protocol PostServiceProtocol {
    
    
    /// DID GET POST
    ///
    /// - Parameters:
    ///   - success: success response
    ///   - failure: failure
    func didGetPost(success: @escaping (_ data: [PostModel]) -> (), failure: @escaping() -> ())
    
}
