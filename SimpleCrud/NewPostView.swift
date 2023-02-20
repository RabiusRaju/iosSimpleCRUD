//
//  NewPostView.swift
//  SimpleCrud
//
//  Created by Md. Rabius Sani Raju on 20/2/23.
//

import SwiftUI

struct NewPostView: View {
    @Binding var isPresented: Bool
    @Binding var title : String
    @Binding var post : String
    
    var body: some View {
        NavigationView{
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
                
            }
            .navigationBarTitle("New Post", displayMode: .inline)
            .navigationBarItems(leading: leading, trailing: trailing)
            
        }
    }
    
    var leading: some View {
        Button(action: {
            isPresented.toggle()
        }, label: {
            Text("Cancel")
        })
    }
    
    var trailing: some View {
        Button(action: {
            
        }, label: {
            Text("Post")
        })
    }
}

//struct NewPostView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPostView()
//    }
//}
