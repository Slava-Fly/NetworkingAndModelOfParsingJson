//
//  ViewController.swift
//  NetworkingAndModelOfParsingJson
//
//  Created by User on 20.03.2023.
//

import UIKit


enum Alert {
    case success
    case failed
    
    var title: String {
        switch self {
        case .success:
            return "Success"
        case .failed:
            return "Failed"
        }
    }
    
    var message: String {
        switch self {
        case .success:
            return "You can see result in the Debug area"
        case .failed:
            return "You can see error in the Debug area"
        }
    }
}

final class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func runParcingOfJson(_ sender: UIButton) {
        getCharacter()
    }
    
    //MARK: - Private Methods
    private func showAlert(withStatus status: Alert) {
        let alert = UIAlertController(title: status.title, message: status.message, preferredStyle: .alert)
        let alertOkAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(alertOkAction)
        DispatchQueue.main.async { [unowned self] in
            present(alert, animated: true)
        }
    }
    
}

// MARK: - Networking
extension MainViewController {
    private func getCharacter() {
        let url = "https://rickandmortyapi.com/api/character/?page=19"
        
        guard let url = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data, let response else {
                print(error?.localizedDescription ?? "No error discription")
                return
            }
            let decoder = JSONDecoder()
            
            do {
                let character = try decoder.decode(RickAndMorty.self, from: data)
                print(character)
                self?.showAlert(withStatus: .success)
            } catch let error {
                print(error.localizedDescription)
                self?.showAlert(withStatus: .failed)
            }
            print(response)
        }.resume()
    }
}
    

