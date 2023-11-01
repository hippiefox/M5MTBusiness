//
//  M5FileType.swift
//  M5MTBusiness
//
//  Created by pulei yu on 2023/10/31.
//

import Foundation
public enum M5Server_FileType: String {
    case directory
    case regular
    case diary
    case net_link

    public var name: String { rawValue }
}

public struct M5Model_KeyValue {
    public let key: String
    public let value: String
}

public enum M5FileType_Source {
    public static let video: [String] = ["mp4", "MP4", "avi", "AVI", "wmv", "WMV", "asf", "ASF", "asx", "ASX", "rm", "RM", "rM", "Rm", "rmvb", "RMVB", "mpg", "MPG", "mpeg", "MPEG", "mpe", "MPE", "3gp", "3GP", "mov", "MOV", "m4v", "M4V", "dat", "DAT", "mkv", "MKV", "flv", "FLV", "vob", "VOB", "ts", "TS"]
    public static let text: [String] = ["PDF", "pdf", "XLS", "xls", "XLSX", "xlsx", "ppt", "PPT", "pptx", "PPTX", "docx", "DOCX", "dox", "DOC", "doc", "TXT", "txt"]
    public static let audio: [String] = ["WMA", "wma", "FLAC", "flac", "APE", "ape", "WAV", "wav", "MP3", "mp3", "ogg", "OGG"]
    public static let image: [String] = ["jpg", "JPG", "jpeg", "JPEG", "png", "PNG", "heic", "HEIC"]
}

public enum M5FileType: String{
    case image
    case video
    case audio
    case txt
    case other
    case directory
    
    public static func type(from ext: String)-> M5FileType{
        if M5FileType_Source.video.contains(ext){   return .video}
        if M5FileType_Source.audio.contains(ext){   return .audio}
        if M5FileType_Source.text.contains(ext){   return .txt}
        if M5FileType_Source.image.contains(ext){   return .image}
        return .other
    }
    
    public static func type(of name: String)-> M5FileType{
        let ext = (name as NSString).pathExtension
        return type(from: ext)
    }
}
