//
//  AddView.swift
//  TodoList
//
//  Created by HyeonHo on 2023/01/02.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type someThing",text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height : 50)
                    .background(Color(.gray))
                    .cornerRadius(10)
                
                Button(action: {
                }, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .frame(height : 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .font(.headline)
                        
                        .cornerRadius(10)
                    
                    
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an Item!!")
        
    }
}




struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        
    }
}
