//
//  AddAddressVC.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/22/24.
//

import UIKit

class AddAddressVC: UIViewController, Storyboarded {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblNav: UILabel!
    @IBOutlet weak var lblRecipientName: UILabel!
    @IBOutlet weak var tfRecipientName: UITextField!
    @IBOutlet weak var viewTfRecipientName: UIView!
    @IBOutlet weak var lblRecipientNameError: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var viewTfPhoneNumber: UIView!
    @IBOutlet weak var lblPhoneNumberError: UILabel!
    @IBOutlet weak var lblCityDistrict: UILabel!
    @IBOutlet weak var tfCityDistrict: UITextField!
    @IBOutlet weak var viewTfCityDistrict: UIView!
    @IBOutlet weak var lblCityDistrictError: UILabel!
    @IBOutlet weak var lblHouseStreet: UILabel!
    @IBOutlet weak var tfHouseStreet: UITextField!
    @IBOutlet weak var viewTfHouseStreet: UIView!
    @IBOutlet weak var lblHouseStreetError: UILabel!
    @IBOutlet weak var lblUnitFloor: UILabel!
    @IBOutlet weak var tfUnitFloor: UITextField!
    @IBOutlet weak var viewTfUnitFloor: UIView!
    @IBOutlet weak var lblNote: UILabel!
    @IBOutlet weak var tfNote: UITextField!
    @IBOutlet weak var viewTfNote: UIView!
    @IBOutlet weak var lblDefaultAddress: UILabel!
    @IBOutlet weak var lblOn: UILabel!
    @IBOutlet weak var lblOff: UILabel!
    @IBOutlet weak var imgOn: UIImageView!
    @IBOutlet weak var imgOff: UIImageView!
    @IBOutlet weak var btnOn: UIButton!
    @IBOutlet weak var btnOff: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    
    static var storyboardName: String = "Cart"
    
    private lazy var vm: AddAddressVM = .init(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        setUpFont()
        setUpBindings()
    }
    
    private func setUpViews() {
        [btnBack, imgOn, imgOff, btnSave].tintColor(.primary)
        [
            viewTfRecipientName,
            viewTfPhoneNumber,
            viewTfCityDistrict,
            viewTfHouseStreet,
            viewTfUnitFloor,
            viewTfNote
        ].addBorder()
        [
            lblRecipientNameError,
            lblPhoneNumberError,
            lblCityDistrictError,
            lblHouseStreetError
        ].textColor(color: .error)
        tfPhoneNumber.keyboardType = .namePhonePad
        clearError()
    }
    
    private func setUpFont() {
        [
            lblNav,
            lblRecipientName,
            lblPhoneNumber,
            lblCityDistrict,
            lblHouseStreet,
            lblUnitFloor,
            lblNote,
            lblDefaultAddress,
            lblOn,
            lblOff
        ].addFont(.popR15)
        [
            lblRecipientNameError,
            lblPhoneNumberError,
            lblCityDistrictError,
            lblHouseStreetError
        ].addFont(.popR13)
        [
            tfRecipientName,
            tfPhoneNumber,
            tfCityDistrict,
            tfHouseStreet,
            tfUnitFloor,
            tfNote,
        ].addFont(.popR14)
    }
    
    private func setUpBindings() {
        btnBack.addTarget(self, action: #selector(onTapBack), for: .touchUpInside)
        btnSave.isEnabled = false
        btnOn.addTarget(self, action: #selector(onTapOnOff), for: .touchUpInside)
        btnOff.addTarget(self, action: #selector(onTapOnOff), for: .touchUpInside)
        tfRecipientName.addTarget(self, action: #selector(onChangeRecipientName), for: .editingChanged)
        tfPhoneNumber.addTarget(self, action: #selector(onChangePhoneNumber), for: .editingChanged)
        tfCityDistrict.addTarget(self, action: #selector(onChangeCityDistinct), for: .editingChanged)
        tfHouseStreet.addTarget(self, action: #selector(onChangeHouseStreet), for: .editingChanged)
        tfUnitFloor.addTarget(self, action: #selector(onChangeUnitFloor), for: .editingChanged)
        tfNote.addTarget(self, action: #selector(onChangeNote), for: .editingChanged)
        btnSave.addTarget(self, action: #selector(onTapSave), for: .touchUpInside)
    }
    
    @objc func onTapBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func onTapSave() {
        //MARK: ToDo
        self.vm.save()
    }
    
    @objc func onChangeRecipientName() {
        self.vm.setRecipientName(recipientName: self.tfRecipientName.text)
    }
    
    @objc func onChangePhoneNumber() {
        self.vm.setPhoneNumber(phoneNumber: self.tfPhoneNumber.text)
    }
    
    @objc func onChangeCityDistinct() {
        self.vm.setCityDistinct(cityDistinct: self.tfCityDistrict.text)
    }
    
    @objc func onChangeHouseStreet() {
        self.vm.setHouseStreet(houseStreet: self.tfHouseStreet.text)
    }
    
    @objc func onChangeUnitFloor() {
        self.vm.setUnitFloor(unitFloor: self.tfUnitFloor.text)
    }
    
    @objc func onChangeNote() {
        self.vm.setNote(note: self.tfNote.text)
    }
    
    @objc func onTapOnOff(_ target: UIButton) {
        let isOn = target.tag == 1
        if self.vm.isDefaultAddress != isOn {
            self.imgOn.image = UIImage(systemName: isOn ? "circle.circle.fill" : "circle")
            self.imgOff.image = UIImage(systemName: !isOn ? "circle.circle.fill" : "circle")
            self.vm.setIsDefaultAddress(isDefaultAddress: isOn)
        }
    }
    
    private func setError(label: UILabel, error: String) {
        label.layer.opacity = 1
        label.text = error
    }
    
    private func clearError() {
        [
            lblRecipientNameError,
            lblPhoneNumberError,
            lblCityDistrictError,
            lblHouseStreetError,
            lblPhoneNumberError
        ].opacity(0)
    }
}

extension AddAddressVC: AddAddressVMDelegate {
    func onValidate(validationErrors: [AddAddressVM.FormInput]) {
        if validationErrors.count > 0 {
            btnSave.isEnabled = false
            clearError()
            validationErrors.forEach { input in
                switch input {
                case .RecipientNameTextField(let error):
                    setError(label: lblRecipientNameError, error: error)
                case .PhoneNumberTextField(let error):
                    setError(label: lblPhoneNumberError, error: error)
                case .CityDistinctTextField(let error):
                    setError(label: lblCityDistrictError, error: error)
                case .HouseNoTextField(let error):
                    setError(label: lblHouseStreetError, error: error)
                }
            }
        }
        else {
            btnSave.isEnabled = true
            clearError()
        }
    }
}
