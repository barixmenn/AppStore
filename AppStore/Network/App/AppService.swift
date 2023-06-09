//
//  AppService.swift
//  AppStore
//
//  Created by Baris on 26.04.2023.
//

import Foundation
import Alamofire


struct AppService {
    static func fetchData(urlString: String, completion: @escaping(Feed)->Void){
        guard let url = URL(string: urlString) else { return }
        AF.request(url,method: .get).responseData { responseData in
            if let error = responseData.error{
                print(error.localizedDescription)
                return
            }
            guard let data = responseData.data else{ return }
            do{
                let response = try JSONDecoder().decode(AppModel.self, from: data)
                completion(response.feed)
            }catch let error{
                print(error.localizedDescription)
            }
        }
    }
    
    static func fetchHeaderData(urlString: String, completion: @escaping([AppHeaderModel])->Void){
           guard let url = URL(string: urlString) else { return }
           AF.request(url,method: .get).responseData { responseData in
               if let error = responseData.error{
                   print(error.localizedDescription)
                   return
               }
               guard let data = responseData.data else{ return }
               do{
                   let response = try JSONDecoder().decode([AppHeaderModel].self, from: data)
                   completion(response)
               }catch let error{
                   print(error.localizedDescription)
               }
           }
       }
}
