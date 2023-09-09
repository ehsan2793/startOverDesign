//
//  TabBar.swift
//  DesignCode
//
//  Created by Ehsan Rahimi on 9/9/23.
//

import SwiftUI

struct TabBar: View {
    // MARK: - PROPERTIES

    // MARK: - BODY

    var body: some View {
        TabView {
            Home()
                .tabItem {
                    TabLabel(imageName: "play.circle.fill", label: "Home")
                }
            ContentView()
                .tabItem {
                    TabLabel(imageName: "rectangle.stack.fill", label: "Certificate")
                }
        }
        .edgesIgnoringSafeArea(.top)
        .tableStyle(.automatic)
    }
}

// MARK: PREVIEW

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

struct TabLabel: View {
    let imageName: String
    let label: String

    var body: some View {
        HStack {
            Image(systemName: imageName)
            Text(label)
        }
    }
}
