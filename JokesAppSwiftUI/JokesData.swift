//
//  JokesData.swift
//  JokesAppSwiftUI
//
//  Created by hasan bilgin on 7.11.2023.
//

import Foundation

// MARK: - Welcome
struct Welcome: Identifiable ,Codable {
    //Identifiable herikisinede manu el ekledşk çünkü List itemi istiyor buda id ister altındakinde jsonda var zaten onu kullanıcak bunda ise manuel yine ekliyoruz id yi
    let id = UUID()
    let type: String
    let value: [Value]
}

// MARK: - Value //çizgi çiziyor gerçekten baya işe yarıyor

struct Value: Identifiable, Codable {
    //bu jsondan vardı
    let id: Int
    let joke: String
    let categories: [String]
}










