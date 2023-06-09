//
//  SearchService.swift
//  AppStore
//
//  Created by Baris on 24.04.2023.
//

import Foundation
import Alamofire


struct searchService {
    static func fetchData(searchtext term: String,completion: @escaping([Results])->Void){
        let parameters = ["entity":"software" ,"term":term]
        AF.request(SEARCH_URL ,method: .get,parameters: parameters).responseData { responseData in
            if let error = responseData.error{
                print(error.localizedDescription)
                return
            }
            guard let data = responseData.data else { return }
            do{
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results)
                
            }catch let error{
                print(error.localizedDescription)
            }
            
        }
    }
    
    static func fetchDataID(id: String,completion: @escaping([Results])->Void){
        let parameters = ["id":id]
        AF.request(SEARCH_URL_ID ,method: .get,parameters: parameters).responseData { responseData in
            if let error = responseData.error{
                print(error.localizedDescription)
                return
            }
            guard let data = responseData.data else { return }
            do{
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results)
                
            }catch let error{
                print(error.localizedDescription)
            }
            
        }
    }
}


