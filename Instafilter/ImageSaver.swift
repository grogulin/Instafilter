//
//  ImageSaver.swift
//  Instafilter
//
//  Created by Ярослав Грогуль on 27.02.2023.
//

import Foundation
import UIKit

class ImageSaver: NSObject {
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, context: UnsafeRawPointer) {
        print("Save finished!")
        
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
}
