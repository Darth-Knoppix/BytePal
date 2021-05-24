//
//  BinaryInteger.swift
//  BytePal
//
//  Created by Seth Corker on 24/05/2021.
//

extension BinaryInteger {
    var asBinary: String {
        let binaryRepresentation = String(self, radix: 2)
        let padding = String(repeatElement("0", count: self.bitWidth - binaryRepresentation.count))
        return padding + binaryRepresentation
    }
    
    var asHex: String {
        return String(format: "%02X", Int(self))
    }
    
    var asOctal: String {
        return String(self, radix: 8)
    }
}
