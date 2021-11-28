//
//  ApiServices.swift
//  Recipe-Search-iOS
//
//  Created by Hala on 28/11/2021.
//


import Alamofire

enum Result<T>{
    case success(T)
    case failure(Error)
}


class ApiServices{
    
    static let instance = ApiServices()
    
    func getResponse<T:Decodable>(url: String, paramters: Parameters?, headers: HTTPHeaders?, method: HTTPMethod,  completion: @escaping (Result<T>) -> ()){
        
        
        AF.request(url, method: method, parameters: paramters, encoding: URLEncoding.default, headers: headers).responseJSON{ (response) in

            do{
                
                switch response.result{
                case .success(let value):
                    
                    guard let jsonData = try? JSONSerialization.data(withJSONObject: value, options: []) else {
                        let error = NSError(domain: "Json serialization data error", code: 401, userInfo: [ NSLocalizedDescriptionKey :  NSLocalizedString("Unwrapping error", value: "Json serialization data error", comment: "")
                        ])
                        completion(.failure(error))
                        return
                    }
                    
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(T.self, from: jsonData)
                    
                    completion(.success(data))
                    
                case .failure(let error):
                    completion(.failure(error))
                }
                
            }catch{
                completion(.failure(error))
            }
            
        }
        
    }
}


