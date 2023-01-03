//
//  AddView.swift
//  TodoList
//
//  Created by HyeonHo on 2023/01/02.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var pressentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textFieldText: String = ""
    
    @State var alterTitle : String  = ""
    @State var showAlert : Bool = false
    
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type someThing",text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height : 50)
                    .background(Color(.gray))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed
                , label: {
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
        .alert(isPresented: $showAlert, content: getAlert)
        
    }
    
    func saveButtonPressed(){
        if textIsAppropriate(){
            listViewModel.addItem(title: textFieldText)
            pressentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate( ) -> Bool{
        if textFieldText.count < 3 {
            alterTitle = "너 할일이 너무 글자가 작아 더길게 해"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alterTitle))
    }
}




struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }.environmentObject(ListViewModel())
        
    }
}
