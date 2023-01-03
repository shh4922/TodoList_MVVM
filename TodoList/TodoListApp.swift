//
//  TodoListApp.swift
//  TodoList
//
//  Created by HyeonHo on 2023/01/02.
//

import SwiftUI


/***
 mvvm
 
 Model  - data  point
 View - UI
 ViewModel - manages Models for View
 
 */


@main
struct TodoListApp: App {
    
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView(){
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
