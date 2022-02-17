//
//  CurrencyManager.swift
//  Currency
//
//  Created by Macbook on 16.02.22.
//

import UIKit

protocol CurrencyManagerDelegate {
    func didUpdateCurrency(currencyManager: CurrencyManager, currency: CurrencyModel)
    func didFailWithError(error: Error)
}


struct CurrencyManager {
    
    var delegate: CurrencyManagerDelegate?
    
    func fetchJSON() {
        guard let url = URL(string: Constants.urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            
            guard let safeData = data else { return }
            
            do {
                if let currency = self.parseJSON(safeData) {
                    self.delegate?.didUpdateCurrency(currencyManager: self, currency: currency)
                } else {
                    print(error?.localizedDescription)
                }
            }
        }.resume()
    }
    
    func parseJSON(_ currencyData: Data) -> CurrencyModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CurrencyData.self, from: currencyData)
            let usd = decodedData.rates["USD"]
            let eur = decodedData.rates["EUR"]
            let byn = decodedData.rates["BYN"]
            let rub = decodedData.rates["RUB"]
            let baseCurrency = decodedData.base_code
            let currency = CurrencyModel(baseCurrency: baseCurrency, usd: usd!, eur: eur!, rub: rub!, byn: byn!)
            print(currency)
            return currency
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
