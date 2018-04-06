//  
//  PostViewModel.swift
//  Codablex
//
//  Created by Agus Cahyono on 06/04/18.
//  Copyright © 2018 Agus Cahyono. All rights reserved.
//

import Foundation

class PostViewModel {

    private let service: PostServiceProtocol

    private var model: [PostModel] = [PostModel]() {
        didSet {
            self.reloadTableView?()
        }
    }

    // update loading status
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    
    var getNumberRow: Int {
        return self.model.count
    }
    
    func getSingleArray(indexPath: Int) -> PostModel {
        return self.model[indexPath]
    }

    // show alert message
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }

    // selected model
    var selectedObject: PostModel?

    // closure callback
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var reloadTableView: (() -> ())?

    init(withPost serviceProtocol: PostServiceProtocol = PostService() ) {
        self.service = serviceProtocol
    }
    
    func didGetPost() {
        self.isLoading = true
        self.service.didGetPost(success: { response in
            DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                self.isLoading = false
                self.model = response
            })
        }) {
             self.isLoading = false
        }
    }

}

extension PostViewModel {

}
