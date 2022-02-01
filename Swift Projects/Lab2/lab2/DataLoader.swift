//
//  DataLoader.swift
//  lab2
//
//  Created by LUCAS GAMA on 1/31/22.
//

import Foundation

class DataLoader {
    var allData = [Countries]()
    
    func loadData(filename: String){
        if let pathURL = Bundle.main.url(forResource: filename, withExtension: "plist"){
            let plistDecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                allData = try plistDecoder.decode([Countries].self, from: data)
            }
            catch {
                print("Error while loading data")
            }
        }
    }
    
    func getCountries() -> [String]{
        var countryArr = [String]()
        for i in allData{
            countryArr.append(i.country)
        }
        return countryArr
    }
    
    func getCities(idx: Int) -> [String]{
        return allData[idx].cities
    }
}
