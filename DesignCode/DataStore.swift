//
//  DataStore.swift
//  DesignCode
//
//  Created by Ehsan Rahimi on 10/2/23.
//

import SwiftUI
import Combine
class DataStore:ObservableObject {
    @Published var posts: [Post] = []
    
    init() {
        getPost()
    }
    
    func getPost() {
        Api().getPosts { posts in
            self.posts = posts
        }
    }
}
