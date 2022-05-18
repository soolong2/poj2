//
//  therdViewController.swift
//  poj2
//
//  Created by so on 2022/05/16.
//

import UIKit

class therdViewController: UIViewController,UINavigationControllerDelegate {
    
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
    
    
    @IBAction func touchButton(_ sender: UIButton) {
        UesrInformation.shared.ID = idText.text
        UesrInformation.shared.pas = pasText.text
    }
    @IBAction func dismissModal() {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var imageView: UIImageView!
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
    
    
}
extension therdViewController: UIImagePickerControllerDelegate {
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
extension therdViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
extension therdViewController: UITextFieldDelegate{
    
    
    func  textFieldDidBeginEditing(_ textField: UITextField) {
        editingButton.isEnabled = false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if pasText.text == pasTextSam.text {
            editingButton.isEnabled = true
        }
    }
    
}

