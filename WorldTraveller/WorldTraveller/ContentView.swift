//
//  ContentView.swift
//  WorldTraveller
//
//  Created by Cengizhan Özyurt on 25.10.2024.
//

import SwiftUI


struct ContentView: View {
    
    @State var fahrenheitValue : String = ""
    
    let numberFormatter : NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 1
        return numberFormatter
    }()
    
    
    func converterToCelcius() -> String {
    
        if let value = Double(fahrenheitValue){
            
            let fahrenheit = Measurement<UnitTemperature>(value: value, unit: .fahrenheit)
            
            let celciusValue = fahrenheit.converted(to: .celsius)
            return numberFormatter.string(from: NSNumber(value: celciusValue.value)) ?? "???"
        }
        else{
            return "???"
        }
    }
    
    var body: some View {
        VStack {
            TextField("value",text : $fahrenheitValue).font(Font.system(size: 64.0)).keyboardType(.decimalPad)
            Text("fahrenheit")
            Text("is actually").foregroundColor(.gray)
            Text(converterToCelcius())
                .font(Font.system(size: 64.0))
            Text("degrees Celcius")
            Spacer()
        }
        .multilineTextAlignment(.center)
        .foregroundColor(.orange)
        .font(.title)
            
    }
}

#Preview {
    ContentView()
}
