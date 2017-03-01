//
//  Katip.swift
//  KatipDemo
//
//  Created by Nahit Heper on 10/02/2017.
//  Copyright © 2017 Nahit Heper. All rights reserved.
//

import Foundation
open class Katip {
    open static var formatText = "$L➤$DHH:mm:ss {$T} $F.$f.[$l]<$t>:$O"
    open static var enabled = true
    
    enum LogLevel:Int {
        case error = 0
        case warning = 1
        case info = 2
        case debug = 3
    }
    
    private class func formatMessage(with formatText:String, _ level:LogLevel, _ type:String, message:String, fileName:String, functionName:String, line:Int)->String{
        var outputText = ""
        let expressions = formatText.components(separatedBy: "$")
        for element in expressions{
            if element.isEmpty{continue}
            let formatChar = element[element.startIndex]
            let rangeAfterFormatChar = element.index(element.startIndex, offsetBy: 1)..<element.endIndex
            let remainingPhrase = element[rangeAfterFormatChar]
            switch formatChar {
            case "L":
                outputText += levelSign(level) + remainingPhrase
            case "D":
                outputText += addDate(remainingPhrase)
            case "T":
                outputText += getThreadName() + remainingPhrase
            case "t":
                outputText += type + remainingPhrase
            case "O":
                outputText += message + remainingPhrase
            case "F":
                outputText += fileName + remainingPhrase
            case "f":
                outputText += functionName + remainingPhrase
            case "l":
                outputText += String(line) + remainingPhrase
            default:
                outputText += element
            }
        }
        return outputText
    }
    
    private class func getDynamicType(_ object:Any)->String{
        return "\(type(of: object))"
    }
    
    private class func getFileName(with file:String)->String{
        let fileLastPathComponent = NSString(string:file).lastPathComponent as NSString
        let filename = fileLastPathComponent.deletingPathExtension
        return filename
    }
    
    private class func levelSign(_ level:LogLevel)->String{
        switch level {
        case .error:
            return "🔴"
        case .warning:
            return "🔵"
        case .info:
            return "⚪️"
        case .debug:
            return "⚫️"
        }
    }
    
    private class func getThreadName()->String{
        if Thread.isMainThread {
            return "Main"
        } else {
            let threadName = Thread.current.name
            if let threadName = threadName, !threadName.isEmpty {
                return threadName
            } else {
                return String(format: "%p", Thread.current)
            }
        }
    }
    
    private class func addDate(_ dateFormat: String = "HH:mm:ss.SSS", timeZone: String = "") -> String {
        let formatter = DateFormatter()
        if !timeZone.isEmpty {
            formatter.timeZone = TimeZone(abbreviation: timeZone)
        }
        formatter.dateFormat = dateFormat
        let dateStr = formatter.string(from: Date())
        return dateStr
    }
    
    open class func error(_ object: @autoclosure () -> Any, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        let message = formatMessage(with: formatText, .error, getDynamicType(object()), message: "\(object())", fileName: getFileName(with:file), functionName: function, line: line)
        printMessage(with:message)
    }
    
    open class func warning(_ object: @autoclosure () -> Any, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        let message = formatMessage(with: formatText, .warning, getDynamicType(object()), message: "\(object())", fileName: getFileName(with:file), functionName: function, line: line)
        printMessage(with:message)
    }
    
    open class func info(_ object: @autoclosure () -> Any, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        let message = formatMessage(with: formatText, .info, getDynamicType(object()), message: "\(object())", fileName: getFileName(with:file), functionName: function, line: line)
        printMessage(with:message)
    }
    
    open class func debug(_ object: @autoclosure () -> Any, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        let message = formatMessage(with: formatText, .debug, getDynamicType(object()), message: "\(object())", fileName: getFileName(with:file), functionName: function.components(separatedBy: "(")[0], line: line)
        printMessage(with:message)
    }
    
    open class func shit(_ file: String = #file, _ function: String = #function, line: Int = #line){
        
        print("⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️")
        print("⬜️⬜️💩💩💩💩💩⬜️⬜️💩💩💩💩⬜️💩💩💩⬜️⬜️💩💩💩💩⬜️⬜️💩💩💩💩💩💩💩💩⬜️")
        print("⬜️💩💩⬜️⬜️💩💩⬜️⬜️⬜️💩💩⬜️⬜️💩💩⬜️⬜️⬜️⬜️💩💩⬜️⬜️⬜️💩💩⬜️💩💩⬜️💩💩⬜️")
        print("⬜️💩💩💩⬜️⬜️⬜️⬜️⬜️⬜️💩💩⬜️⬜️💩💩⬜️⬜️⬜️⬜️💩💩⬜️⬜️⬜️💩⬜️⬜️💩💩⬜️⬜️💩⬜️")
        print("⬜️⬜️💩💩💩💩⬜️⬜️⬜️⬜️💩💩💩💩💩💩⬜️⬜️⬜️⬜️💩💩⬜️⬜️⬜️⬜️⬜️⬜️💩💩⬜️⬜️⬜️⬜️")
        print("⬜️⬜️⬜️⬜️💩💩💩⬜️⬜️⬜️💩💩⬜️⬜️💩💩⬜️⬜️⬜️⬜️💩💩⬜️⬜️⬜️⬜️⬜️⬜️💩💩⬜️⬜️⬜️⬜️")
        print("⬜️💩💩⬜️⬜️💩💩⬜️⬜️⬜️💩💩⬜️⬜️💩💩⬜️⬜️⬜️⬜️💩💩⬜️⬜️⬜️⬜️⬜️⬜️💩💩⬜️⬜️⬜️⬜️")
        print("⬜️💩💩💩💩💩⬜️⬜️⬜️💩💩💩⬜️💩💩💩💩⬜️⬜️💩💩💩💩⬜️⬜️⬜️⬜️💩💩💩💩⬜️⬜️⬜️")
        print("⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️")
        print("\(getFileName(with:file)).\(function).[\(line)]")
        print("⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️")
    }
    
    private class func printMessage(with messageText:String){
        if enabled {
            print("\(messageText)\n", terminator: "")
        }
    }
}
