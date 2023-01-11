//
//  ListRowView.swift
//  TodoList
//
//  Created by HyeonHo on 2023/01/02.
//

import SwiftUI

struct ListRowView: View {
    
    let item : ItemModel
    
    var body: some View {
        HStack{
            // 아이탬을 받아왔을때 했는지 안했는지의 여부를 확인후, 빈원을 만들지, check된 원을 만들지
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            
            //할일이 들어가는곳, 넘겨받은 item의 title을 그려주는 역할
            Text(item.title)  
            Spacer()
        }
        
        .font(.title2)
        .padding(.vertical, 8)
    }
}



struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "1", isCompleted: false)
    static var item2 = ItemModel(title: "2", isCompleted: true)
    static var item3 = ItemModel(title: "3", isCompleted: false)
    
    static var previews: some View {
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
            ListRowView(item: item3)
        }
        .previewLayout(.sizeThatFits)
    }
}
