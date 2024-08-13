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

class MenuDetailVC: UIViewController {

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
    
    
    @IBOutlet weak var txtMilk: UITextField!
    @IBOutlet weak var txtTopping: UITextField!
    @IBOutlet weak var txtInstruction: UITextField!
    
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
    
    
    lazy var pickerView:UIPickerView = {
        let picker = UIPickerView()
        return picker
    
    }()
    
    var count:Int = 0 {
        didSet{
            lblCount.text = "\(count)"
        }
    }
    
    var currentPickerType:PickerType?
    
    let milkOptions = ["Almond", "Oat", "Whole", "Skim"]
    let toppingOptions = ["Chocolate", "Caramel", "Vanilla", "Hazelnut"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupBindings()
    }
    
    private func setupViews(){
        initialState()
        //ADD shadow to button view
        [viewSmall,viewMedium,viewLarge,viewHot,viewCold,viewNone,view30,view50].forEach { view in
            applyShadow(to: view)
        }
        
    }
    
    private func setupBindings(){
        [btnSmall,btnMedium,btnLarge,btnHot,btnCold,btnNone,btn30,btn50].addTarget(selector: #selector(onChangeSelection(_:)))
        
        txtMilk.addTarget(self, action: #selector(onMilkTapped), for: .editingDidBegin)
        txtTopping.addTarget(self, action: #selector(onToppingTapped), for: .editingDidBegin)
        
        btnMinus.addTarget(self, action: #selector(decrementTapped), for: .touchUpInside)
        btnPlus.addTarget(self, action: #selector(incrementTapped), for: .touchUpInside)
        
        pickerView.delegate = self
        pickerView.dataSource = self
        txtMilk.inputView = pickerView
        txtTopping.inputView = pickerView
        
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
    
    @objc func onMilkTapped(){
        currentPickerType = .MILK
        pickerView.reloadAllComponents()
    }
    
    @objc func onToppingTapped(){
        currentPickerType = .TOPPING
        pickerView.reloadAllComponents()
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
            txtMilk.text = milkOptions[row]
        case .TOPPING:
            txtTopping.text = toppingOptions[row]
        default:
            print("Hello")
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
            return self.milkOptions.count
        case .TOPPING:
            return self.toppingOptions.count
         default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch currentPickerType {
        case .MILK:
            return self.milkOptions[row]
        case .TOPPING:
            return self.toppingOptions[row]
        default:
        return ""
        }
    }
    
    
}
