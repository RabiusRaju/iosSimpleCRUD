//
//  DetailView.swift
//  SimpleCrud
//
//  Created by Md. Rabius Sani Raju on 21/2/23.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationModel
    let item : PostModel
    @State var title = ""
    @State var post = ""
    var body: some View {
        ZStack{
            Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                Text("Create new Post")
                    .font(Font.system(size: 16, weight: .bold))
                
                
                TextField("Title", text: $title)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(6)
                    .padding(.bottom)
                
                TextField("Write Something....", text: $post)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(6)
                    .padding(.bottom)
                
                Spacer()
            }.padding()
                .onAppear(perform: {
                    self.title = item.title
                    self.post = item.post
                })
            
        }
        .navigationBarTitle("Edit Post", displayMode: .inline)
        .navigationBarItems(trailing: trailing)
    }
    
    var trailing: some View {
        Button(action: {
            presentationModel.wrappedValue.dismiss()
        }, label: {
            Text("Save")
        })
    }
}

 
