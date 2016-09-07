//
//  Receipe.swift
//  Receipz
//
//  Created by Arpita Bhatia on 9/5/16.
//  Copyright © 2016 Arpita Bhatia. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Receipe: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    func setReceipeImage(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getReceipeImage() -> UIImage {
        let img = UIImage(data: self.image!)!
        return img
    }

}
