//
//  UpdateList.swift
//  DesignCode
//
//  Created by Ehsan Rahimi on 9/8/23.
//

import SwiftUI

struct UpdateList: View {
    // MARK: - PROPERTIES

    let textColor = Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
    @ObservedObject var store = UpdateStore()

    // MARK: - FUNCTIONS

    func addUpdate() {
        store.updates.append(Update(image: "Card1", title: "SwiftUI Advanced", text: "Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.", date: "JAN 1"))
    }

    // MARK: - BODY

    var body: some View {
        NavigationView {
            List {
                ForEach(store.updates) { update in
                    NavigationLink {
                        UpdateDetail(update: update)
                    } label: {
                        HStack {
                            Image(update.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .background(Color("primary"))
                                .cornerRadius(20)
                                .padding(.trailing, 4)

                            VStack(alignment: .leading, spacing: 8.0) {
                                Text(update.title)
                                    .font(.system(size: 20, weight: .bold))

                                Text(update.text)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(textColor)

                                Text(update.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            } //: VSTACK
                        } //: HSTACK
                        .padding(.vertical, 8)
                    }
                } //: LOOP
                .onDelete { index in
                    store.updates.remove(at: index.first!)
                }
                
                .onMove { index, destination in
                    store.updates.move(fromOffsets: index, toOffset: destination)
                }
            } //: LIST
            .listStyle(.plain)
            .navigationTitle("Updates")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Add Update") {
                        addUpdate()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            } //: TOOLBAR
        } //: NAVIGATION
    }
}

// MARK: PREVIEW

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}
