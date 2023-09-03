//
//  HomeView.swift
//  DesignCode
//
//  Created by Ehsan Rahimi on 9/2/23.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTIES

    @Binding var showProfile: Bool

    // MARK: - BODY

    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28, weight: .bold))

                Spacer()

                AvatarView(showProfile: $showProfile)
            } //: HSTACK
            .padding(.horizontal)
            .padding(.top, 30)

            Spacer()
        } //: VSTACK
    }
}

// MARK: PREVIEW

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}
