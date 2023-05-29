//
//  ContentView.swift
//  SwiftPackageDemo
//
//  Created by Dhaivat Vyas on 29/05/23.
//

import SwiftUI
import MyFirstSwiftPackage

public struct ContentView: View {
    
    var apiCall: ApiCall?
    public init() {
        apiCall = ApiCall()
        apiCall?.getSuccessResponse()
    }
    
    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ResponseModel: Codable {
    let key: String?
    let status: Int?
    
    enum CodingKeys: String, CodingKey {
        case key = "Key"
        case status
    }
}

class ApiCall {
    var apiPackage: MyFirstSwiftPackage?
    
    init(apiPackage: MyFirstSwiftPackage = MyFirstSwiftPackage()) {
        self.apiPackage = apiPackage
    }
    
    func getSuccessResponse() {
        self.apiPackage?.callGetAPI(url: URL(string: "www.google.com"), type: ResponseModel.self) { result in
            switch result {
                case let .success(response):
                    print("response = ",response)
                case let .failure(error):
                    print("Error = ", error)
            }
        }
    }
}
