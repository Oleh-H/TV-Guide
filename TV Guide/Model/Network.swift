//
//  Network.swift
//  TV Guide
//
//  Created by Oleh Haistruk on 12.08.2020.
//  Copyright © 2020 Oleh Haistruk. All rights reserved.
//

import UIKit
import Alamofire

class Network {
    private let baseURL = "http://oll.tv/demo"
    private let uuid = UIDevice.current.identifierForVendor?.uuidString
    
    func getShowItems(borderID: Int, direction: Int, handler: @escaping (TVGuideData) -> Void) {
        guard let receivedUUID = uuid else {
            return
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let parameters: [String: Any] = ["serial_number": receivedUUID, "borderId": borderID, "direction": direction]
        
        AF.request(baseURL, parameters: parameters).validate().responseDecodable(of: TVGuideData.self, decoder: decoder) { (responce) in
            switch responce.result {
            case .success(let showsData):
                handler(showsData)
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }

}

class ImageLoadingOpreation: Operation {
    var image: UIImage?
    var url: String
    var onCompletion: ((Data) -> Void)?
    
    
    init(imageURL: String) {
        self.url = imageURL
    }
    
    override func main() {
        guard !isCancelled else { return }
        AF.request(url).responseData { responce in
            switch responce.result {
            case .success(let data):
                self.onCompletion?(data)
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}
