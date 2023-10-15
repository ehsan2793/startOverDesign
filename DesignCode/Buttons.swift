//
//  Buttons.swift
//  DesignCode
//
//  Created by Ehsan Rahimi on 10/14/23.
//

import SwiftUI

struct Buttons: View {
    let color1 = Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1))
    let color2 = Color(#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1))
    var body: some View {
        VStack {
            Text("Button")
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .frame(width: 200, height: 60)
                .background(
                    ZStack {
                        color1
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .foregroundColor(.white)
                            .blur(radius: 4)
                            .offset(x: -8, y: -8)

                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9019607843, green: 0.9294117647, blue: 0.9882352941, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .padding(2)
                            .blur(radius: 2)
                    }
                )
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .shadow(color: color1, radius: 20, x: 20, y: 20)
                .shadow(color: .white, radius: 20, x: -20, y: -20)
        } //: VSTACK
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(color2)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    Buttons()
}
