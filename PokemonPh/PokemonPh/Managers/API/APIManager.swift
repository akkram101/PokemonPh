//
//  APIManager.swift
//  FoodFood
//
//  Created by Akkram Bederi on 7/17/23.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class APIManager {
    class func sampleRequest() {

        let headers = [
            "X-RapidAPI-Key": "76cebae97bmshb290f076e267fc1p121e3ajsn4b92d9d74618",
            "X-RapidAPI-Host": "shopeeapi2.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://shopeeapi2.p.rapidapi.com/id/seller/179967476/products/11043778?offset=0&limit=30")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            if let error = error {
                print(error)
            } else {
                if let httpResponse = response as? HTTPURLResponse {
                    if let data = data {
                        // Process the data response
                        do {
                            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                                print(json)
                                // Use the dictionary data as needed
                            } else {
                                print("Could not convert data to dictionary.")
                            }
                        } catch {
                            print("Error parsing data: \(error)")
                        }
                    } else {
                        print("No data received.")
                    }
                } else {
                    print("Invalid HTTP response.")
                }
            }
        }
        dataTask.resume()
    }
}
