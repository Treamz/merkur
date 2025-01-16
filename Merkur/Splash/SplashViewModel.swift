//
//  SplashViewModel.swift
//  Merkur
//
//  Created by Ivan Chernoknizhikov on 15.01.2025.
//

import Foundation
import Appwrite

import AppwriteModels
import JSONCodable

class SplashViewModel : ObservableObject {
    let client = Client().setProject("6788082800262433ee19").setKey("standard_d4bc7bd1cb568cb50be98f5ca3d0a3d7ef5c3cfe5e0743936db7aaa028ea529c04d4feaf400c7b302ba0bbd76ca40d0d523151bf246e77201273fe0ddb5579ce5b5a954026914382b9b42a80421d38c7d9ef849362dad6241cb0f2196aac5a8133e807ff92736d253f134a1b6f21b174af5c8d668e52aca704c7f3bf37b2547f")
    var databases: Databases

    let databaseId = "67880955003b281bea2b"
    let collectionId = "67880960000025f2a05b"
    let documentId = "67880a850035a870751e"
    @Published var sheet = false
    @Published var url: String?
    
    init() {
        databases = Databases(client)
        Task {
            try await voidFetchRequest()
        }

    }
    
    func extractString(from anyCodable: JSONCodable.AnyCodable?) -> Any? {
        // Safely access the value and cast it to String
        if let value = anyCodable?.value as? String {
            return value
        }
        if let value = anyCodable?.value as? Bool {
            return value
        }
        return nil
    }

    
    func voidFetchRequest() async {
        do {
            let doc = try await databases.getDocument(databaseId: databaseId, collectionId: collectionId, documentId: documentId)
            
            if let data = doc.data as? [String: Any] {
                if let url = extractString(from: data["url"] as! AnyCodable) {
                    self.url = url as! String
                    let sheet = extractString(from: data["isActive"] as! AnyCodable)
                    self.sheet = sheet as! Bool
                    print("EXTRACTED URL: \(url) \(self.sheet)")
                } else {
                               print("Name not found or not a String")
                }
            } else {
                print("The field is either missing or not a String.")
            }

        }
        catch {
            print("ERROR \(error.localizedDescription)")
        }
    }
}
