//
//  NewTodoView.swift
//  Todo
//
//  Created by jr on 23/07/2023.
//

import SwiftUI

struct NewTodoView: View {
    
    @State private var todoTitle = ""
    @State private var todoSubtitle = ""
    @Binding var sourceArray: [Todo]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section("Info") {
                TextField("Title", text: $todoTitle)
                TextField("Subtitle", text: $todoSubtitle)
            }
            
            Section("Actions") {
                Button("Save") {
                    let todo = Todo(title: todoTitle, subtitle: todoSubtitle)
                    sourceArray.append(todo)
                    dismiss()
                }
                Button("Cancel", role: .destructive) {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NewTodoView(sourceArray: .constant([]))
}
