//
//  FourViewController.swift
//  poj2
//
//  Created by so on 2022/05/16.
//

import UIKit

class ThirdViewController: UIViewController,UIGestureRecognizerDelegate {
    
    @IBOutlet weak var dataPicker: UIDatePicker!
    @IBOutlet weak var dataLable: UILabel!
    @IBOutlet weak var joinButton: UIButton!
    @IBAction func popBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
    @IBAction func dismissModalJoinButton(){
        
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func dismissModalCancelButton(){
        UesrInformation.shared.ID = ""
        UesrInformation.shared.pas = ""
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        joinButton.isEnabled = false
        
        
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
extension ThirdViewController: UITextFieldDelegate{
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        joinButton.isEnabled = false
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        joinButton.isEnabled = true
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
