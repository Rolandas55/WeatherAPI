//
//  ViewController.swift
//  WeatherAPI
//
//  Created by kraujalis.rolandas on 10/11/2023.
//

import UIKit
import Alamofire

class WeatherViewController: UIViewController {
    
    enum WeatherImage: String {
        case sunny = "CellSunny"
        case rain = "CellRain"
        case snow = "CellSnow"
    }
    
    class Weather {
        var city: String
        var data: CurrentWeather?
        var background: WeatherImage
        
        init(city: String, data: CurrentWeather? = nil, background: WeatherImage = .sunny) {
            self.city = city
            self.data = data
            self.background = background
        }
    }
    
    @IBOutlet weak var weatherTableView: UITableView!
    @IBOutlet weak var locationtextField: UITextField!
    
    let apiHost = "weatherapi-com.p.rapidapi.com"
    let apiKey = ""
    let apiUrl = "https://weatherapi-com.p.rapidapi.com/current.json"
    var weatherArray: [Weather] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDefaultValues()
        loadWeatherData()
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func reloadButtonTapped(_ sender: Any) {
        loadWeatherData()
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        weatherTableView.isEditing.toggle()
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        if locationtextField.text == nil {
            return
        }
        let location = locationtextField.text!
        locationtextField.text = ""
        let headers:[String: String] = ["X-RapidAPI-Key": apiKey, "X-RapidAPI-Host": apiHost]
        let params:[String: String] = ["q": location]
        AF.request(apiUrl, method: .get, parameters: params, headers: HTTPHeaders(headers)).responseDecodable(of: CurrentWeather.self) {
            response in
            switch response.result {
            case .success(let value):
                self.weatherArray.append(Weather(city: location))
                self.loadWeatherData()
            case .failure(let error):
                let actionSheet = UIAlertController(title: "error", message: "could not load data for selected loaction.", preferredStyle: .actionSheet)
                actionSheet.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(actionSheet, animated: true)
            }
        }
    }
    
    func loadWeatherData() {
        if weatherArray.isEmpty {
            return
        }
        for val in weatherArray {
            let headers:[String: String] = ["X-RapidAPI-Key": apiKey, "X-RapidAPI-Host": apiHost]
            let params:[String: String] = ["q": val.city]
            AF.request(apiUrl, method: .get, parameters: params, headers: HTTPHeaders(headers)).responseDecodable(of: CurrentWeather.self) {
                response in
                switch response.result {
                case .success(let value):
                    do {
                        val.data = value
                        self.updateValues()
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func setBackground(_ index: Int) {
        if let precip = weatherArray[index].data?.current.precipMm {
            if precip > 0.0 {
                weatherArray[index].background = .sunny
            } else if weatherArray[index].data!.current.tempC! < 0 {
                weatherArray[index].background = .snow
            } else {
                weatherArray[index].background = .rain
            }
        }
    }
    
    func updateValues() {
        DispatchQueue.main.async {
            self.weatherTableView.reloadData()
        }
    }
    
    func addDefaultValues() {
        weatherArray.append(Weather(city: "Riga"))
        weatherArray.append(Weather(city: "Brazil"))
        weatherArray.append(Weather(city: "Kiev"))
        weatherArray.append(Weather(city: "Fairbanks"))
    }

}

extension WeatherViewController: UITableViewDelegate {}

extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? WeatherTableViewCell else {
            return UITableViewCell()
        }
        cell.cityLabel.text = weatherArray[indexPath.row].city
        if let data = weatherArray[indexPath.row].data {
            cell.tempLabel.text = "\(String(data.current.tempC!))C°"
        }
        self.setBackground(indexPath.row)
        cell.backgroundView = UIImageView(image: UIImage(named: weatherArray[indexPath.row].background.rawValue))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            weatherArray.remove(at: indexPath.row)
            weatherTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

