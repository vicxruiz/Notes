//
//  NotesViewController.swift
//  Notes1
//
//  Created by Victor  on 4/24/19.
//  Copyright © 2019 com.Victor. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let noteController = NoteController()
    
    @IBOutlet weak var notesTableView: UITableView!
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        print("Saved!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notesTableView.delegate = self
        notesTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteController.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = notesTableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        guard let noteCell = cell as? NoteTableViewCell else {return cell}
        
        let note = noteController.notes[indexPath.row]
        noteCell.noteLabel.text = note.text
        
        return cell
        
    }

}
