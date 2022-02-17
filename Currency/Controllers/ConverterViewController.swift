//
//  ViewController.swift
//  Currency
//
//  Created by Macbook on 15.02.22.
//

import UIKit

enum CurrencyService {
    case leftButton
    case rightButton
}

class ConverterViewController: UIViewController {

    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    @IBOutlet weak var leftFlagImage: UIImageView!
    @IBOutlet weak var rightFlagImage: UIImageView!
    @IBOutlet weak var leftFlagButton: UIButton!
    @IBOutlet weak var rightFlagButton: UIButton!
    @IBOutlet weak var leftCurrencyLabel: UILabel!
    @IBOutlet weak var rightCurrencyLabel: UILabel!
    @IBOutlet weak var leftTextField: UITextField!
    @IBOutlet weak var rightTextField: UITextField!
    var manager = CurrencyManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDelegate()
    }
    
    private func config() {
        createDelegate()
    }
    
    private func createDelegate() {
        manager.delegate = self
        leftTextField.delegate = self
        rightTextField.delegate = self
    }

    @IBAction func leftFlagPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: Constants.ListStoryboardID)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func rightFlagPressed(_ sender: UIButton) {
        print("right")
    }
    
    @IBAction func hideKeyboardTapGesture(_ sender: UITapGestureRecognizer) {
        
    }
}

extension ConverterViewController: CurrencyManagerDelegate {
    
    func didUpdateCurrency(currencyManager: CurrencyManager, currency: CurrencyModel) {
        print("ok")
    }
    
    func didFailWithError(error: Error) {
        let alert = UIAlertController(title: error.localizedDescription, message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            print("You choose OK")
        }))
        self.present(alert, animated: true)
    }
}

extension ConverterViewController: UITextFieldDelegate {
    
}

