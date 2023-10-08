//
//  RingView.swift
//  DesignCode
//
//  Created by Ehsan Rahimi on 9/9/23.
//

import SwiftUI

struct RingView: View {
    // MARK: - PROPERTIES

    var color1 = Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
    var color2 = Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
    var width: CGFloat = 44
    var height: CGFloat = 44
    var percent: CGFloat = 82
    @Binding var show: Bool
    var progress: CGFloat {
        1 - percent / 100
    }

    var muliplier: CGFloat {
        width / 44
    }

    // MARK: - BODY

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * muliplier))
                .frame(width: width, height: height)
                
            Circle()
                .trim(from: show ? progress : 1, to: 1)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .topTrailing, endPoint: .bottomLeading),
                    style: StrokeStyle(lineWidth: 5 * muliplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0)
                )
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .frame(width: width, height: height)
                .shadow(color: color2.opacity(0.1), radius: 3 * muliplier, x: 0, y: 3 * muliplier)
                
                
            Text("\(Int(percent))%")
                .font(.system(size: 14 * muliplier))
                .fontWeight(.bold)
            
        }
    }
}

// MARK: PREVIEW

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: .constant(true))
    }
}
