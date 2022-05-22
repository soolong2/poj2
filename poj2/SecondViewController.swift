//
//  therdViewController.swift
//  poj2
//
//  Created by so on 2022/05/16.
//

import UIKit

class SecondViewController: UIViewController,UINavigationControllerDelegate {
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    @IBOutlet weak var idText: UITextField!
    
    @IBOutlet weak var editingButton: UIButton!
    @IBOutlet weak var pasText: UITextField!
    @IBOutlet weak var pasTextSam: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func dismissModal() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpSelctImageButton(_ sender: UIButton) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
        
        self.view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchButton(_ sender: UIButton) {
        UesrInformation.shared.ID = idText.text
        UesrInformation.shared.pas = pasText.text
    }
    
}
extension SecondViewController: UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let orginalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.imageView.image = orginalImage
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}
extension SecondViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
extension SecondViewController: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        if pasText.text == pasTextSam.text && idText.text != "" && pasText.text != "" {
            editingButton.isEnabled = true
        } else {
            editingButton.isEnabled = false
        }
    }
}

