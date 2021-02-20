//
//  CharactersWebService.swift
//  HeroesMVP
//
//  Created by Daniel Rincon on 19/02/2021.
//

import Foundation
import Alamofire
import JSONDecoder_Keypath

public class CharactersWebService: BaseWebService {
    
    public func getCharacters(page: Page, onSuccess: @escaping ([Character]) -> Void,
                              onError: @escaping (Error) -> Void) {
        if BaseWebService.isConnected(){
            var params = BaseWebService.getSecurityParams()
            params["limit"] = String(page.limit)
            params["offset"] = String(page.offset)
            
            BaseWebService.manager.request("\(Bundle.main.object(forInfoDictionaryKey: "SERVER_URL") as! String)characters", method: .get, parameters: params).validate()
                .responseJSON (completionHandler: { response in
                    switch response.result {
                    case .success:
                        if let data = response.data,
                            let characters = try? JSONDecoder().decode([Character].self, from: data, keyPath: "data.results") {
                            onSuccess(characters)
                        }
                    case .failure(let error):
                        onError(error)
                        print("Error getCharacters: \(error)")
                    }
            })
        }else{
            onError(WebServiceError.notConnection)
        }
    }
    
}
