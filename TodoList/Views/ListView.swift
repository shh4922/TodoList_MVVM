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
                        //withAnimation ------------------------------ 애니메이션을 넣는건가..?
                    }//.onTapGesture는 각 행을 tap하였을때, 즉 클릭과같은 이벤트가 발생시, 수행하는것.
                //ListRowView -> 새로 정의한 View
                // item을 받아서 그 아이탬을 그려주는 struct
            }
            /**
             forEach => View에서 반복을 수행할때 쓰는것 같음. listView.items을 받아서, 그것을 item으로 치환,
             그후, item의 개수만큼 수행하는데 0,1,2,...item.count만큼 수행하는것 같음.
                
             */
            //onDelete => 생명주기중 하나로, View가 사라질시, 수행
            .onDelete(perform: listViewModel.deleteItem)
            //onMove => ------------------------------
            .onMove(perform: listViewModel.moveItem)
        }
        //약간 recyclerView느낌, swift로 치면 TableView라고 하는데 swiftUI로 시작해서 잘 모르겠음.. 비슷한거같긴함
        .listStyle(PlainListStyle())
        //리스트의 스타일을 지정
        .navigationTitle("Todo List 📝")
        //리스트의 NavTitle을 지정
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("추가",destination: AddView())
            )
        // .navigationBarItems() => -----------------------------
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


