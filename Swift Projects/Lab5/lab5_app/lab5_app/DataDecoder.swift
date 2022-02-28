//
//  DataDecoder.swift
//  lab5_app
//
//  Created by LUCAS GAMA on 2/26/22.
//

import Foundation

struct CryptoObj: Codable {
//    let asset_id: String
//    let name: String?
//    let price_usd: Float?
    
    let currency: String?
    let price: String?
    let urlIcon: String?
}

//struct DataDecoder: Decodable {
//    let price: String
//    let id: String
//}
//
//struct CryptoData: Decodable {
//    var CryptoCurrency = [DataDecoder]()
//}


