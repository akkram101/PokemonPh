//
//  API.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/17/23.
//

import Foundation

struct API {
    
    let API: String = AppConfig.environment == .development ? "DevHTPP" : "ProdHTTP"
    
    static var userRegistration: String { return "/api/userRegistration" }
    
}
