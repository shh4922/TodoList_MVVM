//
//  ListView.swift
//  TodoList
//
//  Created by HyeonHo on 2023/01/02.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        List{
            ForEach (listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture{
                        withAnimation(.linear){
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
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
        .environmentObject(ListViewModel())
        
    }
}


