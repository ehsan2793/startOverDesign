//
//  Data.swift
//  DesignCode
//
//  Created by Ehsan Rahimi on 10/1/23.
//

import Foundation
import SwiftUI

struct Post: Codable, Identifiable {
    var id: Int
    var title: String
    var body: String
}

class Api {
    func getPosts(completion: @escaping ([Post]) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data else { return }
            let posts = try! JSONDecoder().decode([Post].self, from: data)
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        .resume()
    }
}
