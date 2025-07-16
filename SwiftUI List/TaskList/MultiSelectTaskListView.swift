//
//  MultiSelectTaskListView.swift
//  SwiftUI List
//
//  Created by Karan Pal on 16/07/25.
//
import SwiftUI

struct MultiSelectTaskListView: View {
    @State private var tasks = [
        Task(title: "Learn SwiftUI Lists"),
        Task(title: "Build an awesome app"),
        Task(title: "Ship to App Store"),
        Task(title: "Celebrate success"),
        Task(title: "Write documentation"),
        Task(title: "Add tests")
    ]
    
    @State private var selectedTasks: Set<UUID> = []
    
    var body: some View {
        NavigationView {
            List(selection: $selectedTasks) {
                ForEach($tasks) { $task in
                    HStack {
                        Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(task.isCompleted ? .green : .gray)
                            .onTapGesture {
                                task.isCompleted.toggle()
                            }
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
                .onDelete(perform: deleteTask)
                .onMove(perform: moveTask)
            }
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    EditButton()

                    if !selectedTasks.isEmpty {
                        Button("Complete") {
                            completeSelectedTasks()
                        }
                        Button("Delete") {
                            deleteSelectedTasks()
                        }
                        .foregroundColor(.red)
                    }
                }
            }
        }
    }
    
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
    
    func moveTask(from source: IndexSet, to destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    func completeSelectedTasks() {
        for taskId in selectedTasks {
            if let index = tasks.firstIndex(where: { $0.id == taskId }) {
                tasks[index].isCompleted = true
            }
        }
        selectedTasks.removeAll()
    }
    
    func deleteSelectedTasks() {
        tasks.removeAll { selectedTasks.contains($0.id) }
        selectedTasks.removeAll()
    }
}

#Preview {
    MultiSelectTaskListView()
}
