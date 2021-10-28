//
//  Tag.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/28.
//

import FirebaseFirestoreSwift
import Firebase

struct Tag: Identifiable,Decodable {
    @DocumentID var id: String?
    let name: String
    let type: String

}

