//
//  BookController.swift
//  
//
//  Created by Thoai Le on 6/11/19.
//

import Foundation

class BookController {
    private(set) var books: [Book] = []

    private var readingListURL: URL? {
        let fileManager = FileManager.default
        
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first  else {
            return nil
            }
        return documents.appendingPathComponent("books.plist")
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode (books)
            try data.write(to: url)
        } catch {
            print("Error")
        }
    }
}

