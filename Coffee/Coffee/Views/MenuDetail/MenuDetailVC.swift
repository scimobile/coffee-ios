//
//  MenuDetailVC.swift
//  Coffee
//
//  Created by Sithu Win on 11/08/2024.
//

import UIKit

enum PickerType{
    case MILK
    case TOPPING
}

enum IconState: String {
    case cupSelected = "icon_solo_cup_selected"
    case cupUnselected = "icon_solo_cup_unselected"
    case hotSelected = "icon_host_spring_selected"
    case hotUnselected = "icon_host_spring_unselected"
    case coldSelected = "icon_snow_flake_selected"
    case coldUnselected = "icon_snow_flake_unselected"
    case sugarSelected = "icon_spoon_of_sugar_selected"
    case sugarUnselected = "icon_spoon_of_sugar_unseleted"
    
    func imageName() -> String {
        return self.rawValue
    }
}

class MenuDetailVC: UIViewController  {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var imgCoffee: UIImageView!
    @IBOutlet weak var lblCoffeeName: UILabel!
    @IBOutlet weak var lblCoffeePrice: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnAddtoCart: UIButton!
    @IBOutlet weak var lblCount: UILabel!
    
    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var btnFav: UIButton!
    
    //For Size
    @IBOutlet weak var btnSmall: UIButton!
    @IBOutlet weak var btnMedium: UIButton!
    @IBOutlet weak var btnLarge: UIButton!
    
    //For Varation
    @IBOutlet weak var btnHot: UIButton!
    @IBOutlet weak var btnCold: UIButton!
    
    //For Sugar
    @IBOutlet weak var btnNone: UIButton!
    @IBOutlet weak var btn30: UIButton!
    @IBOutlet weak var btn50: UIButton!
    
    //MilkView
    @IBOutlet weak var txtMilkpick: UITextField!
    @IBOutlet weak var btnMilk: UIButton!
    
    @IBOutlet weak var txtToppingpick: UITextField!
    @IBOutlet weak var btnTopping: UIButton!
    
    lazy var menuDetailVM:MenuDetailVM = .init(delegate: self)
    
    let placeHolder:String = "e.g. less ice"
    
    lazy var pickerView:UIPickerView = {
        let picker = UIPickerView()
        return picker
    
    }()
    
