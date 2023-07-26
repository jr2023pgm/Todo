//
//  HowManyMoreView.swift
//  Todo
//
//  Created by jr on 26/07/2023.
//

import SwiftUI

struct HowManyMoreView: View {
    
    @ObservedObject var todoManager: TodoManager
    
    var body: some View {
        VStack {
            Text("You have:")
                .font(.largeTitle)
            Text("\(todoManager.numTodosLeft)")
                .font(.system(size: 140))
                .foregroundColor(.accentColor)
                .padding()
            Text(todoManager.numTodosLeft == 1 ? "todo left.": "todos left.")
                .font(.largeTitle)
            Text("You have completed ^[\(todoManager.numTodosDone) todos](inflect: true). Good job.")
                .padding(.top)
         }
    }
}

#Preview {
    HowManyMoreView(todoManager: TodoManager())
}
