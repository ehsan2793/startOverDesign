//
//  Home.swift
//  DesignCode
//
//  Created by Ehsan Rahimi on 9/2/23.
//

import SwiftUI

struct Home: View {
    // MARK: - PROPERTIES

    @State var showProfile = false
    @State var showContent = false
    @State var viewState: CGSize = .zero
    var backgroundColor = Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))

    // MARK: - BODY

    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)

            HomeView(showProfile: $showProfile, showContent: $showContent)
                .padding(.top, 44)
                .background(
                    VStack {
                        LinearGradient(gradient: Gradient(colors: [Color("background2"), Color.white]), startPoint: .top, endPoint: .bottom)
                            .frame(height: 200)
                        Spacer()
                    }
                    .background(Color.white)
                )
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                .offset(y: showProfile ? -450 : 0)
                .rotation3DEffect(Angle(degrees: showProfile ? Double(viewState.height / 10) - 10.0 : 0), axis: (x: 10.0, y: 0, z: 0))
                .scaleEffect(showProfile ? 0.9 : 1)
                .edgesIgnoringSafeArea(.all)

            MenuView()
                .background(Color.black.opacity(0.001))
                .offset(y: showProfile ? 0 : screen.height)
                .offset(y: viewState.height)
                .onTapGesture {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)) {
                        showProfile = false
                    }
                }
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            if viewState.height <= -375 {
                                viewState.height = -375
                            } else {
                                viewState = value.translation
                            }

                        })
                        .onEnded({ _ in
                            withAnimation {
                                if viewState.height > 50 {
                                    showProfile = false
                                }
                                viewState = .zero
                            }
                        })
                )
            if showContent {
                Color.white.edgesIgnoringSafeArea(.all)

                ContentView()

                Image(systemName: "xmark")
                    .frame(width: 36, height: 36)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .clipShape(Circle())
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    .padding()
                    .animation(Animation.easeInOut, value: showContent)
                    .onTapGesture {
                        showContent = false
                    }
            }
        } //: ZSTACK
    }
}

// MARK: PREVIEW

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct AvatarView: View {
    @Binding var showProfile: Bool
    var body: some View {
        Button {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)) {
                showProfile.toggle()
            }
        } label: {
            Image("Avatar")
                .renderingMode(.original)
                .resizable()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
        }
    }
}

let screen = UIScreen.main.bounds
