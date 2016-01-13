//
//  FxString.swift
//  Uber
//
//  Created by Benjamin on 1/3/16.
//  Copyright © 2016 Benjamin. All rights reserved.
//

import Foundation

struct FxString {
    /**
     把传入的字符串取第一个字符并转换成大写拼音返回
     
     - returns: 大写拼音首字母
     */
    static func firstCharactor(aString: String) -> String{
        let str = NSMutableString(string: aString)
        
        //先转为带声调的拼音
        //kCFStringTransformMandarinLatin或者kCFStringTransformToLati
        CFStringTransform(str as CFMutableString, nil, kCFStringTransformMandarinLatin, false)
        
        //再转换为不带声调的拼音（必须要先转有声调的拼音才可以使用这步，不然字符串不变）
        CFStringTransform(str as CFMutableString, nil, kCFStringTransformStripDiacritics, false)
        
        let pinyin = str.capitalizedString
        //    return (pinyin as NSString).substringToIndex(1)
        return pinyin[0..<1]
    }
}

extension String {
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.startIndex.advancedBy(r.startIndex)
            let endIndex = self.startIndex.advancedBy(r.endIndex)
            return self[Range(start: startIndex, end: endIndex)]
        }
    }
}