//
//  NotesViewController.swift
//  Notes1
//
//  Created by Victor  on 4/24/19.
//  Copyright © 2019 com.Victor. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NoteTableViewCellDelegate {
    
    
    let noteController = NoteController()
    
    @IBOutlet weak var notesTableView: UITableView!
    @IBOutlet weak var notesTextView: UITextView!
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        print("Saved!")
        guard let text = notesTextView.text, !text.isEmpty else {return}
        noteController.createNote(text)
        notesTableView.reloadData()
        notesTextView.text = ""
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
        noteCell.note = note
        noteCell.delegate = self
        
        return cell
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NoteDetail" {
            guard let noteDetailVC = segue.destination as? NoteDetailViewController, let cell = sender as? NoteTableViewCell else {return}
            
            noteDetailVC.note = cell.note
            
        }
    }
    
    func shareNote(for cell: NoteTableViewCell) {
        print("share note to the world")
        guard let note = cell.note else {return}
        
        let text = note.text
        
        let activityController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
}
