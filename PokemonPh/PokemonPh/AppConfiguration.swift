//
//  AppConfiguration.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/14/23.
//

import Foundation

enum AppEnvironment: Int {
    case development = 0
    case production = 1
}

struct AppConfig {
    static var environment: AppEnvironment {
        guard let environment = Bundle.main.object(forInfoDictionaryKey: "Environment") as? Int else {
            fatalError("Environment value not found in Info.plist")
        }
        return AppEnvironment(rawValue: environment) ?? .development
    }
    
    static var API: String {
        let isDev: Bool = AppConfig.environment == .development
        
        return isDev ? "Dev environment API" : "Prod environtment API"
    }
}
