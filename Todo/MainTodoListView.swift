//
//  MainTodoListView.swift
//  Todo
//
//  Created by jr on 26/07/2023.
//

import SwiftUI

struct MainTodoListView: View {
    
    @State private var showAddSheet = false
    @State private var showConfirmAlert = false
    @ObservedObject var todoManager: TodoManager
    @State private var searchTerm = ""
    
    var body: some View {
        NavigationStack {
            List {
                
                ForEach($todoManager.todos, id: \.id, editActions: [.all]) { $todo in
                    NavigationLink {
                        TodoDetailView(todo: $todo)
                    } label: {
                        HStack {
                            Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                                .onTapGesture {
                                    todo.isCompleted.toggle()
                                }
                            VStack {
                                Text(todo.title)
                                    .strikethrough(todo.isCompleted)
                                if !todo.subtitle.isEmpty {
                                    Text(todo.subtitle)
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                        .strikethrough(todo.isCompleted)
                                }
                            }
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    todoManager.todos.remove(atOffsets: indexSet)
                })
                .onMove(perform: { originalOffsets, newOffset in
                    todoManager.todos.move(fromOffsets: originalOffsets, toOffset: newOffset)
                })
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItemGroup {
                    
                    Button {
                        showConfirmAlert = true
                    } label: {
                        Image(systemName: "list.bullet.clipboard.fill")
                    }
                    
                    Button {
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddSheet) {
                NewTodoView(sourceArray: $todoManager.todos)
            }
            .alert("Load sample data? Warning: This cannot be undone!", isPresented: $showConfirmAlert) {
                Button("Replace", role: .destructive) {
                    todoManager.loadSampleData()
                }
            }
        }
    }
}

#Preview {
    MainTodoListView(todoManager: TodoManager())
}
