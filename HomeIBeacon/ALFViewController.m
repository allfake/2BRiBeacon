//
//  ALFViewController.m
//  HomeIBeacon
//
//  Created by allfake on 5/11/14.
//  Copyright (c) 2014 allfake. All rights reserved.
//

#import "ALFViewController.h"

@interface ALFViewController ()

@end

@implementation ALFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    /*
     * Place setup.
     */
    self.isActiveArray = [[NSMutableArray alloc] init];
    NSMutableArray *placeMutableArray = [[NSMutableArray alloc] init];
    for (int i = 1; i < 8; i++) {
        UIView *view = (UIView *)[self.view viewWithTag:i];
        [placeMutableArray addObject:view];
        [self.isActiveArray addObject:@(NO)];
    }
    
    self.placeView = [NSArray arrayWithArray:placeMutableArray];
    
    /*
     * BeaconManager setup.
     */
    self.beaconManager = [[ESTBeaconManager alloc] init];
    self.beaconManager.delegate = self;
    
    self.beaconRegion = [[ESTBeaconRegion alloc] initWithProximityUUID:ESTIMOTE_PROXIMITY_UUID
                                                            identifier:@"2br.region"];
    
    self.beaconRegion.notifyOnEntry = YES;
    self.beaconRegion.notifyOnExit = YES;
    
    [self.beaconManager startRangingBeaconsInRegion:self.beaconRegion];
}

#pragma mark - ESTBeaconManager delegate

- (void)beaconManager:(ESTBeaconManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(ESTBeaconRegion *)region
{
    for (ESTBeacon * beacon in beacons) {
        NSInteger index = [beacon.minor integerValue] - 1;
        if ([beacon.distance floatValue] <= 5.0f && [beacon.major integerValue] && [self.placeView objectAtIndex:index] && ![[self.isActiveArray objectAtIndex:index] integerValue]) {
            [self changeBackgroundForView:[self.placeView objectAtIndex:index] duration:3.f atIndex:index];
        }
    }
}

- (void)beaconManager:(ESTBeaconManager *)manager didEnterRegion:(ESTBeaconRegion *)region
{
    UILocalNotification *notification = [UILocalNotification new];
    notification.alertBody = @"Welcome to 2BR.";
    
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}

- (void)beaconManager:(ESTBeaconManager *)manager didExitRegion:(ESTBeaconRegion *)region
{
    UILocalNotification *notification = [UILocalNotification new];
    notification.alertBody = @"See you again.";
    
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}

#pragma mark - change backgrond color

- (void)changeBackgroundForView:(UIView *)view duration:(NSInteger)duraiton atIndex:(NSInteger)index
{
    [view setBackgroundColor:[UIColor redColor]];

    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:view, @"view", @(index), @"index" , nil];
    
    [self.isActiveArray setObject:@(1) atIndexedSubscript:index];
    
    [self performSelector:@selector(changeBackgroundToNormalView:) withObject:dic afterDelay:duraiton];
}

- (void)changeBackgroundToNormalView:(NSDictionary *)dic
{
    [[dic objectForKey:@"view"] setBackgroundColor:[UIColor colorWithRed:230.f/255.f green:230.f/255.f blue:230.f/255.f alpha:1.f]];
    
    NSNumber *index = [dic objectForKey:@"index"];
    [self.isActiveArray setObject:@(0) atIndexedSubscript:[index integerValue]];
}


@end
