//
//  CreateReceipeVC.swift
//  Receipz
//
//  Created by Arpita Bhatia on 9/7/16.
//  Copyright © 2016 Arpita Bhatia. All rights reserved.
//

import UIKit
import CoreData

class CreateReceipeVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var receipeTitle: UITextField!
    @IBOutlet weak var receipeIngredients: UITextField!
    @IBOutlet weak var receipeSteps: UITextField!
    @IBOutlet weak var receipeImg: UIImageView!
    @IBOutlet  weak var addReceipeButton: UIButton!
    
    var imagePicker: UIImagePickerController!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        receipeImg.layer.cornerRadius = 4.0
        receipeImg.clipsToBounds = true
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        receipeImg.image = image
        
    }
    
    @IBAction func addImage(sender: AnyObject!) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func createReceipe(sender:AnyObject!){
        
        if let title = receipeTitle.text where title != "" {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Receipe", inManagedObjectContext: context)!
            let receipe = Receipe(entity: entity, insertIntoManagedObjectContext: context)
            receipe.title = title
            receipe.ingredients = receipeIngredients.text
            receipe.steps = receipeSteps.text
            receipe.setReceipeImage(receipeImg.image!)
            
            context.insertObject(receipe)
            
            do {
                try context.save()
            } catch {
                print("Could not save receipe")
            }
            
            self.navigationController?.popViewControllerAnimated(true)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

  

}
