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
        VStack(spacing: 50) {
            RectangleButton()

            CircleButton()
        } //: VSTACK
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(color2)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    Buttons()
}

struct RectangleButton: View {
    let color1 = Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1))
    let color2 = Color(#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1))
    @State var tap = false
    @State var press: Bool = false
    var body: some View {
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
                        .background(Color.blue)
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
            .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0), value: tap)
            .animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0), value: press)
    }
}

struct CircleButton: View {
    let color1 = Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1))
    let color2 = Color(#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1))
    @State var tap = false
    @State var press: Bool = false
    var body: some View {
        ZStack {
            Image(systemName: "sun.max")
//                .foregroundStyle(.yellow)
                .font(.system(size: 44, weight: .light))
                .offset(x: press ? -90 : 0, y: press ? -90 : 0)
                .rotation3DEffect(
                    Angle(degrees: press ? 20 : 0),
                    axis: (x: 10, y: -10.0, z: 0.0)
                )
            Image(systemName: "moon")
//                .foregroundStyle(.white)
                .font(.system(size: 44, weight: .light))
                .offset(x: press ? 0 : 90, y: press ? 0 : 90)
                .rotation3DEffect(
                    Angle(degrees: press ? 0 : 20),
                    axis: (x: -10, y: 10.0, z: 0.0)
                )
        }
        .frame(width: 100, height: 100)
        .background(
            ZStack {
                Circle()
                    .shadow(color: Color(#colorLiteral(red: 0.7256438732, green: 0.7787529826, blue: 0.8831245303, alpha: 1)), radius: press ? 10 : 3, x: press ? 5 : -5, y: press ? 5 : -5)
                Circle()
                    .shadow(color: Color(red: 1.0, green: 1.0, blue: 1.0), radius: 3, x: press ? -3 : 3, y: press ? -3 : 3)
                LinearGradient(gradient: Gradient(colors: [Color(press ? #colorLiteral(red: 0.9019607843, green: 0.9294117647, blue: 0.9882352941, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(press ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.9019607843, green: 0.9294117647, blue: 0.9882352941, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
            }
        )

        .clipShape(Circle())
        .shadow(color: press ? Color(#colorLiteral(red: 0.7450980392, green: 0.8, blue: 0.8980392157, alpha: 1)) : Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), radius: 20, x: -20, y: -20)
        .shadow(color: press ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.7294117647, green: 0.7843137255, blue: 0.8941176471, alpha: 1)), radius: 20, x: 20, y: 20)
        .scaleEffect(tap ? 1.2 : 1)
        .gesture(
            LongPressGesture(minimumDuration: 0.5)
                .onChanged { _ in
                    tap = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        tap = false
                    }
                }
                .onEnded { _ in
                    press.toggle()
                }
        )
        .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0), value: tap)
        .animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0), value: press)
    }
}
