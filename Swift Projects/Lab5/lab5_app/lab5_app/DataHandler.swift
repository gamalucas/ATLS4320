//
//  DataHandler.swift
//  lab5_app
//
//  Created by LUCAS GAMA on 2/26/22.
//

import Foundation

final class DataHandler {
    static let shared = DataHandler()
    
    private struct Constrants {
        static let apiKey =  "1512e707221b35b503a344199a23276575f40df5" //"567AA60A-0DE2-4A1E-B67D-11544C039582"
        static let endpoint1 = "https://api.nomics.com/v1/currencies/ticker"
        
        static let endpoint2 = "&ids=BTC,ETH,XRP&interval=1d,30d&convert=EUR&platform-currency=ETH&per-page=100&page=1"
        
        //"https://rest-sandbox.coinapi.io/v1/assets/"
    }
    
    private init() {}
    
    public func getData(completion: @escaping (Result<[CryptoObj], Error>) -> Void){
        guard let url = URL(string: Constrants.endpoint1 + "?key=" + Constrants.apiKey) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let cryptos = try JSONDecoder().decode([CryptoObj].self, from: data)
                
                completion(.success(cryptos))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}

//class DataHandler {
//    var cryptoData = CryptoData()
//
//    func loadjson() async {
//
//        //let url = "https://api.nomics.com/v1/currencies/ticker?key=1512e707221b35b503a344199a23276575f40df5&ids=BTC,ETH,XRP&interval=1d,30d&convert=EUR&platform-currency=ETH&per-page=100&page=1"
//
//        let url = "https://rest-sandbox.coinapi.io/v1/assets/?apikey=567AA60A-0DE2-4A1E-B67D-11544C039582"
//
//        guard let urlPath = URL(string: url)
//        else {
//            print("url error")
//            return
//        }
//        do {
//            let (data, response) = try await URLSession.shared.data(from: urlPath, delegate: nil)
//            guard (response as? HTTPURLResponse)?.statusCode == 200
//                else{
//                   print("error while downloading file")
//                    return
//                }
//            print("donwload complete")
//            print("DATA: \(data)")
//            parsejson(data)
//        }
//        catch {
//            print(error.localizedDescription)
//        }
//    }
//
//    func parsejson (_ data: Data) {
//        do{
//            let apiData = try JSONDecoder().decode([CryptoObj].self, from: data)
//            for item in apiData.CryptoCurrency{
//                print(item)
//                cryptoData.CryptoCurrency.append(item)
//            }
//            print(cryptoData.CryptoCurrency)
//            print("parsejson done")
//        }
//        catch let jsonError{
//            print(jsonError.localizedDescription)
//            return
//        }
//    }
//
//    func getCurrency() -> [DataDecoder] {
//        return cryptoData.CryptoCurrency
//    }
//}



