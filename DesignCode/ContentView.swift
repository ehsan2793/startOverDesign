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
            BottomCardView()
                .frame(width: 280, height: 220)
                .background(Color.orange)
                .shadow(radius: 20)
                .cornerRadius(20)
                .offset(x: 0, y: -40)
            
            BottomCardView()
                .frame(width: 300, height: 220)
                .background(Color.blue)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: -20)

            CardView()
        } //: ZSTACK
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BottomCardView: View {
    var body: some View {
        Spacer()
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
