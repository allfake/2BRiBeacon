//
//  ALFViewController.h
//  HomeIBeacon
//
//  Created by allfake on 5/11/14.
//  Copyright (c) 2014 allfake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESTBeaconManager.h"

@interface ALFViewController : UIViewController <ESTBeaconManagerDelegate>

@property (nonatomic, strong) IBOutlet UIView *pubspaceView;
@property (nonatomic, strong) IBOutlet UIView *twobrView;
@property (nonatomic, strong) IBOutlet UIView *cubeView;
@property (nonatomic, strong) IBOutlet UIView *ingeneralShopView;
@property (nonatomic, strong) IBOutlet UIView *oyoriView;
@property (nonatomic, strong) IBOutlet UIView *opendreamView;
@property (nonatomic, strong) IBOutlet UIView *homteaView;
@property (nonatomic, strong) NSArray *placeView;
@property (nonatomic, strong) NSArray *beaconArray;
@property (nonatomic, strong) NSMutableArray *isActiveArray;

@property (nonatomic, strong) ESTBeacon         *beacon;
@property (nonatomic, strong) ESTBeaconManager  *beaconManager;
@property (nonatomic, strong) ESTBeaconRegion   *beaconRegion;


@end
