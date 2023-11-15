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
    @State var tap = false
    @State var press: Bool = false
    var body: some View {
        VStack {
            Text("Button")
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .frame(width: 200, height: 60)
                .background(
                    ZStack {
                        press ? color1 : color2
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .foregroundColor(press ? color2 : .white)
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
                .overlay(
                    HStack {
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 24, weight: .light))
                            .foregroundStyle(.white.opacity(press ? 0 : 1))
                            .frame(width: press ? 64 : 54, height: press ? 4 : 50)
                            .background(Color.purple)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .shadow(color: .purple.opacity(0.3), radius: 10, x: 10, y: 10)
                            .offset(x: press ? 70 : -10, y: press ? 16 : 0)

                        Spacer()
                    } //: HSTACK
                )
                .shadow(color: press ? color2 : color1, radius: 20, x: 20, y: 20)
                .shadow(color: press ? color1 : color2, radius: 20, x: -20, y: -20)
                .scaleEffect(tap ? 1.2 : 1)
                .gesture(
                    LongPressGesture(minimumDuration: 0.5)
                        .onChanged { _ in
                            tap = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                tap = false
                            }
                        }
                        .onEnded { _ in
                            press.toggle()
                        }
                )
        } //: VSTACK
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(color2)
        .edgesIgnoringSafeArea(.all)
        .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0), value: tap)
        .animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0), value: press)
    }
}

#Preview {
    Buttons()
}
