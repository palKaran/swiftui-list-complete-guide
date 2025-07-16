//
//  PinnedTaskListView.swift
//  SwiftUI List
//
//  Created by Karan Pal on 16/07/25.
//
import SwiftUI

struct PinnedTaskListView: View {
    @State private var tasks = [
        Task(title: "Learn SwiftUI Lists"),
        Task(title: "Build an awesome app"),
        Task(title: "Ship to App Store"),
        Task(title: "Celebrate success"),
        Task(title: "Write documentation"),
        Task(title: "Add tests")
    ]
    
    var sortedTasks: [Task] {
        tasks.sorted { first, second in
            if first.isPinned && !second.isPinned {
                return true
            } else if !first.isPinned && second.isPinned {
                return false
            } else {
                return false // Maintain original order within pinned/unpinned groups
            }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sortedTasks) { task in
                    TaskRowView(task: binding(for: task))
                }
                .onDelete(perform: deleteTask)
            }
            .navigationTitle("Tasks")
            .toolbar {
                EditButton()
            }
        }
    }
    
    func binding(for task: Task) -> Binding<Task> {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else {
            fatalError("Task not found")
        }
        return $tasks[index]
    }
    
    func deleteTask(at offsets: IndexSet) {
        let tasksToDelete = offsets.map { sortedTasks[$0] }
        for task in tasksToDelete {
            tasks.removeAll { $0.id == task.id }
        }
    }
}

struct TaskRowView: View {
    @Binding var task: Task
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(task.isCompleted ? .green : .gray)
                .onTapGesture {
                    task.isCompleted.toggle()
                }
            
            Text(task.title)
                .strikethrough(task.isCompleted)
                .font(.body)

            Spacer()
            
            if task.isPinned {
                Image(systemName: "pin.fill")
                    .foregroundColor(.orange)
            }
        }
        .padding(.vertical, 4)
        .swipeActions(edge: .trailing) {
            Button(role: .destructive) {
                // Delete action would be handled by parent
            } label: {
                Label("Delete", systemImage: "trash")
            }
            
            Button {
                task.isPinned.toggle()
            } label: {
                Label(task.isPinned ? "Unpin" : "Pin", 
                      systemImage: task.isPinned ? "pin.slash" : "pin")
            }
            .tint(.orange)
        }
    }
}

#Preview {
    PinnedTaskListView()
}
