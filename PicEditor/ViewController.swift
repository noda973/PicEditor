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
    var pan: UIPanGestureRecognizer!
    var pinch: UIPinchGestureRecognizer!

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var dogeView: UIImageView!
    @IBAction func pickButton(sender: UIButton) {
        picker = UIImagePickerController()
        picker.delegate = self;
        picker.allowsEditing = false
        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(picker, animated: true, completion: nil)
        
        
    }
    
    

    @IBAction func addDoge(sender: UIButton) {
        self.dogeView.hidden = false
        self.dogeView.userInteractionEnabled = true
        
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
        self.pan = UIPanGestureRecognizer()
        self.pinch = UIPinchGestureRecognizer()
        setupGesture()
        self.dogeView.hidden = true
        let dogeImg = UIImage(named: "doge.png")
        self.dogeView.image = dogeImg
        self.dogeView.sizeToFit()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recrea\ted.
    }
    
    func setupGesture() {
        println("yes")
        self.dogeView.addGestureRecognizer(self.pan)
        self.dogeView.addGestureRecognizer(self.pinch)
        self.pinch.addTarget(self, action:"pinched:")
        self.pan.addTarget(self, action:"panned:")
        
    }
    func panned(sender:UIPanGestureRecognizer) {
        println("panned")
        var translation = sender.translationInView(self.view)
        sender.view!.center = CGPointMake(sender.view!.center.x + translation.x, sender.view!.center.y + translation.y)
        sender.setTranslation(CGPointZero, inView: self.view)
        
    }
    
    func pinched(sender:UIPinchGestureRecognizer) {
        sender.view!.transform = CGAffineTransformScale(sender.view!.transform, sender.scale, sender.scale)
        sender.scale = 1
        println(sender.scale)
    }


}

