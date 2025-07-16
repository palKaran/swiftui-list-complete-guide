//
//  Task.swift
//  SwiftUI List
//
//  Created by Karan Pal on 17/07/25.
//
import Foundation

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
    var isPinned: Bool = false
    
    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
