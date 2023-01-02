//
//  ListView.swift
//  TodoList
//
//  Created by HyeonHo on 2023/01/02.
//

import SwiftUI

struct ListView: View {
    
    @State var items : [String] = [
        "1",
        "2",
        "3"
    ]
    
    var body: some View {
        List{
            ForEach (items,id: \.self) {item in
                ListRowView(title: item)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("추가",destination: AddView())
            )
    }
}



//Preview
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(){
            ListView()
        }
        
    }
}


