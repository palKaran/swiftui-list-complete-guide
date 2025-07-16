# SwiftUI List Complete Guide 2025

A comprehensive demonstration project showcasing advanced SwiftUI List capabilities including swipe actions, drag-to-reorder, multiple selection, and custom pinning functionality.

## 🎯 Overview

This project accompanies the YouTube tutorial **"SwiftUI Lists Complete Guide"** and demonstrates modern List implementation patterns for iOS 15+ development. Each example builds upon the previous one, showing the evolution from basic lists to sophisticated, interactive interfaces.

## 📱 Features Demonstrated

### Core List Functionality
- ✅ Basic List implementation with custom data models
- ✅ Dynamic content with `ForEach` and proper data binding
- ✅ Built-in delete functionality with swipe gestures
- ✅ Drag-to-reorder with smooth animations
- ✅ Edit mode integration with `EditButton()`

### Advanced Interactions
- ✅ Custom swipe actions (leading and trailing)
- ✅ Multiple selection with bulk operations
- ✅ Item pinning system with smart sorting
- ✅ Professional animations and transitions
- ✅ Custom row styling and layouts

### Production-Ready Patterns
- ✅ Proper state management with `@State` and `@Binding`
- ✅ Identifiable data models with UUID
- ✅ Performance-optimized list operations
- ✅ Error handling and edge cases

## 🏗️ Project Structure

```
SwiftUIListGuide/
├── ContentView.swift              # Main navigation
├── Models/
│   └── Task.swift                # Data model with Identifiable
└── TaskList/
    ├── BasicListView.swift       # Foundation concepts
    ├── DeletableTaskListView.swift
    ├── MovableTaskListView.swift
    ├── SwipeActionTaskListView.swift
    ├── MultiSelectTaskListView.swift
    └── PinnedTaskListView.swift  # Complete implementation

```

## 🚀 Getting Started

### Requirements
- iOS 15.0+
- Xcode 13.0+
- Swift 5.5+

### Installation
1. Clone this repository
```bash
git clone https://github.com/palKaran/swiftui-list-complete-guide.git
cd swiftui-list-guide
```

2. Open in Xcode
```bash
open SwiftUIListGuide.xcodeproj
```

3. Build and run on simulator or device

## 📖 Examples Walkthrough

### 1. Basic List Implementation
```swift
// Foundation - Simple list with custom data
struct BasicListView: View {
    let items = ["Task 1", "Task 2", "Task 3"]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                Text(item)
            }
        }
    }
}
```

### 2. Custom Data Models
```swift
// Proper data structure for production apps
struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
    var isPinned: Bool = false
}
```

### 3. Delete Functionality
```swift
// Built-in swipe-to-delete with edit mode
.onDelete(perform: deleteTask)
.toolbar { EditButton() }
```

### 4. Move and Reorder
```swift
// Drag-to-reorder with smooth animations
.onMove(perform: moveTask)

func moveTask(from source: IndexSet, to destination: Int) {
    tasks.move(fromOffsets: source, toOffset: destination)
}
```

### 5. Custom Swipe Actions
```swift
// Professional swipe actions like Mail app
.swipeActions(edge: .trailing, allowsFullSwipe: true) {
    Button(role: .destructive) {
        deleteTask(task)
    } label: {
        Label("Delete", systemImage: "trash")
    }
    
    Button {
        task.isPinned.toggle()
    } label: {
        Label("Pin", systemImage: "pin")
    }
    .tint(.orange)
}
```

### 6. Multiple Selection
```swift
// Bulk operations with professional UI
List(selection: $selectedTasks) {
    ForEach($tasks) { $task in
        TaskRowView(task: $task)
    }
}
```

### 7. Advanced Pinning System
```swift
// Smart sorting with pinned items at top
var sortedTasks: [Task] {
    tasks.sorted { first, second in
        if first.isPinned && !second.isPinned {
            return true
        } else if !first.isPinned && second.isPinned {
            return false
        }
        return false
    }
}
```

## 🎨 Key Implementation Details

### Data Binding Patterns
```swift
// Proper binding for nested data modifications
ForEach($tasks) { $task in
    TaskRowView(task: $task)
}
```

### Performance Optimization
```swift
// Efficient data binding helper
func binding(for task: Task) -> Binding<Task> {
    guard let index = tasks.firstIndex(where: { $0.id == task.id }) else {
        fatalError("Task not found")
    }
    return $tasks[index]
}
```

## 🧪 Testing the Examples

### Basic Functionality
1. Run the app and navigate to "Basic List"
2. Observe static list rendering
3. Test scroll performance

### Interactive Features
1. Navigate to "Deletable Tasks"
2. Swipe left on any row to delete
3. Tap "Edit" button for multi-delete mode

### Advanced Interactions
1. Go to "Swipe Actions Example"
2. Swipe right for complete/incomplete
3. Swipe left for delete/pin actions
4. Test full swipe gestures

### Multiple Selection
1. Open "Multi-Select Tasks"
2. Tap "Edit" to enter selection mode
3. Select multiple items
4. Use bulk action buttons

## 📚 Learning Outcomes

After exploring this project, you'll understand:

- **Modern List Architecture** - How to structure lists for maintainability
- **State Management** - Proper use of `@State`, `@Binding`, and data flow
- **Interactive Patterns** - Professional swipe actions and edit modes
- **Performance Best Practices** - Efficient list updates and animations
- **User Experience** - Creating intuitive, iOS-native list interactions

## 🔧 Customization

### Adding New Task Properties
```swift
struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
    var isPinned: Bool = false
    var dueDate: Date?        // Add new properties
    var priority: Priority    // Custom enum
}
```

### Custom Swipe Actions
```swift
// Extend with your own actions
.swipeActions(edge: .trailing) {
    Button("Archive") { archiveTask(task) }
        .tint(.blue)
    Button("Share") { shareTask(task) }
        .tint(.green)
}
```

## 🎬 Related Content

- **YouTube Tutorial**: [SwiftUI Lists Complete Guide - Coming Soon](Coming Soon)
- **Blog Post**: [Advanced SwiftUI List Patterns](https://swift-pal.com/swiftui-list-complete-guide-move-delete-pin-and-custom-actions-in-2025-b2efc9cb3fc9)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License

## 🔗 Connect

- **YouTube**: [@swift-pal](https://youtube.com/@swift-pal)
- **Twitter**: [@swift_karan](https://twitter.com/swift_karan)
- **LinkedIn**: [Karan Pal](https://www.linkedin.com/in/karan-pal)
- **Medium**: [@karan.pal](https://medium.com/@karan.pal)

---

⭐ **Star this repository** if you found it helpful!

**Questions?** Open an issue or reach out on social
