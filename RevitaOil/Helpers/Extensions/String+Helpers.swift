//
//  String+Helpers.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 25/04/2024.
//

import UIKit

extension String {
    
    func substring(with nsrange: NSRange) -> Substring? {
        guard let range = Range(nsrange, in: self) else { return nil }
        return self[range]
    }
    
    var isImageExtension: Bool {
        let imageExtensions = ["png", "jpg", "jpeg", "gif", "bmp", "jfif", "PNG", "JPG", "JPEG", "GIF", "BMP", "JFIF"]
        return imageExtensions.contains(self.lowercased())
    }
    
    var isFileExtension: Bool {
        let fileExtensions = ["doc", "DOC", "docx", "DOCX", "pdf","PDF", "spreadsheet", "SPREADSHEET", "xlsx", "XLSX"]
        return fileExtensions.contains(self.lowercased())
    }
    
    var isvideoExtension: Bool {
        let videoExtension = ["mp4", "avi", "mkv", "m4a", "3gp", "mov"]
        return videoExtension.contains(self.lowercased())
    }
    
    var ismusicExtension: Bool {
        let musicExtension = ["mp3", "wav"]
        return musicExtension.contains(self.lowercased())
    }
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var urlSafeString: String {
        return self.replacingOccurrences(of: " ", with: "%20")
    }
    
    func isValidInput() -> Bool {
        if self == "" {
            return false
        }
        let text1 = self.replacingOccurrences(of: " ", with: "")
        if text1 == "" {
            return false
        }
        return true
    }
    
    func isValidPassword() -> Bool {
        let passwordRegEx = "^(?=.*[0-9])(?=.*[A-Z])(?=.*[-/:;()$&@\".,?!'\\[\\]{}#%^*+=_\\\\|~<>€£¥•])(?=\\S+$).{8,}$"
        let passTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passTest.evaluate(with: self)
    }
} 

extension String {
    func getAttributedString(fontName: String = "AvenirNext-Regular", fontSize: CGFloat = 16.0, lineHeight: CGFloat = 22.0, alignment: NSTextAlignment = .center) -> NSMutableAttributedString{
        let textString = NSMutableAttributedString(string: self, attributes: [
            NSAttributedString.Key.font: UIFont(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
        ])
        let textRange = NSRange(location: 0, length: textString.length)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight / fontSize
        paragraphStyle.alignment = alignment
        textString.addAttributes([NSAttributedString.Key.paragraphStyle : paragraphStyle], range: textRange)
        return textString
    }
    
    func isValidUrl() -> Bool {
            let regex = "((?:http|https)://)?(?:www\\.)?[\\w\\d\\-_]+\\.\\w{2,3}(\\.\\w{2})?(/(?<=/)(?:[\\w\\d\\-./_]+)?)?"
        //"http[s]?://(([^/:.[:space:]]+(.[^/:.[:space:]]+)*)|([0-9](.[0-9]{3})))(:[0-9]+)?((/[^?#[:space:]]+)([^#[:space:]]+)?(#.+)?)?"
            let test = NSPredicate(format:"SELF MATCHES %@", regex)
            let result = test.evaluate(with: self)
            return result
     }
}
