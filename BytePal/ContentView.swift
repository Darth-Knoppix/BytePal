//
//  ContentView.swift
//  BytePal
//
//  Created by Seth Corker on 24/05/2021.
//

import SwiftUI
import OrderedCollections

struct ContentView: View {
    let numberRepresentations: OrderedDictionary = [
        "hexadecimal": 16,
        "decimal": 10,
        "octal": 8,
        "binary": 2,
    ]
    
    @State private var numberInput = ""
    @State private var numberRepresntationIndex = 1
    
    var transformedNumbers: OrderedDictionary<String, String> {
        let (_, base) = numberRepresentations.elements[numberRepresntationIndex]
        let decimalNum = Int(numberInput, radix: base) ?? 0
        
        guard decimalNum <= UInt32.max else {
            return [
                "hexadecimal": "",
                "decimal": "",
                "octal": "",
                "binary": "",
            ]
        }
        
        return [
            "hexadecimal": decimalNum.asHex,
            "decimal": String(decimalNum),
            "octal": decimalNum.asOctal,
            "binary": UInt32(decimalNum).asBinary,
        ]
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Number", text: $numberInput).keyboardType(.asciiCapableNumberPad)
                Picker("Number System", selection: $numberRepresntationIndex) {
                    ForEach(0 ..< numberRepresentations.count) {
                        Text("\(numberRepresentations.elements[$0].key)".capitalized)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            ForEach(0 ..< numberRepresentations.count) { index in
                Section(header: Text("\(numberRepresentations.elements[index].key)")) {
                    Text(transformedNumbers.elements[index].value)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
