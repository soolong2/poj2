//
//  FourViewController.swift
//  poj2
//
//  Created by so on 2022/05/16.
//

import UIKit

class FourViewController: UIViewController,UIGestureRecognizerDelegate {
    
    @IBOutlet weak var dataPicker: UIDatePicker!
    @IBOutlet weak var dataLable: UILabel!
    @IBOutlet weak var gaButton: UIButton!
    @IBAction func dismassModal1(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    let dataFormat: DateFormatter = { let formaat: DateFormatter = DateFormatter()
        formaat.dateStyle = .medium
        return formaat
        }()
    @IBAction func didDataPickerValue(_sendr: UIDatePicker){
        print("tlqkf")
        let data: Date  = self.dataPicker.date
        let dataString: String = self.dataFormat.string(from: data)
        self.dataLable.text = dataString
      
    }
    @IBAction func dismissModal2(){
        
        UesrInformation.shared.ID
        
        UesrInformation.shared.pas
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    @IBAction func dismissModal23(){
        UesrInformation.shared.ID = ""
        UesrInformation.shared.pas = ""
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
        
        self.view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
}
extension FourViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        gaButton.isEnabled = false
    
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        gaButton.isEnabled = true
    }

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
