//
//  TaskListView.swift
//  SwiftUI List
//
//  Created by Karan Pal on 16/07/25.
//
import SwiftUI

struct TaskListView: View {
    @State private var tasks = [
        Task(title: "Learn SwiftUI Lists"),
        Task(title: "Build an awesome app"),
        Task(title: "Ship to App Store", isCompleted: true)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(tasks) { task in
                    HStack {
                        Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(task.isCompleted ? .green : .gray)
                        Text(task.title)
                            .strikethrough(task.isCompleted)
                        Spacer()
                        if task.isPinned {
                            Image(systemName: "pin.fill")
                                .foregroundColor(.orange)
                        }
                    }
                    .padding(.vertical, 2)
                }
            }
            .navigationTitle("Tasks")
        }
    }
}

#Preview {
    TaskListView()
}
