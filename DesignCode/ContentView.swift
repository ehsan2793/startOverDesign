//
//  ContentView.swift
//  DesignCode
//
//  Created by Ehsan Rahimi on 8/26/23.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: 20)

            BackCardView()
                .background(Color("card4"))
                .shadow(radius: 20)
                .cornerRadius(20)
                .offset(x: 0, y: -40)
                .scaleEffect(0.90)
                .rotationEffect(Angle(degrees: 10))
                .rotation3DEffect(Angle(degrees: 5), axis: (x: 10.0, y: 0.0, z: 0))
                .blendMode(.hardLight)

            BackCardView()
                .background(Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: -20)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: 5))
                .rotation3DEffect(Angle(degrees: 5), axis: (x: 10.0, y: 0.0, z: 0))
                .blendMode(.hardLight)

            CardView()
                .blendMode(.hardLight)

            BottomCardView()
                .blur(radius: 20)
        } //: ZSTACK
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackCardView: View {
    var body: some View {
        Spacer()
            .frame(width: 340, height: 220)
    }
}

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

struct BottomCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 3)
                .frame(width: 40, height: 5)
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
