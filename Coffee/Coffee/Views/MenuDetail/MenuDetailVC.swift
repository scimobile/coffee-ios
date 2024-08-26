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

    @IBOutlet weak var btnFavourite: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var imgCoffee: UIImageView!
    @IBOutlet weak var lblCoffeeName: UILabel!
    @IBOutlet weak var lblCoffeePrice: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    //For Size
    @IBOutlet weak var btnSmall: UIButton!
    @IBOutlet weak var iconCup1: UIImageView!
    @IBOutlet weak var lblSmall: UILabel!
    
    @IBOutlet weak var btnMedium: UIButton!
    @IBOutlet weak var iconCup2: UIImageView!
    @IBOutlet weak var lblMedium: UILabel!
    
    @IBOutlet weak var btnLarge: UIButton!
    @IBOutlet weak var iconCup3: UIImageView!
    @IBOutlet weak var lblLarge: UILabel!
    
    //For Variation
    @IBOutlet weak var iconHot: UIImageView!
    @IBOutlet weak var lblHot: UILabel!
    @IBOutlet weak var iconCold: UIImageView!
    @IBOutlet weak var lblCold: UILabel!
    @IBOutlet weak var btnHot: UIButton!
    @IBOutlet weak var btnCold: UIButton!
    
    //For Sugar
    @IBOutlet weak var iconSugar1: UIImageView!
    @IBOutlet weak var lblNone: UILabel!
    @IBOutlet weak var btnNone: UIButton!
    @IBOutlet weak var iconSugar2: UIImageView!
    @IBOutlet weak var lbl30: UILabel!
    @IBOutlet weak var btn30: UIButton!
    @IBOutlet weak var iconSugar3: UIImageView!
    @IBOutlet weak var lbl50: UILabel!
    @IBOutlet weak var btn50: UIButton!
    
    @IBOutlet weak var lblSpecial: UILabel!
  
    //For Viwe
    @IBOutlet weak var viewSmall: UIView!
    @IBOutlet weak var viewMedium: UIView!
    @IBOutlet weak var viewLarge: UIView!
    @IBOutlet weak var viewHot: UIView!
    @IBOutlet weak var viewCold: UIView!
    @IBOutlet weak var viewNone: UIView!
    @IBOutlet weak var view30: UIView!
    @IBOutlet weak var view50: UIView!
    
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnAddtoCart: UIButton!
    @IBOutlet weak var lblCount: UILabel!
    
    @IBOutlet weak var txtView: UITextView!
    
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
        initialState()
        //ADD shadow to button view
        [viewSmall,viewMedium,viewLarge,viewHot,viewCold,viewNone,view30,view50].forEach { view in
            applyShadow(to: view)
        }
        
        txtView.layer.borderColor = UIColor.gray.cgColor
        txtView.layer.borderWidth = 0.5
        txtView.layer.cornerRadius = 5.0 // Optional: for rounded corners
        txtView.textColor = UIColor.lightGray
        txtView.text = placeHolder
        lblCount.text = String(count)
    }
    
    private func setupBindings(){
        [btnSmall,btnMedium,btnLarge,btnHot,btnCold,btnNone,btn30,btn50].addTarget(selector: #selector(onChangeSelection(_:)))
        
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
    
    
    func applyShadow(to view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor // Set shadow color
        view.layer.shadowOpacity = 0.3 // Set shadow opacity (0.0 to 1.0)
        view.layer.shadowOffset = CGSize(width: 0, height: 4) // Set shadow offset
        view.layer.shadowRadius = 5 // Set shadow blur radius
        view.layer.masksToBounds = false // Disable clipping to show shadow
        view.layer.cornerRadius = 10
    }
    
    func initialState(){
        //For Size
        updateSelection(
            selectedView: viewSmall,
            selectedIcon: iconCup1,
            selectedLabel: lblSmall,
            unselectedViews: [viewMedium, viewLarge],
            unselectedIcons: [iconCup2, iconCup3],
            unselectedLabels: [lblMedium, lblLarge],
            selectedImage: UIImage(named: IconState.cupSelected.imageName())!,
            unselectedImage: UIImage(named: IconState.cupUnselected.imageName())!
        )
        
       //For Variation
        updateSelection(selectedView: viewHot,
                           selectedIcon: iconHot,
                           selectedLabel: lblHot,
                           unselectedViews: [viewCold],
                           unselectedIcons: [iconCold],
                           unselectedLabels: [lblCold],
                           selectedImage: UIImage(named: IconState.hotSelected.imageName())!,
                           unselectedImage: UIImage(named: IconState.coldUnselected.imageName())!)
        
        //For Sugar
        updateSelection(selectedView: viewNone,
                        selectedIcon: iconSugar1,
                        selectedLabel: lblNone,
                        unselectedViews: [view30,view50],
                        unselectedIcons: [iconSugar2,iconSugar3],
                        unselectedLabels: [lbl30,lbl50],
                        selectedImage: UIImage(named: IconState.sugarSelected.imageName())!,
                        unselectedImage: UIImage(named: IconState.sugarUnselected.imageName())!)
    }

    func updateSelection(selectedView: UIView, selectedIcon: UIImageView, selectedLabel: UILabel, unselectedViews: [UIView], unselectedIcons: [UIImageView], unselectedLabels: [UILabel],selectedImage:UIImage,unselectedImage:UIImage) {
        // Update the selected view
        selectedView.backgroundColor = UIColor(named: "coffee-color")
        selectedIcon.image = selectedImage
        selectedLabel.textColor = .white
        
        // Update the unselected views
        unselectedViews.forEach { $0.backgroundColor = .white }
        unselectedIcons.forEach { $0.image = unselectedImage}
        unselectedLabels.forEach { $0.textColor = .black }
    }
    
    @objc func onChangeSelection(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            updateSelection(
                selectedView: viewSmall,
                selectedIcon: iconCup1,
                selectedLabel: lblSmall,
                unselectedViews: [viewMedium, viewLarge],
                unselectedIcons: [iconCup2, iconCup3],
                unselectedLabels: [lblMedium, lblLarge],
                selectedImage: UIImage(named: IconState.cupSelected.imageName())!,
                unselectedImage: UIImage(named: IconState.cupUnselected.imageName())!
            )
        case 2:
            updateSelection(
                selectedView: viewMedium,
                selectedIcon: iconCup2,
                selectedLabel: lblMedium,
                unselectedViews: [viewSmall, viewLarge],
                unselectedIcons: [iconCup1, iconCup3],
                unselectedLabels: [lblSmall, lblLarge],
                selectedImage: UIImage(named: IconState.cupSelected.imageName())!,
                unselectedImage: UIImage(named: IconState.cupUnselected.imageName())!
            )
            
        case 3:
            updateSelection(
                selectedView: viewLarge,
                selectedIcon: iconCup3,
                selectedLabel: lblLarge,
                unselectedViews: [viewSmall, viewMedium],
                unselectedIcons: [iconCup1, iconCup2],
                unselectedLabels: [lblSmall, lblMedium],
                selectedImage: UIImage(named: IconState.cupSelected.imageName())!,
                unselectedImage: UIImage(named: IconState.cupUnselected.imageName())!
            )
        case 4:
            updateSelection(selectedView: viewHot,
                            selectedIcon: iconHot,
                            selectedLabel: lblHot,
                            unselectedViews: [viewCold],
                            unselectedIcons: [iconCold],
                            unselectedLabels: [lblCold],
                            selectedImage: UIImage(named: IconState.hotSelected.imageName())!,
                            unselectedImage: UIImage(named: IconState.coldUnselected.imageName())!)
        case 5:
            updateSelection(selectedView: viewCold,
                            selectedIcon: iconCold,
                            selectedLabel: lblCold,
                            unselectedViews: [viewHot],
                            unselectedIcons: [iconHot],
                            unselectedLabels: [lblHot],
                            selectedImage: UIImage(named: IconState.coldSelected.imageName())!,
                            unselectedImage: UIImage(named: IconState.hotUnselected.imageName())!)
        case 6:
            updateSelection(selectedView: viewNone,
                            selectedIcon: iconSugar1,
                            selectedLabel: lblNone,
                            unselectedViews: [view30,view50],
                            unselectedIcons: [iconSugar2,iconSugar3],
                            unselectedLabels: [lbl30,lbl50],
                            selectedImage: UIImage(named: IconState.sugarSelected.imageName())!,
                            unselectedImage: UIImage(named: IconState.sugarUnselected.imageName())!)
        case 7:
            updateSelection(selectedView: view30    ,
                            selectedIcon: iconSugar2,
                            selectedLabel: lbl30,
                            unselectedViews: [viewNone,view50],
                            unselectedIcons: [iconSugar1,iconSugar3],
                            unselectedLabels: [lblNone,lbl50],
                            selectedImage: UIImage(named: IconState.sugarSelected.imageName())!,
                            unselectedImage: UIImage(named: IconState.sugarUnselected.imageName())!)
        case 8:
            updateSelection(selectedView: view50,
                            selectedIcon: iconSugar3,
                            selectedLabel: lbl50,
                            unselectedViews: [viewNone,view30],
                            unselectedIcons: [iconSugar1,iconSugar2],
                            unselectedLabels: [lblNone,lbl30],
                            selectedImage: UIImage(named: IconState.sugarSelected.imageName())!,
                            unselectedImage: UIImage(named: IconState.sugarUnselected.imageName())!)
        default:
            print("hello")
        }
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
        initialState()
    }
}
