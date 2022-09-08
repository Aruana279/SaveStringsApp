//
//  ContentView.swift
//  SavingStringsApp
//
//  Created by Aruzhan Koshkarova on 9/7/22.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = UserDefaults.standard.string(forKey: "TEXT_KEY") ?? ""
    @State var inputText: String = ""
    
    var body: some View {
        Form{
            Section(header: Text("Input")){
                TextField("Add some string here", text:$inputText)
            }
            
            Section(header: Text("Letter Count:")){
                let charCount = inputText.filter{
                    $0 != " "}.count
                
                if (charCount>30){
                    Text(String(charCount)).foregroundColor(.red)
                } else{
                    inputText == "" ? Text("Empty") : Text(String(charCount))
                }
            }
            
            Section(header: Text("Actions:")){
                Button("Save Data"){
                    UserDefaults.standard.set(inputText, forKey: "TEXT_KEY") 
                    text = inputText
                    print("Saved Value: \(inputText)")
                }
            }
            
            Section(header: Text("Saved Data")){
                Text(text).lineLimit(5)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
