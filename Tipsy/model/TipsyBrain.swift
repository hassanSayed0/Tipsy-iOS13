//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by hassan on 03/02/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
struct TipsyBrain{
    var price : Float = 0.0
    var tipPercent : Float = 0.1
    var pepoleNumber : Float = 2.0
    
    
    mutating func setPriceText(_ price : String?){
        if let safePrice = price {
            if let safePriceNum = Float(safePrice){
                self.price = safePriceNum
            }
        }
        
    }
    mutating func setTipPercent(_ tip : String){
        if tip == "0%"{
            tipPercent = 0.0
        }else if tip == "10%"{
            tipPercent = 0.1
        }else {
            tipPercent = 0.2
        }
        
    }
    
    mutating func setPepoleNumber(_ num : Float){
        pepoleNumber = num
    }
    func getResult()->String{
        
        let result = (price * tipPercent + price)/pepoleNumber
        return String(format: "%0.2f", result)
    }
    func getExplanationText()->String{
        
        
        return "Split between \(Int(pepoleNumber)) pepole , with \(Int(tipPercent*100))% tip"
    }
}
