//
//  AddView.swift
//  TodoList
//
//  Created by Grant Watson on 4/27/22.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var alertTitle = ""
    @State var alertMessage = ""
    @State var showAlert = false
    
    @State var todoItem = ""
    
    var body: some View {
        ScrollView {
            TextField("What's next on the agenda?", text: $todoItem)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
            
            Button("Save") {
                saveItem()
            }
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .cornerRadius(10)
            
        }
        .padding(14)
        .navigationTitle("Add New Item")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveItem() {
        if textIsAppropriate() {
            listViewModel.addItem(title: todoItem)
            dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if todoItem.count < 3 {
            alertTitle = "Whoa there! Don't you think you need more details?"
            alertMessage = "Your todo item must be at least 3 characters."
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle), message: Text(alertMessage))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
