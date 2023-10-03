//
//  PostList.swift
//  DesignCode
//
//  Created by Ehsan Rahimi on 10/1/23.
//

import SwiftUI

struct PostList: View {
    @ObservedObject var store = DataStore()

    var body: some View {
        List(store.posts) { post in
            VStack(alignment: .leading, spacing: 8) {
                Text(post.title)
                    .font(.system(.title, design: .serif, weight: .bold))
                Text(post.body)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .listStyle(.plain)
       
    }
}

#Preview {
    PostList()
}
