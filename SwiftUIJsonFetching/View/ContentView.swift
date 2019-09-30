//
//  ContentView.swift
//  SwiftUIJsonFetching
//
//  Created by Zerone on 30/09/19.
//  Copyright © 2019 Thobio. All rights reserved.
//

import SwiftUI

let apiUrl = "https://api.letsbuildthatapp.com/static/courses.json"


struct ContentView: View {
       @ObservedObject var coursesVM = CoursesViewModel()
    var body: some View {
        NavigationView {
            ScrollView {
                         VStack(alignment: .leading) {
                             ForEach(coursesVM.courses) { course in
                                 HStack {
                                     Text(course.name)
                                         .font(.system(size: 20))
                                         .fontWeight(.semibold)
                                     Spacer()
                                     
                                 }.padding(.bottom, 4)
                                 Text("Price: $\(course.price)")
                                 .padding(.bottom, 16)
                             }
                         }.padding(.horizontal, 22)
                             .padding(.top, 8)
                         
                         
                     }.navigationBarTitle("Courses")
                     .navigationBarItems(trailing: Button(action: {
                         print("Fetching json data")
                         
                         self.coursesVM.fetchCourses()
                         
                     }, label: {
                         Text("Fetch Courses")
                     }))
        }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
