//
//  DataJson.swift
//  MyProject DZ14
//
//  Created by Sergey Gorshenin on 14/09/2019.
//  Copyright © 2019 Sergey Gorshenin. All rights reserved.
//

import Foundation

struct JsonData: Codable {
    let currently: CurrentlyData
    let hourly: HourlyData
    let daily: DailyData
}

struct CurrentlyData: Codable {
    let temperature: Double
}

struct HourlyData: Codable {
    let data: [DataHourlyItem]
}

struct DataHourlyItem: Codable {
    let temperature: Double
    let icon: String
}

struct DailyData: Codable {
    let data: [DataDailyItem]
}

struct DataDailyItem: Codable {
    let temperatureHigh: Double
    let temperatureHighTime: Int
    
}
