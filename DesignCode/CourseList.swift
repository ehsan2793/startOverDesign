//
//  CourseList.swift
//  DesignCode
//
//  Created by Ehsan Rahimi on 9/16/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct CourseList: View {
    // MARK: - PROPERTIES

    @ObservedObject var store = CourseStore()

//    @State var courses = courseData
    @State var active = false
    @State var activeIndex = -1

    // MARK: - BODY

    var body: some View {
        ZStack {
            Color.black.opacity(active ? 0.5 : 0)
                .edgesIgnoringSafeArea(.all)

            ScrollView(showsIndicators: false) {
                VStack(spacing: 30.0) {
                    Text("Courses")
                        .font(.largeTitle)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .top], 30)
                        .blur(radius: active ? 20 : 0)

                    ForEach(store.courses.indices, id: \.self) { index in
                        GeometryReader { geometry in
                            CourseView(
                                show: $store.courses[index].show,
                                active: $active,
                                course: store.courses[index],
                                index: index,
                                activeIndex: $activeIndex
                            )
                            .offset(y: store.courses[index].show ? -geometry.frame(in: .global).minY : 0)
                            .opacity(activeIndex != index && active ? 0 : 1)
                            .scaleEffect(activeIndex != index && active ? 0.5 : 1)
                            .offset(x: activeIndex != index && active ? screen.width : 0)
                        }
                        .frame(height: 280)
                        .frame(maxWidth: store.courses[index].show ? .infinity : screen.width - 60)
                        .zIndex(store.courses[index].show ? 1 : 0)
                    }
                } //: VSTACK
            } //: SCROLL
            .frame(width: screen.width)
            .statusBarHidden(active ? true : false)
        } //: ZSTACK
    }
}

// MARK: PREVIEW

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CourseView: View {
    // MARK: - PROPERTIES

    @Binding var show: Bool
    @Binding var active: Bool
    var course: Course
    var index: Int
    @Binding var activeIndex: Int
    @State var activeView: CGSize = .zero

    // MARK: - BODY

    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 30.0) {
                Text("Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.")

                Text("About this course")
                    .font(.title)
                    .bold()

                Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")

                Text("Minimal coding experience required, such as in HTML and CSS. Please note that Xcode 11 and Catalina are essential. Once you get everything installed, it'll get a lot friendlier! I added a bunch of troubleshoots at the end of this page to help you navigate the issues you might encounter.")
            }
            .padding(30)
            .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? .infinity : 280, alignment: .top)
            .offset(y: show ? 460 : 0)
            .background(Color("background2"))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .opacity(show ? 1 : 0)

            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text(course.title)
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)

                        Text(course.subtitle)
                            .foregroundColor(.white.opacity(0.7))
                    } //: VSTACK
                    Spacer()

                    ZStack {
                        Image(uiImage: course.logo)
                            .opacity(show ? 0 : 1)

                        VStack {
                            Image(systemName: "xmark")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .frame(width: 36, height: 36)
                        .background(Color.black)
                        .clipShape(Circle())
                        .opacity(show ? 1 : 0)
                    }
                } //: HSTACK

                Spacer()

                WebImage(url: course.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 140, alignment: .top)
            } //: VSTACK
            .padding(show ? 30 : 20)
            .padding(.top, show ? 30 : 0)
            //        .frame(width: show ? screen.width : screen.width - 60, height: show ? screen.height : 280)
            .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 460 : 280)
            .background(Color(course.color))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color(course.color).opacity(0.3), radius: 20, x: 0, y: 20)

            .onTapGesture {
//                withAnimation(Animation.easeInOut(duration: 0.5)) {
                withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)) {
                    show.toggle()
                    active.toggle()
                    if show {
                        activeIndex = index
                    } else {
                        activeIndex = -1
                    }
                }
            }
//            if show {
//                CourseDetail(course: course, show: $show,active: $active, activeIndex: $activeIndex)
//                    .background(Color.white)
//                    .animation(nil, value: show)
//            }
        } //: ZSTACK

        .frame(height: show ? screen.height : 280)
        .scaleEffect(1 - activeView.height / 1000)
//        .rotation3DEffect(Angle(degrees: activeView.height), axis: (x: 0, y: 10, z: 0))
        .gesture(
            show ?
                DragGesture()
                .onChanged({ value in
                    withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)) {
                        activeView = value.translation
                    }
                    print("here")
                })
                .onEnded({ _ in
                    print("here 2")
                    withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)) {
                        if activeView.height > 50 {
                            show = false
                            active = false
                            activeIndex = -1
                        }
                        activeView = .zero
                    }
                })
                : nil
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var image: URL
    var logo: UIImage
    var color: UIColor
    var show: Bool
}

var courseData = [
    Course(title: "Prototype Designs in SwiftUI", subtitle: "18 Sections", image: URL(string: "image-link")!
           , logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), show: false),
    Course(title: "SwiftUI Advanced", subtitle: "20 Sections", image: URL(string: "image-link")!
           , logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), show: false),
    Course(title: "UI Design for Developers", subtitle: "20 Sections", image: URL(string: "image-link")!
           , logo: #imageLiteral(resourceName: "Logo3"), color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), show: false),
]
