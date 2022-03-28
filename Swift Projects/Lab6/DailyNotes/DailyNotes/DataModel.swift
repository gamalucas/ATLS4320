//
//  DataModel.swift
//  DailyNotes
//
//  Created by LUCAS GAMA on 3/28/22.
//

import Foundation
import RealmSwift

class Notes: Object {
    @Persisted (primaryKey: true) var _id = ObjectId.generate()
    @Persisted var note = ""
    @Persisted var date = ""
}
