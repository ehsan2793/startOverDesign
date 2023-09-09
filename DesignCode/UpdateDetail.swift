//
//  UpdateDetail.swift
//  DesignCode
//
//  Created by Ehsan Rahimi on 9/9/23.
//

import SwiftUI

struct UpdateDetail: View {
    // MARK: - PROPERTIES

    var update: Update = updateData[1]

    // MARK: - BODY

    var body: some View {
        List {
            VStack(spacing: 20.0) {
                Image(update.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                
                Text(update.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
            } //: VSTCK
            .navigationTitle(update.title)
        }
        .listStyle(.plain)
    }
}

// MARK: PREVIEW

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {

            UpdateDetail()
    }
}
