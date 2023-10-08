//
//  SwiftUIView.swift
//  DesignCode
//
//  Created by Ehsan Rahimi on 10/2/23.
//

import Combine
import Contentful
import SwiftUI

let client = Client(spaceId: "fulpgclx2bez", accessToken: "VnQ7ep46CRvfGUIJNw7QW8ALU7fqEA83z6zwdircXi8")

func getArray(id: String, compeltion: @escaping ([Entry]) -> Void) {
    let query = Query.where(contentTypeId: id)

    client.fetchArray(of: Entry.self, matching: query) { result in
        switch result {
        case let .success(array):
            DispatchQueue.main.async {
                compeltion(array.items)
            }
        case let .failure(erorr):
            print(erorr)
        }
    }
}

class CourseStore: ObservableObject {
    @Published var courses: [Course] = courseData
    var image = #imageLiteral(resourceName: "Background1")
    var logo = #imageLiteral(resourceName: "Logo1")
    var color = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    init() {
        getArray(id: "course") { items in
            items.forEach { item in
                self.courses.append(Course(
                    title: item.fields["title"] as! String,
                    subtitle: item.fields["subtitle"] as! String,
                    image: self.image,
                    logo: self.logo,
                    color: self.color,
                    show: false))
            }
        }
    }
}
