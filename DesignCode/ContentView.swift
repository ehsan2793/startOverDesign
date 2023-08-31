//
//  ContentView.swift
//  DesignCode
//
//  Created by Ehsan Rahimi on 8/26/23.
//

import SwiftUI
struct ContentView: View {
    // MARK: - PROPERTIES

    @State var show: Bool = false
    @State var viewState: CGSize = .zero

    // MARK: - BODY

    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)

            BackCardView()
                .background(show ? Color("card3") : Color("card4"))
                .shadow(radius: 20)
                .cornerRadius(20)
                .offset(x: 0, y: show ? -400 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.90)
                .rotationEffect(Angle(degrees: show ? 0 : 10))
                .rotation3DEffect(Angle(degrees: 5), axis: (x: 10.0, y: 0.0, z: 0))
                .blendMode(.hardLight)
//                .animation(.easeIn(duration: 0.4), value: show)

            BackCardView()
                .background(show ? Color("card4") : Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 0 : 5))
                .rotation3DEffect(Angle(degrees: 5), axis: (x: 10.0, y: 0.0, z: 0))
                .blendMode(.hardLight)

            CardView()
                .offset(x: viewState.width, y: viewState.height)
                .blendMode(.hardLight)
                .onTapGesture {
                    withAnimation(Animation.spring()) {
                        show.toggle()
                    }
                }
                .gesture(
                    DragGesture()
                    
                        .onChanged { value in
                            viewState = value.translation
                            show = true
                        }
                        .onEnded { _ in
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.3, blendDuration: 0)) {
                                viewState = .zero
                                show = false
                            }
                        }
                )

            BottomCardView()
                .blur(radius: show ? 20 : 0)
        } //: ZSTACK
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - BackCardView

struct BackCardView: View {
    var body: some View {
        Spacer()
            .frame(width: 340, height: 220)
    }
}

// MARK: - CardView

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("Certification")
                        .foregroundColor(Color("accent"))
                } //: vstack
                Spacer()
                Image("Logo1")
            } //: HSTACK
            .padding(20)

            Image("Card1")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 110, alignment: .top)
        } //: VSTACK
        .frame(width: 340.0, height: 220.0)
        .background(Color.black)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}

// MARK: - TitleView

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()

            Image("Background1")

            Spacer()
        }
    }
}

// MARK: - BottomCardView

struct BottomCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 3)
                .frame(width: 60, height: 5)
                .opacity(0.1)

            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)

            Spacer()
        } //: VSTACK
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(x: 0, y: 500)
    }
}
