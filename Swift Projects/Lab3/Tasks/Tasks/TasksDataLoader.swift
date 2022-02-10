//
//  TasksDataLoader.swift
//  Tasks
//
//  Created by LUCAS GAMA on 2/8/22.
//

import Foundation

class TasksDataLoader{
    var allData = [TasksDataStructure]()
    
    func loadData(fileName: String){
        if let pathURL = Bundle.main.url(forResource: fileName, withExtension: "plist"){
            let plistDecoder = PropertyListDecoder()
            do{
                let data = try Data(contentsOf: pathURL)
                allData = try plistDecoder.decode([TasksDataStructure].self, from: data)
            } catch {
                print(error)
            }
        }
    }
    
    func getPriority() -> [String]{
        var priorityArr = [String]()
        for item in allData{
            priorityArr.append(item.priority)
        }
        return priorityArr
    }
    
    func getTask(idx: Int) -> [String]{
        return allData[idx].tasks
    }
    
    func addTask(idx: Int, newTask: String, position: Int){
        allData[idx].tasks.insert(newTask, at: position)
    }
    
    func deleteTask(idx: Int, position: Int){
        allData[idx].tasks.remove(at: position)
    }
}
