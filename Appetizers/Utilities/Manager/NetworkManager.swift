//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Rahul Kumar on 23/12/23.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    // Add other HTTP methods as needed
}

import Foundation
import UIKit

enum APIEndpoint: String {
    case getAppetizers = "appetizers"
}


class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let baseURL: String = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    
    private let cache = NSCache<NSString, UIImage>()
    
    private init() { }
    
    func getRequest<T: Decodable>(path: APIEndpoint, parameters: [String: Any]? = nil, completion: @escaping (Result<T, APError>) -> Void) {
        performRequest(method: .get, path: path, parameters: parameters, completion: completion)
    }
    
    func postRequest<T: Decodable>(path: APIEndpoint, parameters: [String: Any]? = nil, completion: @escaping (Result<T, APError>) -> Void) {
        performRequest(method: .post, path: path, parameters: parameters, completion: completion)
    }
    
    func uploadFile<T: Decodable>(path: APIEndpoint, fileData: Data, fileName: String, parameters: [String: Any]? = nil, completion: @escaping (Result<T, APError>) -> Void) {
        performMultipartRequest(path: path, fileData: fileData, fileName: fileName, parameters: parameters, completion: completion)
    }
    
    private func performRequest<T: Decodable>(method: HTTPMethod, path: APIEndpoint, parameters: [String: Any]? = nil, completion: @escaping (Result<T, APError>) -> Void) {
        
        let fullURL = baseURL + path.rawValue
        guard let url = URL(string: fullURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if method == .post {
            if let parameters = parameters {
                request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    private func performMultipartRequest<T: Decodable>(path: APIEndpoint, fileData: Data, fileName: String, parameters: [String: Any]? = nil, completion: @escaping (Result<T, APError>) -> Void) {
        
        let fullURL = baseURL + path.rawValue
        guard let url = URL(string: fullURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
        
        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var body = Data()
        
        // Add parameters
        if let parameters = parameters {
            for (key, value) in parameters {
                let parameterString = "--\(boundary)\r\n" +
                "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n" +
                "\(value)\r\n"
                if let parameterData = parameterString.data(using: .utf8) {
                    body.append(contentsOf: parameterData)
                }
            }
        }
        
        // Add file data
        let fileString = "--\(boundary)\r\n" +
        "Content-Disposition: form-data; name=\"file\"; filename=\"\(fileName)\"\r\n" +
        "Content-Type: application/octet-stream\r\n\r\n"
        if let fileStringData = fileString.data(using: .utf8) {
            body.append(contentsOf: fileStringData)
        }
        
        body.append(contentsOf: fileData)
        
        let closingString = "\r\n--\(boundary)--\r\n"
        if let closingStringData = closingString.data(using: .utf8) {
            body.append(contentsOf: closingStringData)
        }
        
        request.httpBody = body
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
