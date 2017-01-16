//
//  Downloader.swift
//  Viking Logue
//
//  Created by Prayag Bhakar on 1/12/17.
//  Copyright © 2017 Prayag Bhakar. All rights reserved.
//

import Foundation

extension URLSession {
    func synchronousDataTask(with url: URL) -> (Data?, URLResponse?, Error?) {
        var data: Data?
        var response: URLResponse?
        var error: Error?
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let dataTask = self.dataTask(with: url) {
            data = $0
            response = $1
            error = $2
            
            semaphore.signal()
        }
        dataTask.resume()
        
        _ = semaphore.wait(timeout: .distantFuture)
        
        return (data, response, error)
    }
}

class Downloader {
    class func load(url: URL) -> Data?{
        let session = URLSession.shared
        let (data, response, error) = session.synchronousDataTask(with: url)
        
        if error == nil {
            // Success
            if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                print("Success: \(statusCode)")
            }
            
        } else {
            print("Failure: %@", error?.localizedDescription as Any);
        }
        
        return data
    }
}
