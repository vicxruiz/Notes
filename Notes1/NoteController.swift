//
//  NoteController.swift
//  Notes1
//
//  Created by Victor  on 4/24/19.
//  Copyright © 2019 com.Victor. All rights reserved.
//

import Foundation
import UIKit

class NoteController {
    var notes: [Note] = []
    
    init() {
        createNote("hello")
    }
    
    func createNote(_ text: String) {
        let note = Note(text: text)
        notes.append(note)
    }
}
