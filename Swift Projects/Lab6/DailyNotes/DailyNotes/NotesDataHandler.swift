//
//  NotesDataHandler.swift
//  DailyNotes
//
//  Created by LUCAS GAMA on 3/28/22.
//

import Foundation
import RealmSwift

class NotesDataHandler {
    var myRealm: Realm!
    var notesData: Results<Notes>
    {
        get{
            return myRealm.objects(Notes.self)
        }
    }
    
    func dbSetup(){
        do{
            myRealm = try Realm()
        } catch let err {
            print(err.localizedDescription)
        }
        print("File location: \(Realm.Configuration.defaultConfiguration.fileURL!)")
    }
    
    func addNote(newNote: Notes){
        do{
            try myRealm.write({
                myRealm.add(newNote)
            })
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    func deleteNote(note: Notes){
        do{
            try myRealm.write({
                myRealm.delete(note)
            })
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    func getNotes()->[Notes]{
        return Array(notesData)
    }
}


