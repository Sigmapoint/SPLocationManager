//
//  SPLocationManager.m
//  SPLocationManager
//
//  Created by Kamil Burczyk on 20.01.2014.
//  Copyright (c) 2014 Sigmapoint. All rights reserved.
//

#import "SPLocationManager.h"

@interface SPLocationManager ()

@property (nonatomic, assign) CLLocationAccuracy desiredAccuracy;

@end

@implementation SPLocationManager {
    CLLocationManager *locationManager;
}

+ (SPLocationManager*) sharedInstance {
    static SPLocationManager *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[SPLocationManager alloc] init];
        sharedInstance.desiredAccuracy = kCLLocationAccuracyKilometer;
        
    });
    return sharedInstance;
}

#pragma Location Manager
- (void)startLocationService {
    if (nil == locationManager) {
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        locationManager.desiredAccuracy = _desiredAccuracy;
    }
    
    [locationManager startUpdatingLocation];
}

- (void) stopLocationService {
    [locationManager stopUpdatingLocation];
}

#pragma mark CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    if (locations && locations.count > 0) {
        _lastLocation = [locations lastObject];
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationLocationUpdated object:_lastLocation];
        
        if (_delegate) {
            [_delegate locationManager:manager didUpdateLocations:locations];
        }
    }
}

@end
