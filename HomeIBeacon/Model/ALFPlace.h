//
//  ALFPlace.h
//  HomeIBeacon
//
//  Created by allfake on 5/17/14.
//  Copyright (c) 2014 allfake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESTBeacon.h"

@interface ALFPlace : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) ESTBeacon *beacon;

@end
