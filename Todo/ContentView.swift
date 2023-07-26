//
//  ContentView.swift
//  Todo
//
//  Created by jr on 22/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var todoManager = TodoManager()
    
    var body: some View {
        TabView{
            MainTodoListView(todoManager: todoManager)
                .tabItem {
                    Label("Todos", systemImage: "checkmark.circle.fill")
                }
            
            HowManyMoreView(todoManager: todoManager)
                .tabItem {
                    Label("How many more?", systemImage: "number.circle")
            }
            
        }
    }
}

#Preview {
    ContentView()
}
