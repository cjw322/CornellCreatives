//
//  NetworkManager.swift
//  cornellcreatives
//
//  Created by Cora Wu on 12/2/18.
//  Copyright © 2018 Katherine Go. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    /// Endpoint URL string
    /// NOTE: Remember to set "Allows arbitrary loads" to YES in your Info.plist in order
    /// to access API websites that are not HTTPS (not "secure" - you'll need this for your project)
    private static let photographersEndpoint = "http://35.196.70.200/service/photographer/"
    private static let videographersEndpoint = "http://35.196.70.200/service/videographer/"
    private static let artistsEndpoint = "http://35.196.70.200/service/artist/"
    private static let programmersEndpoint = "http://35.196.70.200/service/programmer/"
    private static let tutorsEndpoint = "http://35.196.70.200/service/tutor/"
    private static let othersEndpoint = "http://35.196.70.200/service/other"
    
    static func getPhotographers(completion: @escaping ([Person]) -> Void) {
        Alamofire.request(photographersEndpoint, method: .get).validate().responseData { (response) in
            switch response.result{
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments){
                    print(json)
                }
                let decoder = JSONDecoder()
                if let personResponse = try? decoder.decode(PersonResponse.self, from: data){
                    completion(personResponse.users)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getVideographers(completion: @escaping ([Person]) -> Void) {
        Alamofire.request(videographersEndpoint, method: .get).validate().responseData { (response) in
            switch response.result{
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments){
                    print(json)
                }
                let decoder = JSONDecoder()
                if let personResponse = try? decoder.decode(PersonResponse.self, from: data){
                    completion(personResponse.users)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getArtists(completion: @escaping ([Person]) -> Void) {
        Alamofire.request(artistsEndpoint, method: .get).validate().responseData { (response) in
            switch response.result{
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments){
                    print(json)
                }
                let decoder = JSONDecoder()
                if let personResponse = try? decoder.decode(PersonResponse.self, from: data){
                    completion(personResponse.users)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    static func getProgrammers(completion: @escaping ([Person]) -> Void) {
        Alamofire.request(programmersEndpoint, method: .get).validate().responseData { (response) in
            switch response.result{
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments){
                    print(json)
                }
                let decoder = JSONDecoder()
                if let personResponse = try? decoder.decode(PersonResponse.self, from: data){
                    completion(personResponse.users)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getTutors(completion: @escaping ([Person]) -> Void) {
        Alamofire.request(tutorsEndpoint, method: .get).validate().responseData { (response) in
            switch response.result{
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments){
                    print(json)
                }
                let decoder = JSONDecoder()
                if let personResponse = try? decoder.decode(PersonResponse.self, from: data){
                    completion(personResponse.users)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getOthers(completion: @escaping ([Person]) -> Void) {
        Alamofire.request(othersEndpoint, method: .get).validate().responseData { (response) in
            switch response.result{
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments){
                    print(json)
                }
                let decoder = JSONDecoder()
                if let personResponse = try? decoder.decode(PersonResponse.self, from: data){
                    completion(personResponse.users)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
