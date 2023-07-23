//
//  TodoDetailView.swift
//  Todo
//
//  Created by jr on 23/07/2023.
//

import SwiftUI

struct TodoDetailView: View {
    
    @Binding var todo: Todo
    
    var body: some View {
        Form {
            TextField("Title", text: $todo.title)
            TextField("Subtitle", text: $todo.subtitle)
                .foregroundColor(.gray)
            Toggle("Completed?", isOn: $todo.isCompleted)
        }
        .navigationTitle("Todo Detail")
    }
}

#Preview {
    TodoDetailView(todo: .constant(Todo(title: "Feed demo cat")))
}
