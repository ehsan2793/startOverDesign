//
//  HomeView.swift
//  DesignCode
//
//  Created by Ehsan Rahimi on 9/2/23.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTIES

    @State var animate = false
    @Binding var showProfile: Bool
    @State var showUpdate = false

    // MARK: - BODY

    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .modifier(CustomeFontModifier(size: 28))

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
                WatchRingsView(animate: $animate)
                    .padding(.horizontal, 30)
                    .padding(.bottom, 30)
            }

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

func giveMeColor() -> Color {
    let colors: [Color] = [Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)), Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)), Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)), Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)), Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))]

    return colors.randomElement()!
}

struct WatchRingsView: View {
    @Binding var animate: Bool
    var body: some View {
        HStack {
            HStack(spacing: 12.0) {
                RingView(color1: giveMeColor(), color2: giveMeColor(), width: 44, height: 44, percent: 18, show: $animate)
                    .onAppear {
                        withAnimation(Animation.easeInOut.delay(0.3)) {
                            animate = true
                        }
                    }

                VStack(alignment: .leading, spacing: 4.0) {
                    Text("6 minutes left")
                        .fontWeight(.bold)
                        .modifier(FontModifier(style: .subheadline))

                    Text("Watched 10 mins today")
                        .modifier(FontModifier(style: .caption))
                }
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())

            HStack(spacing: 12.0) {
                RingView(color1: giveMeColor(), color2: giveMeColor(), width: 44, height: 44, percent: 58, show: $animate)
                    .onAppear {
                        withAnimation(Animation.easeInOut.delay(0.3)) {
                            animate = true
                        }
                    }
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())

            HStack(spacing: 12.0) {
                RingView(color1: giveMeColor(), color2: giveMeColor(), width: 44, height: 44, percent: 87, show: $animate)
                    .onAppear {
                        withAnimation(Animation.easeInOut.delay(0.3)) {
                            animate = true
                        }
                    }
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
        }
    }
}
