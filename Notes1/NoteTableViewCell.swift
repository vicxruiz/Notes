//
//  NoteTableViewCell.swift
//  Notes1
//
//  Created by Victor  on 4/24/19.
//  Copyright © 2019 com.Victor. All rights reserved.
//

import Foundation
import UIKit

protocol NoteTableViewCellDelegate: AnyObject {
    func shareNote(for cell: NoteTableViewCell)
}

class NoteTableViewCell: UITableViewCell {
    @IBOutlet weak var noteLabel: UILabel!
    weak var delegate: NoteTableViewCellDelegate?
    var note: Note? {
        didSet {
            updateView()
        }
    }
    
    private func updateView() {
        guard let note = note else {return}
        noteLabel.text = note.text
    }
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        delegate?.shareNote(for: self)
    }
}
