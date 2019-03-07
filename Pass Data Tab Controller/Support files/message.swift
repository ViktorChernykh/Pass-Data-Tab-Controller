//
//  debagMesage.swift
//  Pass Data Tab Controller
//
//  Created by Viktor on 07/03/2019.
//  Copyright © 2019 viktorsoft. All rights reserved.
//

func message(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
    let fileName = file.components(separatedBy: "/").last ?? ""
    
    print("\(message)  file: \(fileName) line: \(line) function: \(function)")
}
