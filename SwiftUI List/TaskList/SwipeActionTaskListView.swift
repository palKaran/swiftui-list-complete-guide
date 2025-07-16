//
//  SwipeActionTaskListView.swift
//  SwiftUI List
//
//  Created by Karan Pal on 16/07/25.
//
import SwiftUI

struct SwipeActionTaskListView: View {
    @State private var tasks = [
        Task(title: "Learn SwiftUI Lists"),
        Task(title: "Build an awesome app"),
        Task(title: "Ship to App Store"),
        Task(title: "Celebrate success")
    ]

    var body: some View {
        NavigationView {
            List {
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
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            if let index = tasks.firstIndex(where: { $0.id == task.id }) {
                                tasks.remove(at: index)
                            }
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
                    .swipeActions(edge: .leading) {
                        Button {
                            task.isCompleted.toggle()
                        } label: {
                            Label(task.isCompleted ? "Incomplete" : "Complete",
                                  systemImage: task.isCompleted ? "xmark.circle" : "checkmark.circle")
                        }
                        .tint(task.isCompleted ? .gray : .green)
                    }
                }
                .onDelete(perform: deleteTask)
                .onMove(perform: moveTask)
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

    func moveTask(from source: IndexSet, to destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    SwipeActionTaskListView()
}
