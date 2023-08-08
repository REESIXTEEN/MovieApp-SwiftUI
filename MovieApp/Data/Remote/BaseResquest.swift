//
//  BaseResquest.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 7/8/23.
//

import Foundation


struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    static let content = "application/json"
}

let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMDU0NjM3MzcwYTVhZTkyZDcwNjU4NGRmMjk4M2JhYyIsInN1YiI6IjYzZmY3YzNhN2E0ZWU3MDBiOTE3NTcxMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rNefPSbK3jMCCN6Z6-Zeu2OKwPBBxjVrmvZfDF4cEfQ"


struct BaseRequest {
    
    static func getRequest(server: String, endpoint: String) -> URLRequest? {
        let urlString : String = "\(server)\(endpoint)"
        
        guard let url = URL(string: urlString) else {
            print("URL Error")
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethods.get
        urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        urlRequest.setValue("application/json", forHTTPHeaderField: "accept")

        return urlRequest
    }

}
