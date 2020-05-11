//
//  EntryController.swift
//  Journal - CloudKit
//
//  Created by Jimmy on 5/11/20.
//  Copyright © 2020 Jimmy. All rights reserved.
//

import Foundation
import CloudKit



class EntryController {
    
    var entries: [Entry] = []
    
    let publicDB = CKContainer.default().privateCloudDatabase
    
    func createEntry(with title: String, body: String, completion: @escaping(_ result: Result<Entry?, EntryError>) -> Void ) {
        let newEntry = Entry(title: title, body: body)
        save(entry: newEntry, completion: completion)
        
    }
    
    func save(entry: Entry, completion: @escaping (_ result: Result<Entry?, EntryError>) -> Void) {
        
        let entryRecord = CKRecord(entry: entry)
        
        publicDB.save(entryRecord) { (record, error) in
            if let error = error {
                completion(.failure(.ckError(error)))
                return
            }
            guard let record = record,
                let savedEntry = Entry(ckRecord: record)
                else { completion(.failure(.couldNotUnwrap)); return }
            print("Saved entry successfully")
            self.entries.insert(savedEntry, at: 0)
            completion(.success(savedEntry))
        }
    }
    
    func fetchEntriesWith(completion: @escaping(_ result: Result<[Entry]?,EntryError>) -> Void) {
        
    }
    
    
}
