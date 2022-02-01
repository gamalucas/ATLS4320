//
//  ViewController.swift
//  lab2
//
//  Created by LUCAS GAMA on 1/31/22.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var selectionLabel: UILabel!
    @IBOutlet weak var placesPicker: UIPickerView!
    
    var country = [String]()
    var city = [String]()
    var countriesData = DataLoader()
    let countryComponent = 0
    let cityComponent = 1
//    let fileName = "Places"
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component == countryComponent){
            return country.count
        }
        else{
            return city.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(component == countryComponent){
            return country[row]
        }
        else {
            return city[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == countryComponent){
            city = countriesData.getCities(idx: row)
            placesPicker.reloadComponent(cityComponent)
            placesPicker.selectRow(0, inComponent: cityComponent, animated: true)
        }
        let countyRow = pickerView.selectedRow(inComponent: countryComponent)
        let cityRow = pickerView.selectedRow(inComponent: cityComponent)
        selectionLabel.text = "You will travel to \(city[cityRow]) in \(country[countyRow])"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countriesData.loadData(filename: "Places")
        country = countriesData.getCountries()
        city = countriesData.getCities(idx: 0)
    }


}

