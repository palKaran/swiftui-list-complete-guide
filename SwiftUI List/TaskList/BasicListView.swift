//
//  BasicListView.swift
//  SwiftUI List
//
//  Created by Karan Pal on 16/07/25.
//
import SwiftUI

struct BasicListView: View {
    let items = ["Task 1", "Task 2", "Task 3", "Task 4"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.self) { item in
                    Text(item)
                        .padding(.vertical, 4)
                }
            }
            .navigationTitle("My Tasks")
        }
    }
}

#Preview {
    BasicListView()
}
