//
//  CourseList.swift
//  DesignCode
//
//  Created by Ehsan Rahimi on 9/16/23.
//

import SwiftUI

struct CourseList: View {
    // MARK: - PROPERTIES

    // MARK: - BODY

    var body: some View {
        VStack {
            CourseView()
        }
    }
}

// MARK: PREVIEW

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CourseView: View {
    @State var show = false
    var logo = #imageLiteral(resourceName: "Logo1")
    var bigImg = #imageLiteral(resourceName: "Card2")
    var backgroundColor = Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("SwiftUI Advanced")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)

                    Text("20 Sections")
                        .foregroundColor(.white.opacity(0.7))
                } //: VSTACK
                Spacer()

                Image(uiImage: logo)
            } //: HSTACK

            Spacer()

            Image(uiImage: bigImg)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .frame(height: 140, alignment: .top)
        } //: VSTACK
        .padding(show ? 30 : 20)
        .padding(.top, show ? 30 : 0)
//        .frame(width: show ? screen.width : screen.width - 60, height: show ? screen.height : 280)
        .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? .infinity : 280)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: backgroundColor.opacity(0.3), radius: 20, x: 0, y: 20)
        .onTapGesture {
            withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)) {
                show.toggle()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
