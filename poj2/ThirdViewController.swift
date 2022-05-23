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
    
    let dataFormat: DateFormatter = { let formaat: DateFormatter = DateFormatter()
        formaat.dateStyle = .medium
        return formaat
    }()
    @IBAction func didDataPickerValue(_sendr: UIDatePicker){
        let data: Date  = self.dataPicker.date
        let dataString: String = self.dataFormat.string(from: data)
        self.dataLable.text = dataString
        
    }
 
    @IBAction func dismissModalJoinButton(){
        ////self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        // 모달은 하나밖에없어서  바로 처음으로 돌아가야하는데 시뮬레이터 돌려보니 모달에서 다시 모달창으로 열리더라(네비게이터 생성해서 쇼로 이어줬음
        //self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func dismissModalCancelButton(){
        UesrInformation.shared.iD = ""
        UesrInformation.shared.password = ""
        //self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        // 모달은 하나밖에없어서  바로 처음으로 돌아가야하는데 시뮬레이터 돌려보니 모달에서 다시 모달창으로 열리더라(네비게이터 생성해서 쇼로 이어줬음)
        // 정상적이면 self.presntingViewControll....이코드는 안씀
        //self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func popBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        //여기서 네비게이션이 맞다면 이코드를 써서 이전화면으로 넘어가야하는데 모달로열여서 dismiss로 해놨어
        //self.dismiss(animated: true, completion: nil)
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
