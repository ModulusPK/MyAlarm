//
//  FilesClient.swift
//  MyAlarm
//
//  Created by Danjuma Nasiru on 20/06/2023.
//

import Foundation

class FilesClient {
    private func getDocumentsDirectory() -> URL{
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let dir = path[0]
        return dir
    }
    
    func saveToFileManager<T: Codable>(directory: String, item: T) throws {
        let dir = getDocumentsDirectory().appendingPathComponent(directory)
        let encoder = JSONEncoder()
        let data = try encoder.encode(item)
        try data.write(to: dir, options: [.atomic, .completeFileProtection])
    }
    
    func fetchingDataFromDir<T: Codable>(directory: String) throws -> T {
        let dir = getDocumentsDirectory().appendingPathComponent(directory)
        let data = try Data(contentsOf: dir)
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(T.self, from: data)
        return decodedData
    }
    
}
