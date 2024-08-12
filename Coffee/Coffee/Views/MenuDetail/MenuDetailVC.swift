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
    
    @IBOutlet weak var txtMilk: UITextField!
    @IBOutlet weak var txtTopping: UITextField!
    @IBOutlet weak var txtInstruction: UITextField!
    
    lazy var pickerView:UIPickerView = {
        let picker = UIPickerView()
        return picker
    
    }()
    
    var currentPickerType:PickerType?
    
    let milkOptions = ["Almond", "Oat", "Whole", "Skim"]
    let toppingOptions = ["Chocolate", "Caramel", "Vanilla", "Hazelnut"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupBindings()
    }
    
    private func setupViews(){
        
    }
    
    private func setupBindings(){
        btnSmall.addTarget(self, action: #selector(onChangeSize), for: .touchUpInside)
        btnMedium.addTarget(self, action: #selector(onChangeSize), for: .touchUpInside)
        btnLarge.addTarget(self, action: #selector(onChangeSize), for: .touchUpInside)
        
        pickerView.delegate = self
        pickerView.dataSource = self
        txtMilk.inputView = pickerView
        
    }

    @objc func onChangeSize(){
        print("Hello from Size")
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
