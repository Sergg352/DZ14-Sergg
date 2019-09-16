//
//  LoaderData.swift
//  MyProject DZ14
//
//  Created by Sergey Gorshenin on 14/09/2019.
//  Copyright © 2019 Sergey Gorshenin. All rights reserved.
//

import Foundation

class LoaderTemp{
    static func loadtemp(completion: @escaping (JsonData?) -> Void){
        let url = URL(string: "https://api.darksky.net/forecast/f01ef2f066d4f4ab7a6df2f7d43ef3b8/55.755826,37.617?exclude=minutely,alerts,flags&lang=ru&units=auto")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                
                do { // старайтесь избегать опционалов и принудительного извлечения опционала, всегда делайте проверку на доступность действий.
                    let json = try JSONDecoder().decode(JsonData.self, from: data)
                    completion(json)
                }
                catch {
                    print(error)
                    completion(nil)
                }
            }
        }
        task.resume()
    }
}
