//
//  CoursesViewModel.swift
//  SwiftUIJsonFetching
//
//  Created by Zerone on 30/09/19.
//  Copyright © 2019 Thobio. All rights reserved.
//

import Foundation
class CoursesViewModel: ObservableObject {
    
    @Published var courses: [Course] = [
        .init(name: "Course 1", price: 0),
        .init(name: "Course 2", price: 0),
        .init(name: "Course 3", price: 0)
    ]
    
    func fetchCourses() {
        // fetch json and decode and update some array property
        guard let url = URL(string: apiUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            // make sure to check error / resp
            
            DispatchQueue.main.async {
                do {
                    self.courses = try JSONDecoder().decode([Course].self, from: data!)
                } catch {
                    print("Failed to decode JSON:", error)
                }
            }
            
        }.resume()
    }
    
}
