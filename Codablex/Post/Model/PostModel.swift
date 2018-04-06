//  
//  PostModel.swift
//  Codablex
//
//  Created by Agus Cahyono on 06/04/18.
//  Copyright © 2018 Agus Cahyono. All rights reserved.
//

import Foundation
struct PostModel: Decodable {
    
    var userId: Int
    var id: Int
    var title: String
    var body: String

}
