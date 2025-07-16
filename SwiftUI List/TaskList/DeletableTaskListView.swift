//
//  DeletableTaskListView.swift
//  SwiftUI List
//
//  Created by Karan Pal on 16/07/25.
//
import SwiftUI

struct DeletableTaskListView: View {
    @State private var tasks = [
        Task(title: "Learn SwiftUI Lists"),
        Task(title: "Build an awesome app"),
        Task(title: "Ship to App Store"),
        Task(title: "Celebrate success")
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
                    }
                    .padding(.vertical, 2)
                }
                .onDelete(perform: deleteTask)
            }
            .navigationTitle("Tasks")
            .toolbar {
                EditButton()
            }
        }
    }
    
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

#Preview {
    DeletableTaskListView()
}
