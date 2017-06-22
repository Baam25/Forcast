//
//  HttpClient.swift
//  Forcast
//
//  Created by Harish Gonnabhaktula on 22/06/17.
//  Copyright © 2017 Harish Gonnabattula. All rights reserved.
//

import Foundation
import Alamofire

class HTTPClient{
    
    func loadData(with Url:URL, method: HTTPMethod, parameters: Parameters? = nil, encoding: ParameterEncoding, headers:HTTPHeaders? = nil,completionHandler: @escaping ResultCompletionHandler){
        
        Alamofire.request(Url, method: method, parameters: parameters, encoding: encoding, headers: headers).validate().responseJSON { (dataResponse) in
            
            completionHandler((dataResponse.request, dataResponse.response, dataResponse.value, dataResponse.error))
        }
    }
    
    
}
