//
//  ContentView.swift
//  FxC Watch App
//
//  Created by Lee Guan Feng on 22/2/23.
//

import SwiftUI

struct Currency {
    var value: String
    var code: String
}

struct ContentView: View {
    var rate: Float = 0.000056
    
    @State var startCurrency = Currency(
        value: "1", code: "VND"
        )
    
    @State var endCurrency = Currency(
        value: "", code: "SGD"
    )

    var body: some View {
        VStack {
            FxField(value: $startCurrency.value, code: $startCurrency.code)
            
            Image(systemName: "arrow.up.arrow.down")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .padding(.vertical, 10)
            
            FxField(value: $endCurrency.value, code: $endCurrency.code, locked: true)
        }
        .padding()
        .onAppear {
            endCurrency.value = Float(startCurrency.value) != 1 ? String(format: "%.2f", (Float(startCurrency.value) ?? 0) * rate) : String(format: "%f", rate)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
