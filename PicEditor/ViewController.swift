//
//  ViewController.swift
//  PicEditor
//
//  Created by Paul Pan on 10/5/14.
//  Copyright (c) 2014 Paul Pan, Peter Lee. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var picker: UIImagePickerController!

    @IBOutlet var imageView: UIImageView!
    
    @IBAction func pickButton(sender: UIButton) {
        picker = UIImagePickerController()
        picker.delegate = self;
        picker.allowsEditing = false
        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(picker, animated: true, completion: nil)
        println("pen15")
        
    }
    
    

    @IBAction func cameraButton(sender: UIButton) {
        picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = false;
        picker.sourceType = UIImagePickerControllerSourceType.Camera
        self.presentViewController(picker, animated: true, completion: nil)
    

    }
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        var chosenImage: UIImage!
        println(editingInfo)
        println(image)
        chosenImage = image
        self.imageView.image = chosenImage
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