    func getToolbar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        
        // transparent
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        
        //UIbutton in toolbar
        let doneBtn = UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(doneBtnTapped))
        toolBar.setItems([doneBtn], animated: true)

        return toolBar
    }
    
    var count:Int = 1 {
        didSet{
            lblCount.text = "\(count)"
        }
    }
    
    var currentPickerType:PickerType?
    
    var milkOptions:[String]? = []
    var toppingOptions:[String]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupBindings()
        
        milkOptions = menuDetailVM.detail?.milk
        toppingOptions = menuDetailVM.detail?.topping
        
    }
    
    private func setupViews(){
        //ADD shadow to button view
        [btnSmall,btnMedium,btnLarge,btnHot,btnCold,btnNone,btn30,btn50].forEach { btnSize in
            applyShadow(to: btnSize)
        }
        
        txtView.layer.borderColor = UIColor.gray.cgColor
        txtView.layer.borderWidth = 0.5
        txtView.layer.cornerRadius = 5.0 // Optional: for rounded corners
        txtView.textColor = UIColor.lightGray
        txtView.text = placeHolder
        lblCount.text = String(count)
        
        btnSmall.tag = 1
        btnMedium.tag = 2
        btnLarge.tag = 3
        btnHot.tag = 4
        btnCold.tag = 5
        btnNone.tag = 6
        btn30.tag = 7
        btn50.tag = 8
        
    }
    
    private func setupBindings(){
        
        [btnSmall,btnMedium,btnLarge,btnHot,btnCold,btnNone,btn30,btn50].forEach { btnSize in
            btnSize?.addTarget(self, action: #selector(onChangeCupSize(_:)), for: .touchUpInside)
        }
        
        btnSmall.addTarget(self, action: #selector(onChangeSmall(_:)), for: .touchUpInside)
        
        btnFav.addTarget(self, action: #selector(onChangeFav), for: .touchUpInside)
        
        txtMilkpick.addTarget(self, action: #selector(onMilkChange), for: .editingDidBegin)
        txtToppingpick.addTarget(self, action: #selector(onToppingChange), for: .editingDidBegin)
        
        btnMinus.addTarget(self, action: #selector(decrementTapped), for: .touchUpInside)
        btnPlus.addTarget(self, action: #selector(incrementTapped), for: .touchUpInside)
        
        btnMilk.addTarget(self, action: #selector(showMilkPicker), for: .touchUpInside)
        btnTopping.addTarget(self, action: #selector(showToppingPicker), for: .touchUpInside)
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        txtMilkpick.delegate = self
        txtToppingpick.delegate = self
        
        txtView.delegate = self
        
    }

    @objc func onChangeCupSize(_ sender:UIButton){
        
        switch sender.tag {
        case 1:
            updateButtonStates(selectedBtn: btnSmall,
                               unselectedBtns: [btnMedium,btnLarge],
                               selectedImg: IconState.cupSelected.imageName(),
                               unselectedImg: IconState.cupUnselected.imageName())
        case 2:
            updateButtonStates(selectedBtn: btnMedium,
                               unselectedBtns: [btnSmall,btnLarge],
                               selectedImg: IconState.cupSelected.imageName(),
                               unselectedImg: IconState.cupUnselected.imageName())
        case 3:
            updateButtonStates(selectedBtn: btnLarge,
                               unselectedBtns: [btnSmall,btnMedium],
                               selectedImg: IconState.cupSelected.imageName(),
                               unselectedImg: IconState.cupUnselected.imageName())
        case 4:
            updateButtonStates(selectedBtn: btnHot,
                               unselectedBtns: [btnCold],
                               selectedImg: IconState.hotSelected.imageName(),
                               unselectedImg: IconState.coldUnselected.imageName())
        case 5:
            updateButtonStates(selectedBtn: btnCold,
                               unselectedBtns: [btnHot],
                               selectedImg: IconState.coldSelected.imageName(),
                               unselectedImg: IconState.hotUnselected.imageName())
        case 6:
            updateButtonStates(selectedBtn: btnNone,
                               unselectedBtns: [btn30,btn50],
                               selectedImg: IconState.sugarSelected.imageName(),
                               unselectedImg: IconState.sugarUnselected.imageName())
        case 7:
            updateButtonStates(selectedBtn: btn30,
                               unselectedBtns: [btnNone,btn50],
                               selectedImg: IconState.sugarSelected.imageName(),
                               unselectedImg: IconState.sugarUnselected.imageName())
        case 8:
            updateButtonStates(selectedBtn: btn50,
                               unselectedBtns: [btnNone,btn30],
                               selectedImg: IconState.sugarSelected.imageName(),
                               unselectedImg: IconState.sugarUnselected.imageName())
        default:
            print()
        }
    }
    
    @objc func onChangeFav(){
        menuDetailVM.onChangeFav()
    }
    
    private func updateButtonStates(selectedBtn:UIButton,
                                    unselectedBtns:[UIButton],
                                    selectedImg:String,
                                    unselectedImg:String){
        selectedBtn.setImage(UIImage(named: selectedImg), for: .selected)
        selectedBtn.setImage(UIImage(named: unselectedImg), for: .normal)
        selectedBtn.isSelected = true
        selectedBtn.tintColor = .coffee
        
        unselectedBtns.forEach { btn in
            btn.setImage(UIImage(named: unselectedImg), for: .normal)
            btn.setImage(UIImage(named: selectedImg), for: .selected)
            btn.isSelected = false
            btn.tintColor = .white
        }
        
    }
    
    @objc func onMilkChange(){
        showPicker(for: .MILK, textField: txtMilkpick)
    }
    
    @objc func onToppingChange(){
        showPicker(for: .TOPPING, textField: txtToppingpick)
    }
    
    func showPicker(for pickerType: PickerType, textField: UITextField) {
        currentPickerType = pickerType
        textField.inputView = pickerView
        textField.inputAccessoryView = getToolbar()
        pickerView.reloadAllComponents()
        textField.becomeFirstResponder()
    }

    @objc func showMilkPicker() {
        showPicker(for: .MILK, textField: txtMilkpick)
    }

    @objc func showToppingPicker() {
        showPicker(for: .TOPPING, textField: txtToppingpick)
    }
    
    @objc func doneBtnTapped(){
        switch currentPickerType {
        case .MILK:
            if (txtMilkpick.text == "" || ((txtMilkpick.text?.isEmpty) != nil)){
                txtMilkpick.text = milkOptions?[0]
            }
            txtMilkpick.resignFirstResponder()
        case .TOPPING:
            if (txtToppingpick.text == "" || ((txtToppingpick.text?.isEmpty) != nil)){
                txtToppingpick.text = toppingOptions?[0]
            }
            txtToppingpick.resignFirstResponder()
        default:
            print()
        }
    }
    
    
    func applyShadow(to view: UIButton) {
        view.layer.shadowColor = UIColor.black.cgColor // Set shadow color
        view.layer.shadowOpacity = 0.3 // Set shadow opacity (0.0 to 1.0)
        view.layer.shadowOffset = CGSize(width: 0, height: 4) // Set shadow offset
        view.layer.shadowRadius = 5 // Set shadow blur radius
        view.layer.masksToBounds = false // Disable clipping to show shadow
        view.layer.cornerRadius = 10
    }

    @objc func incrementTapped(){
        count += 1
    }
    
    @objc func decrementTapped(){
        if count > 0{
            count -= 1
        }
    }

}

extension MenuDetailVC:UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch currentPickerType {
        case .MILK:
            txtMilkpick.text = milkOptions?[row]
        case .TOPPING:
            txtToppingpick.text = toppingOptions?[row]
        default:
            print()
        }
    }
    
}

extension MenuDetailVC:UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch currentPickerType{
        case .MILK:
            return self.milkOptions?.count ?? 1
        case .TOPPING:
            return self.toppingOptions?.count ?? 1
         default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch currentPickerType {
        case .MILK:
            return self.milkOptions?[row]
        case .TOPPING:
            return self.toppingOptions?[row]
        default:
        return ""
        }
    }
    
}

extension MenuDetailVC:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        false
    }
}

extension MenuDetailVC:UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeHolder{
            textView.text = ""
            textView.textColor = UIColor.black
        }
        print(textView.text)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeHolder
            textView.textColor = UIColor.lightGray
        }
    }
}

extension MenuDetailVC : MenuDetailDelegate{
    func onGetMenuDetail() {
        
    }
}
