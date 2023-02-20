//
//  ViewModel.swift
//  SimpleCrud
//
//  Created by Md. Rabius Sani Raju on 20/2/23.
//

import Foundation
import SwiftUI

class ViewModel : ObservableObject {
    @Published var items = [PostModel]()
    let prefixUrl = "http://localhost:3000"
    
    init() {
        fetchPosts()
    }
    
    //MARK: - retrieve
    func fetchPosts(){
        guard let url = URL(string: "\(prefixUrl)/posts") else{
            print("Not found URL..")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            
            if error != nil {
                print("error",error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        self.items = result.data
                    }
                }else{
                    print("No Data")
                }
                
            } catch let JsonError {
                print("fetch Json Error :: ", JsonError.localizedDescription)
            }
            
        }.resume()
                
    }
    
    //MARK: - Create data
    func createPost(parameters: [String: Any]){
        guard let url = URL(string: "\(prefixUrl)/createPost") else{
            print("Not found URL..")
            return
        }
        
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            
            if error != nil {
                print("error",error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                }else{
                    print("No Data")
                }
                
            } catch let JsonError {
                print("fetch Json Error :: ", JsonError.localizedDescription)
            }
            
        }.resume()
                
    }
    
    //MARK: - Update data
    func updatePost(parameters: [String: Any]){
        guard let url = URL(string: "\(prefixUrl)/updatePost") else{
            print("Not found URL..")
            return
        }
        
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            
            if error != nil {
                print("error",error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                }else{
                    print("No Data")
                }
                
            } catch let JsonError {
                print("fetch Json Error :: ", JsonError.localizedDescription)
            }
            
        }.resume()
                
    }
    
    //MARK: - Delete data
    func deletePost(parameters: [String: Any]){
        guard let url = URL(string: "\(prefixUrl)/deletePost") else{
            print("Not found URL..")
            return
        }
        
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            
            if error != nil {
                print("error",error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                }else{
                    print("No Data")
                }
                
            } catch let JsonError {
                print("fetch Json Error :: ", JsonError.localizedDescription)
            }
            
        }.resume()
                
    }
    
}
