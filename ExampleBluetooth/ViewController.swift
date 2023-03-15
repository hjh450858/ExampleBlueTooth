//
//  ViewController.swift
//  ExampleBluetooth
//
//  Created by 황재현 on 2023/03/15.
//

import UIKit
import CoreBluetooth




class ViewController: UIViewController {
    
    
    // 블루투스관련 매니저
    var centralManager: CBCentralManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
}



extension ViewController: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .unknown:
            print("central.state = unknown")
        case .resetting:
            print("central.state = resetting")
        case .poweredOn:
            print("central.state = poweredOn")
            // 스캔 시작
            centralManager.scanForPeripherals(withServices: nil)
        case .poweredOff:
            print("central.state = poweredOff")
        case .unauthorized:
            print("central.state = unauthorized")
        case .unsupported:
            print("central.state = unsupported")
        @unknown default:
            print("central.state = default")
        }
    }
    
    // 블루투스 감지
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("didDiscover - peripheral = \(peripheral)")
    }
    
    // 블루투스 연결 후
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("didConnect - peripheral = \(peripheral)")
        
    }
}
