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
    @State var showUpdate = false

    // MARK: - BODY

    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28, weight: .bold))

                Spacer()

                AvatarView(showProfile: $showProfile)
                Button(
                    action: {
                        showUpdate.toggle()
                    },
                    label: {
                        Image(systemName: "bell")
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .medium))
                            .frame(width: 36, height: 36)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                    }
                )
                .sheet(isPresented: $showUpdate) {
                    UpdateList()
                }
            } //: HSTACK
            .padding(.horizontal)
            .padding(.top, 30)
            .padding(.leading, 14)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20.0) {
                    ForEach(sectionData) { data in
                        GeometryReader { proxy in
                            SectionView(data: data)
                                .rotation3DEffect(
                                    Angle(degrees: Double(proxy.frame(in: .global).minX - 30) / -20),
                                    axis: (x: 0, y: 10.0, z: 0)
                                )
                        }
                        .frame(width: 275, height: 275)
                    }
                } //: HSTACK
                .padding(30)
                .padding(.bottom, 30)
            }

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

struct SectionView: View {
    @State var data: Section
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(data.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)

                Spacer()

                Image(data.logo)
            } //: HSTACK
            Text(data.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)

            data.image
                .resizable()
                .scaledToFit()
                .frame(width: 210)
        } //: VSTACK
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(data.color)
        .cornerRadius(30)
        .shadow(color: data.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}

let sectionData = [
    Section(title: "Prototype designs in SwiftUI", text: "18 Sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card4")), color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))),
    Section(title: "Build a SwiftUI app", text: "20 Sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Background1")), color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))),
    Section(title: "SwiftUI Advanced", text: "20 Sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card2")), color: Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))),
]
