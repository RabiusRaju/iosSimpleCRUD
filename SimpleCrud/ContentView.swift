//
//  ContentView.swift
//  SimpleCrud
//
//  Created by Md. Rabius Sani Raju on 20/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AlertView()
    }
}

struct AlertView: View{
    var body: some View{
        NavigationView{
            VStack{
                Button(action: {
                    
                }, label: {
                    Text("Tab Me!")
                        .foregroundColor(Color.white)
                        .bold()
                        .font(.system(size: 24))
                })
                .frame(width: 200,
                       height: 50,
                       alignment: .center)
                .padding()
                .background(Color.green)
                .cornerRadius(8)
            }
        }
    }
}

struct GaugeView: View{
    var body: some View{
        Gauge(value: 33.0, in: 0.0...100.0){
            Text("Speed")
                .foregroundColor(Color.blue)
        } currentValueLabel: {
            Text("33")
                .foregroundColor(Color.blue)
        } minimumValueLabel: {
            Text("0")
                .foregroundColor(Color.blue)
        } maximumValueLabel: {
            Text("100")
                .foregroundColor(Color.blue)
        }
        .frame(width: 100, height: 100, alignment: .top)
        .gaugeStyle(.accessoryCircular)
        
    }
}

struct HomeView: View {
    @EnvironmentObject var viewModel : ViewModel
    @State var isPresentedNewPost = false
    @State var title = ""
    @State var post = ""
    
    var body: some View {
        NavigationView {
            List{
                ForEach(viewModel.items, id: \.id ){ item in
                    NavigationLink(
                        destination: DetailView(item: item),
                        label:{
                            VStack(alignment: .leading){
                                Text(item.title)
                                Text(item.post).font(.caption).foregroundColor(.gray)
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
