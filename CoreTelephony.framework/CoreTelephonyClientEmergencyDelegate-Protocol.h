//
//     Generated by class-dump 3.5 (64 bit).
//
//  Copyright (C) 1997-2019 Steve Nygard.
//

#import <CoreTelephony/NSObject-Protocol.h>

@class CTEmergencyMode, CTXPCServiceSubscriptionContext;

@protocol CoreTelephonyClientEmergencyDelegate <NSObject>

@optional
- (void)normalEmergencyModeChanged:(CTXPCServiceSubscriptionContext *)arg1 mode:(CTEmergencyMode *)arg2;
- (void)emergencyModeChanged:(CTXPCServiceSubscriptionContext *)arg1 mode:(CTEmergencyMode *)arg2;
@end

