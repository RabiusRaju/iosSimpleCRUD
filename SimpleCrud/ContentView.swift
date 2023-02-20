//
//  ContentView.swift
//  SimpleCrud
//
//  Created by Md. Rabius Sani Raju on 20/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
    }
}


struct HomeView: View {
    @State var isPresentedNewPost = false
    @State var title = ""
    @State var post = ""
    
    var body: some View {
        NavigationView {
            List{
                ForEach(0 ..< 5, id: \.self ){ item in
                    NavigationLink(
                        destination: Text("Destination"),
                        label:{
                            VStack(alignment: .leading){
                                Text("Navigation")
                                Text("Hello, World !").font(.caption).foregroundColor(.gray)
                            }
                        }
                    )
                }
            }.listStyle(InsetListStyle())
            .navigationBarTitle("Posts")
            .navigationBarItems(trailing: plusButton)
        }.sheet(isPresented: $isPresentedNewPost, content: {
            NewPostView(isPresented: $isPresentedNewPost, title: $title, post: $post)
        })
    }
    
    var plusButton: some View {
        Button(action: {
            isPresentedNewPost.toggle()
        }, label: {
            Image(systemName: "plus")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
