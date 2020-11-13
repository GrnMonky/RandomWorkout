//
//  HealthKitHelper.swift
//  RandomWorkout
//
//  Created by Landon Mann on 12/31/15.
//  Copyright © 2015 Ginkgo. All rights reserved.
//

import Foundation
import HealthKit

let HealthKitHelper = HealthKitManager()

class HealthKitManager{
    
    let healthKitStore:HKHealthStore = HKHealthStore()
    var healthKitAvailable = true;
    
    init(){
        authorizeHealthKit()
    }
    
    func Setup(){
        //This to make healthkit authorization happen before trying to save a workout
    }
    
    func authorizeHealthKit()
    {
        authorizeHealthKit { (authorized,  error) -> Void in
            if authorized {
                print("HealthKit authorization received.")
            }
            else
            {
                print("HealthKit authorization denied!")
                if error != nil {
                    print("\(String(describing: error))")
                }
            }
        }
    }
    
    func SaveBasicWorkout(start:NSDate, end:NSDate, interval:TimeInterval){
        
        guard healthKitAvailable else{ return }
        
        var workout: HKWorkout? = nil
        
        if #available(iOS 9.0, *) {
            workout = HKWorkout(activityType: .other, start: start as Date, end: end as Date, duration: interval, totalEnergyBurned: nil, totalDistance: nil, device: nil, metadata: nil)
        } else {
            workout = HKWorkout(activityType: .other, start: start as Date, end: end as Date)
        }
        
        // Save the workout before adding detailed samples.
        healthKitStore.save(workout!) { (success, error) -> Void in
            guard success else {
                // Perform proper error handling here...
                fatalError("*** An error occurred while saving the " +
                    "workout: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    func authorizeHealthKit(completion: ((_ success:Bool,_ error:Error?) -> Void)!)
    {
        // 1. Set the types you want to read from HK Store
        /*let healthKitTypesToRead = Set(arrayLiteral:
            HKObjectType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierDateOfBirth)!,
            HKObjectType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierBloodType)!,
            HKObjectType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierBiologicalSex)!,
            HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)!,
            HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeight)!,
            HKObjectType.workoutType()
            )*/
        
        // 2. Set the types you want to write to HK Store
        let healthKitTypesToWrite = Set(arrayLiteral:
            /*HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMassIndex)!,
            HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierActiveEnergyBurned)!,
            HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDistanceWalkingRunning)!,*/
            HKObjectType.workoutType()
            )
        
        // 3. If the store is not available (for instance, iPad) return an error and don't go on.
        if HKHealthStore.isHealthDataAvailable()
        {
            
        
        
        // 4.  Request HealthKit authorization
            healthKitStore.requestAuthorization(toShare: healthKitTypesToWrite, read: nil, completion: completion)
        }
        else
        {
            healthKitAvailable = false
        }
    }
}

