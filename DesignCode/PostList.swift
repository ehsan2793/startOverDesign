//
//  PostList.swift
//  DesignCode
//
//  Created by Ehsan Rahimi on 10/1/23.
//

import SwiftUI

struct PostList: View {
    @State var posts: [Post] = []
    var body: some View {
        List(posts) { post in
            Text(post.title)
        }
        .listStyle(.plain)
        .onAppear {
            Api().getPosts { posts in
                self.posts = posts
            }
        }
    }
}

#Preview {
    PostList()
}
