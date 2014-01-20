//
//  SPLocationManager.h
//  SPLocationManager
//
//  Created by Kamil Burczyk on 20.01.2014.
//  Copyright (c) 2014 Sigmapoint. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

#define kNotificationLocationUpdated @"kNotificationLocationUpdated"

@interface SPLocationManager : NSObject <CLLocationManagerDelegate>

/**
 *  Last location captured after location service start
 */
@property (nonatomic, readonly) CLLocation *lastLocation;
@property (nonatomic, readonly) CLLocationAccuracy locationAccuracy;

/**
 *  Optional delegate to which didUpdateToLocation: callback is passed
 */
@property (nonatomic, weak) id<CLLocationManagerDelegate> delegate;


+ (SPLocationManager*) sharedInstance;
- (void) startLocationService;
- (void) stopLocationService;

@end
